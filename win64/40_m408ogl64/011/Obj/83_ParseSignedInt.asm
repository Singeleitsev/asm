;--------------------------------------------------------
;ParseSignedInt - parse a signed integer (decimal) at RSI
;Input: rsi = string pointer (at least one digit after optional sign)
;Output: eax = signed integer value, rsi = updated pointer
;---------------------------------------------------------
parseSignedInt proc
PROLOG 100h

call skipSpace

xor rcx,rcx ;ecx = 0 (positive)
cmp byte ptr[rsi],2Dh ;ASCII minus sign
jne lbl_Digits
mov rcx,1 ;rcx = 1 (negative)
inc rsi

lbl_Digits:
xor rax,rax ;rax = accumulator = 0
xor rdx,rdx

lbl_DigitLoop:
movzx edx,byte ptr[rsi] ;edx = zero-extended char
cmp dl,30h
jb lbl_Done
cmp dl,39h
ja lbl_Done
xor edx,30h ;edx = digit 0..9 (upper bits 0)
imul eax,eax,0Ah
add eax,edx
inc rsi
jmp lbl_DigitLoop

lbl_Done:
test rcx,rcx
jz lbl_End
neg rax

lbl_End:
EPILOG
parseSignedInt endp


