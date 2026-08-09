WriteDecimalToLog proc
LOCAL buffer[32]:BYTE
PROLOG 100h

xor rax,rax
mov eax,ecx

lea rdi, buffer + 31
mov byte ptr[rdi],0 ;null terminator
mov r10,0Ah ;Divisor = 10

test eax,eax
jnz @f

dec rdi
mov byte ptr [rdi],30h ;0
jmp lbl_Write

@@:
xor rdx,rdx
div r10d
add dl,30h ;Hex to ACSII
dec rdi
mov byte ptr[rdi],dl
test eax,eax
jnz @b

lbl_Write:
mov rcx,rdi
call WriteLog

EPILOG
WriteDecimalToLog endp
