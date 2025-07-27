;lbl_wmactivate:

;LoWord Can Be WA_INACTIVE, WA_ACTIVE, WA_CLICKACTIVE
cmp r8w,0 ;LOWORD(wParam) != WA_INACTIVE
je lblDeActivate

;The High-Order Word Specifies The Minimized State Of The Window Being Activated Or Deactivated
mov rax,r8
shr rax,10h ;Shift Right 16 bits
cmp ax,0 ;Not Minimized when HIWORD(wParam) = 0
jne lblDeActivate

lblSetActive:
mov fWinMainActive,1
xor eax,eax
jmp lbl_WndProc_End

lblDeActivate:
mov fWinMainActive,0
xor eax,eax
;lbl_WndProc_End

