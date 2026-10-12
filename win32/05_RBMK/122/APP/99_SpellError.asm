SpellError proc

call GetLastError
mov gnLastError,eax ;Store the Hex Error Code for safety

lea edi,szErrCode ; " Error: 0x00000000",13,10,0
add edi,sizeof szErrCode-4 ;Shift to Last Digit
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
mov byte ptr [edi],bl
shr eax,4
dec edi
dec cl
cmp cl,0
jg lbl_NextErrHexDigit

invoke WriteLog,offset szErrCode

push 0 ;MB_OK
push offset szError
push offset szErrWarning
push ghWnd
call MessageBoxA

lbl_SpellError_End:
mov eax,gnLastError
ret
SpellError endp



;wglGetLastError
