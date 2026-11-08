allocObjBuffers proc

;1. Get Process Heap since it's unconditional
call GetProcessHeap
test eax,eax
jz lbl_Error
mov ghProcessHeap,eax

;2. Material Libraries
mov eax,gnCount_mtllib
test eax,eax
jz @f
imul eax,eax,SIZE_MTLLIB_METADATA
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_mtllib,eax

@@:
;3. Objects
mov eax,gnCount_o
test eax,eax
jz @f
imul eax,eax,SIZE_OBJECT_METADATA
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_o,eax

@@:
;4. Groups
mov eax,gnCount_g
test eax,eax
jz @f
imul eax,eax,SIZE_GROUP_METADATA
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_g,eax

@@:
;5. Used Materials
mov eax,gnCount_usemtl
test eax,eax
jz @f
imul eax,eax,SIZE_USEMTL_METADATA
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_usemtl,eax

@@:
;6. Smoothing Groups
mov eax,gnCount_s
test eax,eax
jz @f
imul eax,eax,SIZE_SMOOTHING_METADATA
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_s,eax

@@:
;7. Vertices
mov eax,gnCount_v
test eax,eax
jz @f
imul eax,eax,12 ;3 coodrinates * 4 bytes
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_v,eax

@@:
;8. Normals
mov eax,gnCount_vn
test eax,eax
jz @f
imul eax,eax,12 ;3 coodrinates * 4 bytes
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_vn,eax

@@:
;9. Texture Vectors
mov eax,gnCount_vt
test eax,eax
jz @f
imul eax,eax,12 ;3 coodrinates * 4 bytes
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_vt,eax

@@:
;10. Faces
mov eax,gnCount_f
test eax,eax
jz @f
imul eax,eax,36 ;3 vertices * 3 coodrinates * 4 bytes
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_f,eax

@@:
;Success
mov eax,1
jmp lbl_End

lbl_Error:
call SpellError
xor eax,eax
;jmp lbl_End

lbl_End:
ret
allocObjBuffers endp


