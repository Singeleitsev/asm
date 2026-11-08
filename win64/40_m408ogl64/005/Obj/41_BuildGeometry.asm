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
imul r8,r8,STRIDE ;(3 pos + 3 norm + 4 color/alpha) * 4 bytes = 40 bytes
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
mov rdx,gpBuffer_f ;Current face address
mov gnCurrentVertex,0
mov rax,gpIndicesOpaque
mov rsiOpaque,rax
mov rax,gpIndicesTransparent
mov rsiTransparent,rax
mov rdi,gpInterleavedVNC ;VNC write pointer

lbl_FaceLoop:
mov eax,gnCurrentFaceIndex
cmp eax,gnCurrent_f
jge lbl_Done

;Color = Kd
call GetFaceMaterial ;eax = material index, uses ebx
cmp eax,gnCount_newmtl
jb lbl_HaveMat
xor rax,rax ;Default
lbl_HaveMat:
imul rax,rax,SIZE_NEWMTL_METADATA
add rax,gpBuffer_newmtl
lea r8,xmmCurrentColor
mov r9d,dword ptr[rax + OFFSET_KD + 0] ;r
mov dword ptr[r8+00h],r9d
mov r9d,dword ptr[rax + OFFSET_KD + 4] ;g
mov dword ptr[r8+04h],r9d
mov r9d,dword ptr[rax + OFFSET_KD + 8] ;b
mov dword ptr[r8+08h],r9d
mov r9d,dword ptr[rax + OFFSET_D] ;a
mov dword ptr[r8+0Ch],r9d

movd xmm0,r9d ;a
comiss xmm0,f32_posOne
jb lbl_TransparentFace
;Opaque
mov rsi,rsiOpaque
call WriteFace
add gnIndexCountOpaque,3
mov rsiOpaque,rsi
jmp lbl_FaceReady

lbl_TransparentFace:
mov rsi,rsiTransparent
call WriteFace
add gnIndexCountTransparent,3
mov rsiTransparent,rsi

lbl_FaceReady:
;Advance the Current Face Index and Address
inc gnCurrentFaceIndex
add rdx,36 ;((xv,yv,zv), (xvt,yvt,zvt), (xvn,yvn,zvn)) * 4 bytes
jmp lbl_FaceLoop

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


