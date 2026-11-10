BuildGeometry proc
PROLOG 100h

;gnTotalIndices = gnCurrent_f * 3 (triangles)
mov eax,gnCurrent_f
imul eax,eax,3
mov gnTotalIndices,eax

;Allocate gpInterleavedVNC: gnTotalIndices * STRIDE
mov rcx,ghProcessHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalIndices
imul r8,r8,STRIDE
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpInterleavedVNC,rax

;Allocate gpIndicesOpaque: gnTotalIndices * sizeof(face_index)
mov rcx,ghProcessHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalIndices
shl r8,2 ;* 4 bytes
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpIndicesOpaque,rax

;Allocate gpIndicesTransparent: gnTotalIndices * sizeof(face_index)
mov rcx,ghProcessHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalIndices
shl r8,2 ;* 4 bytes
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpIndicesTransparent,rax

;Fill the buffers
mov gnCurrentFaceIndex,0
mov rcx,gpBuffer_f ;rcx = Current face address (to read from)
mov gnCurrentVertex,0
mov rax,gpIndicesOpaque
mov rsiOpaque,rax
mov rax,gpIndicesTransparent
mov rsiTransparent,rax
mov rdi,gpInterleavedVNC ;VNC write pointer

lbl_NextFace:
mov eax,gnCurrentFaceIndex
cmp eax,gnCurrent_f
jge lbl_Done

;Color = Kd
call GetFaceMaterial ;eax = material index
cmp eax,gnCount_newmtl
jb lbl_HaveMat
xor rax,rax ;Fall back to Default
lbl_HaveMat:
imul rax,rax,SIZE_NEWMTL_METADATA
mov rdx,gpBuffer_newmtl
add rdx,rax ;rdx = Current material address (to read from)

;Get Alpha to xmm0[0]
movss xmm0,dword ptr[rdx + OFFSET_KD + 12] ;Alpha
comiss xmm0,f32_posOne
jb lbl_TransparentFace
;Opaque
mov rsi,rsiOpaque
call WriteFace
add gnIndexCountOpaque,3
mov rsiOpaque,rsi
jmp lbl_FaceDone

lbl_TransparentFace:
mov rsi,rsiTransparent
call WriteFace
add gnIndexCountTransparent,3
mov rsiTransparent,rsi

lbl_FaceDone:
;Advance the Current Face Index and Address
inc gnCurrentFaceIndex
add rcx,SIZE_FACE
jmp lbl_NextFace

lbl_Done:
mov eax,gnCurrentVertex
mov gnTotalIndices,eax ;Update the global Counter
mov rax,1
jmp lbl_End

lbl_Error:
call SpellError
xor rax,rax
;jmp lbl_End

lbl_End:
EPILOG
BuildGeometry endp


