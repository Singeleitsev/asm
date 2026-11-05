BuildGeometry proc
PROLOG 100h

;gnTotalIndices = gnCurrent_f * 3 (triangles)
mov eax,gnCurrent_f
imul eax,eax,3
mov gnTotalIndices,eax

;allocate gpIndices: gnTotalIndices * 2 bytes
mov rcx,ghProcessHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalIndices
shl r8,2 ;* 4 bytes
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpIndices,rax

;allocate gpVertices: gnTotalIndices * 36 bytes (interleaved VNC)
mov rcx,ghProcessHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalIndices
imul r8,r8,36
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpVertices,rax
;gpNormals are offsets into gpVertices
mov rax,gpVertices
add rax,12
mov gpNormals,rax

;Fill the buffers
xor rbx,rbx ;face index
xor r10,r10 ;combined vertex count (= index)
mov rdi,gpVertices ;VNC write pointer
mov rsi,gpIndices ;index write pointer

lbl_FaceLoop:
cmp ebx,gnCurrent_f
jge lbl_Done

;rdx = gpBuffer_f+rbx * 36
mov rax,rbx
imul rax,rax,36
mov rdx,gpBuffer_f
add rdx,rax

xor rcx,rcx ;group offset 0,12,24
lbl_GroupLoop:
;v -> position
movsxd rax,dword ptr[rdx+rcx+0]
imul rax,rax,12
add rax,gpBuffer_v
mov r11d,dword ptr[rax+0]
mov dword ptr[rdi+0],r11d
mov r11d,dword ptr[rax+4]
mov dword ptr[rdi+4],r11d
mov r11d,dword ptr[rax+8]
mov dword ptr[rdi+8],r11d

;vn -> normal
movsxd rax,dword ptr[rdx+rcx+8]
imul rax,rax,12
add rax,gpBuffer_vn
mov r11d,dword ptr[rax+0]
mov dword ptr[rdi+12],r11d
mov r11d,dword ptr[rax+4]
mov dword ptr[rdi+16],r11d
mov r11d,dword ptr[rax+8]
mov dword ptr[rdi+20],r11d

;index
mov dword ptr[rsi],r10d
add rsi,4

;Advance
add rdi,36
inc r10
add rcx,12
cmp rcx,36
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


