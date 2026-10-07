WriteDecimalToLog proc uses eax ecx edx edi, nNumber:DWORD
LOCAL buffer[32]:BYTE

mov eax,nNumber

lea edi, buffer + 31
mov byte ptr[edi],0 ;null terminator
mov ecx,0Ah ;Divisor = 10

test eax,eax
jnz @f

dec edi
mov byte ptr [edi],30h ;0
jmp lbl_Write

@@:
xor edx,edx
div ecx
add dl,30h ;Hex to ACSII
dec edi
mov byte ptr[edi],dl
test eax,eax
jnz @b

lbl_Write:
push edi
call WriteLog

ret
WriteDecimalToLog endp