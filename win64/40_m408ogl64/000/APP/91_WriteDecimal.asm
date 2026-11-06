WriteDecimalToLog proc nNumber:QWORD
LOCAL buffer[32]:BYTE

PROLOG_PUSH 100h

mov eax,ecx ;nNumber

lea rdi, buffer + 31
mov byte ptr[rdi],0 ;null terminator
mov ecx,0Ah ;Divisor = 10
test eax,eax
jnz @f

dec rdi
mov byte ptr [rdi],30h ;0
jmp lbl_Write

@@:
xor edx,edx
div ecx
or dl,30h ;Hex to ACSII
dec rdi
mov byte ptr[rdi],dl
test eax,eax
jnz @b

lbl_Write:
mov rcx,rdi
call WriteLog

EPILOG_POP
WriteDecimalToLog endp