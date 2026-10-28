allocMtlBuffers proc

;1. Materials
mov eax,gnCount_newmtl
test eax,eax
jz @f
imul eax,eax,SIZE_NEWMTL_METADATA
push eax
push 8 ;HEAP_ZERO_MEMORY
push ghProcessHeap
call HeapAlloc
test eax,eax
jz lbl_Error
mov gpBuffer_newmtl,eax

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
allocMtlBuffers endp


