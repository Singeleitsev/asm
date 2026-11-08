allocObjBuffers proc
PROLOG 100h

;1. Get the Process Heap since it's unconditional
call GetProcessHeap
test rax,rax
jz lbl_Error
mov ghProcessHeap,rax

;2. Material Libraries
xor r8,r8
mov r8d,gnCount_mtllib
test r8d,r8d
jz @f
imul r8d,r8d,SIZE_MTLLIB_METADATA
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_mtllib,rax

@@:
;3. Objects
xor r8,r8
mov r8d,gnCount_o
test r8d,r8d
jz @f
imul r8d,r8d,SIZE_OBJECT_METADATA
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_o,rax

@@:
;4. Groups
xor r8,r8
mov r8d,gnCount_g
test r8d,r8d
jz @f
imul r8d,r8d,SIZE_GROUP_METADATA
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_g,rax

@@:
;5. Used Materials
xor r8,r8
mov r8d,gnCount_usemtl
test r8d,r8d
jz @f
imul r8d,r8d,SIZE_USEMTL_METADATA
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_usemtl,rax

@@:
;6. Smoothing Groups
xor r8,r8
mov r8d,gnCount_s
test r8d,r8d
jz @f
imul r8d,r8d,SIZE_SMOOTHING_METADATA
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_s,rax

@@:
;7. Vertices
xor r8,r8
mov r8d,gnCount_v
test r8d,r8d
jz @f
imul r8d,r8d,12 ;3 coodrinates * 4 bytes
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_v,rax

@@:
;8. Normals
xor r8,r8
mov r8d,gnCount_vn
test r8d,r8d
jz @f
imul r8d,r8d,12 ;3 coodrinates * 4 bytes
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_vn,rax

@@:
;9. Texture Vectors
xor r8,r8
mov r8d,gnCount_vt
test r8d,r8d
jz @f
imul r8d,r8d,12 ;3 coodrinates * 4 bytes
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_vt,rax

@@:
;10. Faces
xor r8,r8
mov r8d,gnCount_f
test r8d,r8d
jz @f
imul r8d,r8d,36 ;3 vertices * 3 coodrinates * 4 bytes
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_f,rax

@@:
;Success
mov rax,1
jmp lbl_End

lbl_Error:
call SpellError
xor rax,rax
;jmp lbl_End

lbl_End:
EPILOG
allocObjBuffers endp


