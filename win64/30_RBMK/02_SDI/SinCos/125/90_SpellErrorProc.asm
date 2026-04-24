SpellError proc lpszErrText:QWORD, lpszErrCode:QWORD

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Store the Received Values
mov lpszErrText,rcx ;Warning
mov lpszErrCode,rdx ;Container for Error Code

Call GetLastError
mov nLastError,eax ;Store Hex Error Code

mov rdi,lpszErrCode
add rdi,3 ;Shift to Last Digit
mov rcx,4 ;Set Counter

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
shr rax,4
dec rdi
dec cl
cmp cl,0
jg lbl_NextErrHexDigit

mov rcx,ghWnd
mov rdx,lpszErrText
lea r8,szErr
xor r9,r9 ;MB_OK = 0
Call MessageBoxA

;Epilogue:
leave
ret
SpellError endp


