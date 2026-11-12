;--------------------------------
;skipSpace - Skip all non-printable characters
;Input: rsi = source pointer
;Output: rsi = updated source pointer
;--------------------------------
skipSpace proc

lbl_Check:
mov al,byte ptr[rsi]
test al,al ;EndOfFile
jz lbl_Done
cmp al,21h ;Left ASCII Range Border
jl lbl_NextByte
cmp al,7Fh ;Right ASCII Range Border
jl lbl_Done

lbl_NextByte:
inc rsi
jmp lbl_Check

lbl_Done:
ret
skipSpace endp


;------------------------------------------------------
;compareStrings – compares two null-terminated strings
;Input:
;rsi = source pointer
;rdi = destination pointer
;Output:
;rax = 1 if equal
;rax = 0 if different
;-----------------------------------------
compareStrings proc

;Store the input data
mov rcx,rsi
mov rdx,rdi

lbl_CmpLoop:
mov al,byte ptr [rcx]
cmp al,byte ptr [rdx]
jne lbl_Different
test al,al
jz lbl_Equal
inc rcx
inc rdx
jmp lbl_CmpLoop

lbl_Equal:
mov rax,1
jmp lbl_Done

lbl_Different:
xor rax,rax

lbl_Done:
ret
compareStrings endp


