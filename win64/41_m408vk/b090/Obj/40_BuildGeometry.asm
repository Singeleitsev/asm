BuildGeometry proc
PROLOG 100h

;gnTotalIndices = gnCurrent_f * 3 (triangles)
mov eax,gnCurrent_f
imul eax,eax,3
mov gnTotalIndices,eax

;allocate gpIndices: gnTotalIndices * 4 bytes
mov rcx,ghProcessHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalIndices
shl r8,2 ;* 4 bytes
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpIndices,rax

;allocate gpVertices: gnTotalIndices * STRIDE
mov rcx,ghProcessHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalIndices
imul r8,r8,STRIDE ;(3 coordinates + 3 normals) * 4 bytes = 24 bytes
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpVertices,rax
;gpNormals are offsets into gpVertices
mov rax,gpVertices
add rax,12 ;sizeof(vec3)
mov gpNormals,rax

;Fill the buffers
xor rbx,rbx ;face_index
xor r10,r10 ;combined vertex count (= index)
mov rdi,gpVertices ;Vertex write pointer
mov rsi,gpIndices ;Index write pointer

lbl_FaceLoop:
cmp ebx,gnCurrent_f
jge lbl_Done

;rdx = gpBuffer_f + face_index * sizeof(face)
mov rax,rbx
imul rax,rax,36 ;((xv,yv,zv), (xvt,yvt,zvt), (xvn,yvn,zvn)) * 4 bytes
mov rdx,gpBuffer_f
add rdx,rax

xor rcx,rcx ;group offset 0,12,24
lbl_GroupLoop:
;v -> position
movsxd rax,dword ptr[rdx+rcx+0]
imul rax,rax,12 ;sizeof(vec3)
add rax,gpBuffer_v
mov r11d,dword ptr[rax+0]
mov dword ptr[rdi+0],r11d
mov r11d,dword ptr[rax+4]
mov dword ptr[rdi+4],r11d
mov r11d,dword ptr[rax+8]
mov dword ptr[rdi+8],r11d

;vn -> normal
movsxd rax,dword ptr[rdx+rcx+8]
imul rax,rax,12 ;sizeof(vec3)
add rax,gpBuffer_vn
mov r11d,dword ptr[rax+0]
mov dword ptr[rdi+12],r11d
mov r11d,dword ptr[rax+4]
mov dword ptr[rdi+16],r11d
mov r11d,dword ptr[rax+8]
mov dword ptr[rdi+20],r11d

;Advance the index
mov dword ptr[rsi],r10d
add rsi,4 ;sizeof(face_index)

;Advance the cursor
add rdi,STRIDE
inc r10 ;combined vertex count (= index)
add rcx,12 ;sizeof(vec3)
cmp rcx,36 ;sizeof(face)
jl lbl_GroupLoop

inc rbx
jmp lbl_FaceLoop

lbl_Done:
mov gnTotalIndices,r10d
mov rax,1
jmp lbl_End


lbl_Error:
call SpellError
xor rax,rax
;jmp lbl_End

lbl_End:
EPILOG
BuildGeometry endp


