;--------------------------------
;skipSpace - Skip spaces and tabs
;--------------------------------
skipSpace proc
cmp byte ptr[rcx],20h ;Space
je @f
cmp byte ptr[rcx],9 ;Tab
jne lbl_Done
@@:
inc rcx
jmp skipSpace
lbl_Done:
mov rax,rcx
ret
skipSpace endp

