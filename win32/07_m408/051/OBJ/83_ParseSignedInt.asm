;---------------------------------------------------------
;ParseSignedInt - parse a signed integer (decimal) at RSI
;Input: esi = string pointer (at least one digit after optional sign)
;Output: eax = signed integer value, esi = updated pointer
;----------------------------------
ParseSignedInt proc

call skipSpace

xor ecx,ecx ;ecx = 0 (positive)
cmp byte ptr[esi],2Dh ;ASCII minus sign
jne lbl_Digits
mov ecx,1 ;ecx = 1 (negative)
inc esi

lbl_Digits:
xor eax,eax ;eax = accumulator = 0

lbl_DigitLoop:
movzx edx,byte ptr[esi] ;edx = zero-extended char
cmp dl,30h
jb lbl_Done
cmp dl,39h
ja lbl_Done
xor edx,30h ;edx = digit 0..9 (upper bits 0)
imul eax,eax,0Ah
add eax,edx
inc esi
jmp lbl_DigitLoop

lbl_Done:
test ecx,ecx
jz @f
neg eax
@@:
ret
ParseSignedInt endp

