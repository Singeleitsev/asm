;--------------------------------------------------------
; buildCombinedVertices – Parse faces and build deduplicated
; vertex list with positions + normals + UVs
; Input: gpDataVertices, gpDataNormals, gpDataTextureCoords
; Output: gpObjCombined (array of Vertex structs)
;         gpObjIndices (array of uint32_t)
;--------------------------------------------------------
buildCombinedVertices proc
LOCAL hHeap:QWORD,pCurrentSource:QWORD
LOCAL currentSubGroupIndex:DWORD
LOCAL faceIndex:DWORD,vertexCount:DWORD
LOCAL tempIndices[16]:DWORD ;Temp storage for face vertices
PROLOG 100h

call GetProcessHeap
test rax,rax
jz lbl_WinError
mov hHeap,rax

cmp gnTotalFaces,0
jle lbl_NoFaces

;Estimate combined vertex count (usually ~3x faces for triangles)
mov eax,gnTotalFaces
imul eax,eax,3 ;Max triangles
mov gnCurrentCombinedCount,0
mov gnCurrentIndexCount,0

;Allocate combined vertex buffer (conservative estimate)
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8
xor r8,r8
mov r8d,eax ;Estimated vertex count
imul r8,r8,32 ;sizeof(Vertex) = 3*4 + 3*4 + 2*4 = 32
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpObjCombined,rax
LOG_TEXT szOK

;Allocate index buffer (3 indices per face)
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalFaces
imul r8,r8,3
imul r8,r8,4 ;sizeof(uint32_t)
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpObjIndices,rax
LOG_TEXT szOK

;===================================================================
; Initialize face counters for each subgroup
;===================================================================
xor r11,r11
mov currentSubGroupIndex,r11d

lbl_InitFaceCounters:
mov eax,currentSubGroupIndex
imul eax,eax,SUBGROUP_METADATA_SIZE
add rax,gpDataSubGroups
add rax,OFFSET_SUBGROUP_FACES_COUNT
mov dword ptr[rax],0  ; Initialize face count to 0

inc currentSubGroupIndex
mov r11d,currentSubGroupIndex
cmp r11d,gnUniqueSubGroups
jl lbl_InitFaceCounters

;===================================================================
; Parse faces
;===================================================================
mov rcx,gpObjDataStart
mov pCurrentSource,rcx
xor r11,r11
mov faceIndex,r11d

; Start with first subgroup (material 0)
mov currentSubGroupIndex,0

lbl_NextLine:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Done

;===================================================================
; Check for "usemtl" token - switch current subgroup
;===================================================================
cmp dword ptr[rcx],6D657375h ;"usem" in reverse
jne lbl_CheckFace

; Found "usemtl" - find the subgroup index by name
add pCurrentSource,6 ;skip "usemtl"
mov rcx,pCurrentSource

; Use tempIndices as a string buffer
lea rdx,tempIndices
call parseString
mov pCurrentSource,rax

; Find subgroup index by the parsed name
lea rcx,tempIndices
call FindSubGroupByName
cmp eax,-1
je lbl_SubGroupNotFound
mov currentSubGroupIndex,eax
jmp lbl_SkipLine

lbl_SubGroupNotFound:
LOG_TEXT szErrSubGroupNotFound
mov currentSubGroupIndex,0
jmp lbl_SkipLine

;===================================================================
; Check for 'f' token (ONLY ONCE!)
;===================================================================
lbl_CheckFace:
cmp byte ptr[rcx],66h ;'f'
jne lbl_SkipLine
cmp byte ptr[rcx+1],20h ;space
je lbl_FoundFace
cmp byte ptr[rcx+1],9 ;tab
je lbl_FoundFace
jmp lbl_SkipLine

lbl_FoundFace:
add pCurrentSource,2 ;skip "f "
mov rcx,pCurrentSource
call skipSpace
mov rcx,rax

;Parse face vertex references
xor r8,r8 ;vertex counter
mov vertexCount,0

