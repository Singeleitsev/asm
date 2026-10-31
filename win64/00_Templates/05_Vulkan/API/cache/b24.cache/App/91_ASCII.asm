;Helper: write a 32-bit decimal number (in EAX) to the dump file
;Uses tempBuffer and dwBytesWritten (local)
writeDecimalToFile proc
LOCAL dwBytesWritten:DWORD,tempBuffer[32]:BYTE
PROLOG_PUSH 100h

lea rdi,tempBuffer + 31
mov byte ptr [rdi],0
mov r10d,10
test eax,eax
jnz dec_conv
mov byte ptr [rdi-1],'0'
dec rdi
jmp dec_write
dec_conv:
xor edx,edx
div r10d
add dl,'0'
dec rdi
mov [rdi],dl
test eax,eax
jnz dec_conv
dec_write:
mov rcx,ghDeviceDumpFile
mov rdx,rdi
lea r8,tempBuffer + 31
sub r8,rdi
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0
call WriteFile

EPILOG_POP
writeDecimalToFile endp



;Helper: write a 32-bit hex number (in EAX) to the dump file (without prefix)
writeHex32ToFile proc
LOCAL dwBytesWritten:DWORD,tempBuffer[32]:BYTE
PROLOG_PUSH 100h

lea rdi,tempBuffer + 31
mov byte ptr [rdi],0
mov ecx,8 ;8 hex digits for 32 bits
mov ebx,eax
hex_loop:
dec rdi
mov eax,ebx
and eax,0Fh
cmp al,10
jl hex_digit
add al,'A' - 10
jmp hex_store
hex_digit:
add al,'0'
hex_store:
mov byte ptr [rdi],al
shr ebx,4
dec ecx
jnz hex_loop
;write the hex string
mov rcx,ghDeviceDumpFile
mov rdx,rdi
lea r8,tempBuffer + 31
sub r8,rdi
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0
call WriteFile

EPILOG_POP



writeHex32ToFile endp