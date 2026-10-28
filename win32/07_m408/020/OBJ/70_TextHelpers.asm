;--------------------------------
;skipSpace - Skip all non-printable characters
;Input: esi = source pointer
;Output: esi = updated source pointer
;--------------------------------
skipSpace proc

lbl_Check:
mov al,byte ptr[esi]
test al,al ;EndOfFile
jz lbl_Done
cmp al,21h ;Left ASCII Range Border
jl lbl_NextByte
cmp al,7Fh ;Right ASCII Range Border
jl lbl_Done

lbl_NextByte:
inc esi
jmp lbl_Check

lbl_Done:
ret
skipSpace endp


;------------------------------------------------------
;CompareStrings – compares two null-terminated strings
;Input:
;esi = source pointer
;edi = destination pointer
;Output:
;eax = 1 if equal
;eax = 0 if different
;-----------------------------------------
CompareStrings proc

;Store the input data
mov ecx,esi
mov edx,edi

lbl_CmpLoop:
mov al,byte ptr [ecx]
cmp al,byte ptr [edx]
jne lbl_Different
test al,al
jz lbl_Equal
inc ecx
inc edx
jmp lbl_CmpLoop

lbl_Equal:
mov eax,1
jmp lbl_Done

lbl_Different:
xor eax,eax

lbl_Done:
ret
CompareStrings endp


