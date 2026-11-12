;--------------------------------------------------
;WriteHexToLog - log a 32-bit value as 8 hex digits
;Input: ecx = value
;------------------
WriteHexToLog proc nNumber:QWORD
LOCAL buffer[9]:BYTE

PROLOG_PUSH 100h

lea rdi,buffer + 8
mov byte ptr[rdi],0 ;null terminator
mov rax,8 ;8 hex digits

lbl_NextDigit:
mov dl,cl
and dl,0Fh
cmp dl,0Ah ;10d
jl @f
add dl,7 ;10h -> 'A'

@@:
add dl,30h ;Hex to ACSII
dec rdi
mov byte ptr[rdi],dl
ror ecx,4 ;Next Digit
dec eax
jnz lbl_NextDigit

mov rcx,rdi
call WriteLog

EPILOG_POP
WriteHexToLog endp


