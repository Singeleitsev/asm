SpellError proc
PROLOG_PUSH 100h

call GetLastError
mov gnLastError,eax ;Store the Hex Error Code for safety

lea rdi,szErrCode ; " Error: 0x00000000",13,10,0
add rdi,sizeof szErrCode-4 ;Shift to Last Digit
mov ecx,8 ;Set Counter

lbl_NextErrHexDigit:
mov bl,al ;Use bl as Buffer
and bl,0Fh ;Last Hex Digit Remains

;Convert Hex to ASCII
or bl,30h ;add bl,30h 
cmp bl,3Ah
jl lbl_StoreErrHexDigit

;If more than 9 then skip to ASCII Letters
add bl,7h ;3Ah + 7 = 41h

lbl_StoreErrHexDigit:
mov byte ptr [rdi],bl
shr eax,4
dec rdi
dec cl
cmp cl,0
jg lbl_NextErrHexDigit

lea rcx,szErrCode
call WriteLog

mov rcx,ghWnd
lea rdx,szErrWarning
lea r8,szError
xor r9,r9 ;MB_OK = 0
call MessageBoxA

lbl_SpellError_End:
mov eax,gnLastError
EPILOG_POP
SpellError endp



;wglGetLastError