lbl_ParseVertexRef:
;Parse one vertex reference (v/vt/vn or v//vn or v/vt or v)
call skipSpace
mov rcx,rax

;Check if we're at end of line
cmp byte ptr[rcx],0Ah
je lbl_FaceDone
cmp byte ptr[rcx],0Dh
je lbl_FaceDone
test byte ptr[rcx],byte ptr
jz lbl_FaceDone

;Parse the reference
;First, get position index
call ParseSignedInt
mov ebx,eax ;position index (1-based)
mov r9,rcx ;save pointer after position

;Check for texture coordinate
cmp byte ptr[r9],2Fh ;'/'
jne lbl_NoTexture
inc r9
mov rcx,r9
call ParseSignedInt
mov r10d,eax ;texture index (1-based, can be 0)
mov r9,rcx

;Check for normal
cmp byte ptr[r9],2Fh ;'/'
je lbl_HasNormal
jmp lbl_StoreRef

lbl_HasNormal:
inc r9
mov rcx,r9
call ParseSignedInt
mov r11d,eax ;normal index (1-based)
mov r9,rcx
jmp lbl_StoreRef

lbl_NoTexture:
;Check for normal without texture (v//vn)
cmp byte ptr[r9],2Fh ;'/'
jne lbl_StoreRef
inc r9
cmp byte ptr[r9],2Fh ;'/'
jne lbl_StoreRef
inc r9
mov rcx,r9
call ParseSignedInt
mov r11d,eax ;normal index
mov r9,rcx

lbl_StoreRef:
;Store reference in temp array
mov eax,vertexCount
cmp eax,16 ;max face vertices
jge lbl_TooManyVerts

mov ecx,vertexCount
shl ecx,2
mov [tempIndices+ecx],ebx
mov [tempIndices+ecx+4],r10d
mov [tempIndices+ecx+8],r11d

inc vertexCount
mov rcx,r9
mov pCurrentSource,rcx
jmp lbl_ParseVertexRef

lbl_FaceDone:
;Triangulate face (fan triangulation)
cmp vertexCount,3
jl lbl_InvalidFace

;Triangle 0: vertices 0,1,2
mov eax,0
mov ebx,1
mov ecx,2
call AddTriangle

;Additional triangles for quads and n-gons
mov ecx,2
lbl_Triangulate:
cmp ecx,vertexCount
jge lbl_FaceComplete
sub ecx,1
mov eax,0
mov ebx,ecx
add ecx,1
mov r8d,ecx
call AddTriangle
mov ecx,r8d
inc ecx
jmp lbl_Triangulate

lbl_FaceComplete:
;===================================================================
; ? Increment face count for current subgroup
;===================================================================
mov eax,currentSubGroupIndex
imul eax,eax,SUBGROUP_METADATA_SIZE
add rax,gpDataSubGroups
add rax,OFFSET_SUBGROUP_FACES_COUNT
mov ebx,dword ptr[rax]
inc ebx
mov dword ptr[rax],ebx

inc faceIndex
jmp lbl_SkipLine

lbl_TooManyVerts:
LOG_TEXT szErrTooManyVerts
jmp lbl_SkipLine

lbl_InvalidFace:
LOG_TEXT szErrInvalidFace
jmp lbl_SkipLine

lbl_SkipLine:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Done

lbl_SkipToEOL:
mov al,byte ptr[rcx]
cmp al,0Ah
je lbl_SkipLF
cmp al,0Dh
je lbl_SkipCR
test al,al
jz lbl_Done
inc rcx
jmp lbl_SkipToEOL

lbl_SkipCR:
inc rcx
cmp byte ptr[rcx],0Ah
je lbl_SkipLF
jmp lbl_NextLine

lbl_SkipLF:
inc rcx
mov pCurrentSource,rcx
jmp lbl_NextLine

lbl_Done:
;===================================================================
; Trim buffers and free source data (existing code)
;===================================================================
; ... (your existing cleanup code) ...

LOG_TEXT szLogCombinedVertices
mov rcx,gnCurrentCombinedCount
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogIndicesCount
mov rcx,gnCurrentIndexCount
call WriteDecimalToLog
LOG_TEXT szCRLF

mov rax,1
jmp lbl_End

lbl_NoFaces:
LOG_TEXT szErrNoFaces
xor rax,rax

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
buildCombinedVertices endp

;--------------------------------------------------------
; AddTriangle - Add a triangle to combined buffers
; Input: EAX, EBX, ECX = vertex indices in tempIndices
;--------------------------------------------------------
AddTriangle proc
;EAX, EBX, ECX are vertex indices

;Get vertex 0 info
mov edx,eax
shl edx,2
mov edi,[tempIndices+edx] ;pos
mov esi,[tempIndices+edx+4] ;tex
mov r8d,[tempIndices+edx+8] ;norm

;Call FindOrAddCombinedVertex
call FindOrAddCombinedVertex
mov r9d,eax ;index of vertex 0

;Get vertex 1
mov edx,ebx
shl edx,2
mov edi,[tempIndices+edx]
mov esi,[tempIndices+edx+4]
mov r8d,[tempIndices+edx+8]
call FindOrAddCombinedVertex
mov r10d,eax

;Get vertex 2
mov edx,ecx
shl edx,2
mov edi,[tempIndices+edx]
mov esi,[tempIndices+edx+4]
mov r8d,[tempIndices+edx+8]
call FindOrAddCombinedVertex
mov r11d,eax

;Add indices to index buffer
mov rax,gpObjIndices
mov edx,gnCurrentIndexCount
shl edx,2
add rax,rdx
mov [rax],r9d
mov [rax+4],r10d
mov [rax+8],r11d

add gnCurrentIndexCount,3
ret
AddTriangle endp

;--------------------------------------------------------
; FindOrAddCombinedVertex - Find existing vertex or add new
; Input: EDI=posIdx, ESI=texIdx, R8D=normIdx
; Output: EAX = combined vertex index
;--------------------------------------------------------
FindOrAddCombinedVertex proc
;Save registers
push rbx
push rcx
push rdx
push rsi
push rdi
push r8
push r9
push r10
push r11

;Get vertex data
mov eax,edi ;posIdx
dec eax ;convert to 0-based
imul eax,eax,12
add rax,gpDataVertices
movss xmm0,dword ptr[rax]
movss xmm1,dword ptr[rax+4]
movss xmm2,dword ptr[rax+8]

;Get normal data
mov eax,r8d ;normIdx
dec eax
cmp eax,-1
jl @f ;No normal
imul eax,eax,12
add rax,gpDataNormals
movss xmm3,dword ptr[rax]
movss xmm4,dword ptr[rax+4]
movss xmm5,dword ptr[rax+8]
jmp lbl_HaveNormal

@@:
xorps xmm3,xmm3 ;Default normal (0,0,0)
xorps xmm4,xmm4
xorps xmm5,xmm5

lbl_HaveNormal:
;Get texture data
mov eax,esi ;texIdx
dec eax
cmp eax,-1
jl @f ;No tex
imul eax,eax,8
add rax,gpDataTextureCoords
movss xmm6,dword ptr[rax]
movss xmm7,dword ptr[rax+4]
jmp lbl_HaveTex

@@:
xorps xmm6,xmm6 ;Default tex (0,0)
xorps xmm7,xmm7

lbl_HaveTex:
;Search existing combined vertices
xor rbx,rbx ;index counter
mov ecx,gnCurrentCombinedCount
test ecx,ecx
jz lbl_AddNew

mov rdx,gpObjCombined

lbl_SearchLoop:
cmp rbx,rcx
jge lbl_AddNew

;Compare position
mov rax,rdx
movss xmm8,dword ptr[rax]
movss xmm9,dword ptr[rax+4]
movss xmm10,dword ptr[rax+8]

subss xmm8,xmm0
subss xmm9,xmm1
subss xmm10,xmm2

;Check if all position components are close
movmskps r10d,xmm8
test r10d,r10d
jnz lbl_NextVertex
movmskps r10d,xmm9
test r10d,r10d
jnz lbl_NextVertex
movmskps r10d,xmm10
test r10d,r10d
jnz lbl_NextVertex

;Compare normal
cmp r8d,-1
jl lbl_CompareTex ;No normal, skip normal check

add rax,12
movss xmm8,dword ptr[rax]
movss xmm9,dword ptr[rax+4]
movss xmm10,dword ptr[rax+8]

subss xmm8,xmm3
subss xmm9,xmm4
subss xmm10,xmm5

movmskps r10d,xmm8
test r10d,r10d
jnz lbl_NextVertex
movmskps r10d,xmm9
test r10d,r10d
jnz lbl_NextVertex
movmskps r10d,xmm10
test r10d,r10d
jnz lbl_NextVertex

lbl_CompareTex:
;Compare texture coordinates
add rax,12
movss xmm8,dword ptr[rax]
movss xmm9,dword ptr[rax+4]

subss xmm8,xmm6
subss xmm9,xmm7

movmskps r10d,xmm8
test r10d,r10d
jnz lbl_NextVertex
movmskps r10d,xmm9
test r10d,r10d
jnz lbl_NextVertex

;Found match!
mov eax,ebx
jmp lbl_Done

lbl_NextVertex:
add rdx,32 ;sizeof(Vertex)
inc rbx
jmp lbl_SearchLoop

lbl_AddNew:
;Add new vertex
mov eax,gnCurrentCombinedCount
cmp eax,gnTotalFaces * 3
jge lbl_CapacityError

mov rdx,gpObjCombined
imul rax,32
add rdx,rax

;Store position
movss dword ptr[rdx],xmm0
movss dword ptr[rdx+4],xmm1
movss dword ptr[rdx+8],xmm2

;Store normal
movss dword ptr[rdx+12],xmm3
movss dword ptr[rdx+16],xmm4
movss dword ptr[rdx+20],xmm5

;Store texture
movss dword ptr[rdx+24],xmm6
movss dword ptr[rdx+28],xmm7

mov eax,gnCurrentCombinedCount
inc gnCurrentCombinedCount
jmp lbl_Done

lbl_CapacityError:
LOG_TEXT szErrOBJCapacity
mov eax,-1

lbl_Done:
pop r11
pop r10
pop r9
pop r8
pop rdi
pop rsi
pop rdx
pop rcx
pop rbx
ret
FindOrAddCombinedVertex endp


;--------------------------------------------------------
; FindSubGroupByName - Find subgroup index by name
; Input: RCX = pointer to material name
; Output: EAX = subgroup index, or -1 if not found
;--------------------------------------------------------
FindSubGroupByName proc
PROLOG 100h

xor r8,r8 ; index counter
mov r9d,gnUniqueSubGroups

lbl_Loop:
cmp r8d,r9d
jge lbl_NotFound

mov eax,r8d
imul eax,eax,SUBGROUP_METADATA_SIZE
add rax,gpDataSubGroups
mov rdx,rax

call CompareStrings
test eax,eax
jz lbl_Next

mov eax,r8d ; Found!
jmp lbl_Done

lbl_Next:
inc r8d
jmp lbl_Loop

lbl_NotFound:
mov eax,-1

lbl_Done:
EPILOG
FindSubGroupByName endp

