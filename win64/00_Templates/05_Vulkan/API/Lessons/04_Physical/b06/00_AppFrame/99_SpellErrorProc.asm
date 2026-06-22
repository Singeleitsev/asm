;99_SpellErrorProc.asm
SpellWinError proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

call GetLastError
mov gnLastError,eax ;Store Hex Error Code for safety
call SpellError

;Epilogue:
leave
ret
SpellWinError endp


SpellVkError proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Vulkan Functions return errors in RAX
mov gnLastError,eax ;Store Hex Error Code for safety
call SpellError

;Epilogue:
leave
ret
SpellVkError endp


SpellError proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov eax,gnLastError ;Restore Hex Error Code

lea rdi,szErrCode ; " Error: 0x00000000",13,10,0
add rdi,11h ;Shift to Last Digit
mov rcx,8 ;Set Counter

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

LOG_TEXT szErrCode

mov rcx,ghWndMain
lea rdx,szErrWarning
lea r8,szErr
xor r9,r9 ;MB_OK = 0
Call MessageBoxA

lbl_SpellError_End:
xor rax,rax
mov eax,gnLastError
;Epilogue:
leave
ret
SpellError endp
