BuildGeometry proc uses ebx esi edi
LOCAL nCurrentFaceIndex:DWORD, nCurrentVertex:DWORD

;gnTotalIndices = gnCurrent_f * 3 (triangles)
mov eax,gnCurrent_f
imul eax,eax,3
mov gnTotalIndices,eax

;allocate gpIndices: gnTotalIndices * 2 bytes
mov eax,gnTotalIndices
shl eax,2 ;* 4 bytes
push eax
push 8
push ghProcessHeap
call HeapAlloc
test eax,eax
jz bg_Error
mov gpIndices,eax

;allocate gpVertices: gnTotalIndices * 36 bytes (interleaved VNC)
mov eax,gnTotalIndices
imul eax,eax,STRIDE
push eax
push 8
push ghProcessHeap
call HeapAlloc
test eax,eax
jz bg_Error
mov gpVertices,eax
;gpNormals are offsets into gpVertices
mov eax,gpVertices
add eax,12
mov gpNormals,eax

;Fill the buffers
mov nCurrentFaceIndex,0
mov ebx,gpBuffer_f ;current face address
mov nCurrentVertex,0
mov edi,gpVertices ;VNC write pointer
mov esi,gpIndices ;index write pointer

bg_FaceLoop:
mov eax,nCurrentFaceIndex
cmp eax,gnCurrent_f
jge bg_Done

xor ecx,ecx ;group offset 0,12,24
bg_GroupLoop:
;v -> position
mov eax,[ebx+ecx+0] ;Read the current pos index
imul eax,eax,12 ;sizeof(vec3)
add eax,gpBuffer_v
mov edx,[eax+0] ;Write the current pos coord
mov [edi+0],edx
mov edx,[eax+4]
mov [edi+4],edx
mov edx,[eax+8]
mov [edi+8],edx

;vn -> normal
mov eax,[ebx+ecx+8] ;Read the current norm index
imul eax,eax,12 ;sizeof(vec3)
add eax,gpBuffer_vn
mov edx,[eax+0] ;Write the current norm coord
mov [edi+12],edx
mov edx,[eax+4]
mov [edi+16],edx
mov edx,[eax+8]
mov [edi+20],edx

;index
mov eax,nCurrentVertex
mov dword ptr[esi],eax
add esi,4

;Advance
add edi,STRIDE
inc nCurrentVertex
add ecx,12 ;sizeof(vec3)
cmp ecx,36 ;sizeof(face)
jl bg_GroupLoop

inc nCurrentFaceIndex
add ebx,36 ;sizeof(face)
jmp bg_FaceLoop

bg_Done:
mov eax,nCurrentVertex
mov gnTotalIndices,eax ;Update the global Counter
mov eax,1
ret

bg_Error:
call SpellError
xor eax,eax
ret

BuildGeometry endp




