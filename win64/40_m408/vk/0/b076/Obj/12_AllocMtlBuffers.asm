allocMtlBuffers proc
PROLOG 100h

;1. Materials
mov r8d,gnCount_newmtl
test r8d,r8d
jz @f
imul r8,r8,SIZE_NEWMTL_METADATA
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rcx,ghProcessHeap
call HeapAlloc
test rax,rax
jz lbl_Error
mov gpBuffer_newmtl,rax

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
allocMtlBuffers endp


