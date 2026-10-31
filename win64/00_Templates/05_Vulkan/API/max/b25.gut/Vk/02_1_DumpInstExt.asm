dumpInstanceExtensions proc
LOCAL dwBytesWritten:DWORD, tempBuffer[32]:BYTE
PROLOG 100h

;Create/overwrite output file
lea rcx,szInstExtDumpFileName
mov rdx,40000000h ;GENERIC_WRITE
mov r8,1 ;FILE_SHARE_READ
xor r9,r9
mov qword ptr[rsp+20h],2 ;CREATE_ALWAYS
mov qword ptr[rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
mov qword ptr[rsp+30h],0
call CreateFileA
cmp rax,-1
je lbll_dumpInstExt_End
mov ghInstExtDumpFile,rax

;Write header
mov rcx,ghInstExtDumpFile
lea rdx,szInstExtDumpFileHeader
mov r8,sizeof szInstExtDumpFileHeader - 1
lea r9,dwBytesWritten
mov qword ptr[rsp+20h],0 ;lpOverlapped = NULL
call WriteFile

;Get available layer count and pointer
xor r14,r14
mov r14d,dwInstanceExtensionsCount
test r14d,r14d
jz lbll_dumpInstExt_CloseFile

mov r15,gpExtensionProperties
test r15,r15
jz lbll_dumpInstExt_CloseFile

xor r12d,r12d ;index

lbll_dumpInstExt_Next:
mov rax,r12
imul rax,104h ;sizeof(VkExtensionProperties) = 260 bytes
lea r13,[r15 + rax] ; R13 = VkExtensionProperties*

;"Instance Extension X: "
mov rcx,ghInstExtDumpFile
lea rdx,szInstExtHeader
mov r8,sizeof szInstExtHeader - 1
lea r9,dwBytesWritten
mov qword ptr[rsp+20h], 0
call WriteFile

;Convert index to decimal
mov eax, r12d
lea rdi, tempBuffer + 31
mov byte ptr[rdi], 0
mov r10d, 10
test eax, eax
jnz idx_conv

mov byte ptr[rdi-1], '0'
dec rdi
jmp idx_write

idx_conv:
xor edx,edx
div r10d
add dl,'0'
dec rdi
mov [rdi],dl
test eax,eax
jnz idx_conv

idx_write:
mov rcx,ghInstExtDumpFile
mov rdx,rdi
lea r8,tempBuffer + 31
sub r8,rdi
lea r9,dwBytesWritten
mov qword ptr[rsp+20h], 0
call WriteFile

;": "
mov rcx,ghInstExtDumpFile
lea rdx,szColonSpace
mov r8,sizeof szColonSpace - 1
lea r9,dwBytesWritten
mov qword ptr[rsp+20h], 0
call WriteFile

;"Name: "
mov rcx,ghInstExtDumpFile
lea rdx,szInstExtName
mov r8,sizeof szInstExtName - 1
lea r9,dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;extensionName (string at R13)
mov rcx,ghInstExtDumpFile
mov rdx,r13
mov rbx,r13
dec rbx

@@:
inc rbx
cmp byte ptr[rbx], 0
jne @b
sub rbx,r13
mov r8,rbx
lea r9,dwBytesWritten
mov qword ptr[rsp+20h],0
call WriteFile

;"Spec Version: "
mov rcx,ghInstExtDumpFile
lea rdx,szInstExtSpec
mov r8, sizeof szInstExtSpec - 1
lea r9, dwBytesWritten
mov qword ptr[rsp+20h], 0
call WriteFile

;specVersion (dword at R13+256)
mov eax,dword ptr [r13 + 256]
lea rdi,tempBuffer + 31
mov byte ptr[rdi], 0
mov r10d,10
test eax,eax
jnz spec_conv
mov byte ptr[rdi-1],'0'
dec rdi
jmp spec_write

spec_conv:
xor edx,edx
div r10d
add dl,'0'
dec rdi
mov [rdi],dl
test eax,eax
jnz spec_conv

spec_write:
mov rcx,ghInstExtDumpFile
mov rdx,rdi
lea r8,tempBuffer + 31
sub r8,rdi
lea r9,dwBytesWritten
mov qword ptr[rsp+20h],0
call WriteFile

inc r12d
cmp r12d,r14d
jb lbll_dumpInstExt_Next

lbll_dumpInstExt_CloseFile:
mov rcx, ghInstExtDumpFile
call CloseHandle

lbll_dumpInstExt_End:
EPILOG
dumpInstanceExtensions endp
