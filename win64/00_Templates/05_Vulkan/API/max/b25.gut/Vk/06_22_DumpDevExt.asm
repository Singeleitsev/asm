dumpDeviceExtensions proc
LOCAL dwBytesWritten:DWORD, tempBuffer[32]:BYTE
PROLOG 100h

;Create/overwrite output file
lea rcx, szDevExtDumpFileName
mov rdx, 40000000h              ; GENERIC_WRITE
mov r8, 1                       ; FILE_SHARE_READ
xor r9, r9
mov qword ptr [rsp+20h], 2      ; CREATE_ALWAYS
mov qword ptr [rsp+28h], 80h    ; FILE_ATTRIBUTE_NORMAL
mov qword ptr [rsp+30h], 0
call CreateFileA
cmp rax, -1
je lbl_dumpDevExt_End
mov ghDevExtDumpFile, rax

;Write header
mov rcx, ghDevExtDumpFile
lea rdx, szDevExtDumpFileHeader
mov r8, sizeof szDevExtDumpFileHeader - 1
lea r9, dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;Get available extension count and pointer
xor r14, r14
mov r14d, dwDeviceExtensionsCount
test r14d, r14d
jz lbl_dumpDevExt_CloseFile

mov r15, gpDeviceExtensionProperties
test r15, r15
jz lbl_dumpDevExt_CloseFile

xor r12d, r12d                  ; index

lbl_DevExt_Next:
mov rax,r12
imul rax,104h ;sizeof(VkExtensionProperties) = 260 bytes
lea r13,[r15 + rax] ;R13 = VkExtensionProperties*

;"Device Extension X: "
mov rcx, ghDevExtDumpFile
lea rdx, szDevExtHeader
mov r8, sizeof szDevExtHeader - 1
lea r9, dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;Convert index to decimal
mov eax, r12d
lea rdi, tempBuffer + 31
mov byte ptr [rdi], 0
mov r10d, 10
test eax, eax
jnz idx_conv
mov byte ptr [rdi-1], '0'
dec rdi
jmp idx_write

idx_conv:
xor edx, edx
div r10d
add dl, '0'
dec rdi
mov [rdi], dl
test eax, eax
jnz idx_conv

idx_write:
mov rcx, ghDevExtDumpFile
mov rdx, rdi
lea r8, tempBuffer + 31
sub r8, rdi
lea r9, dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;": "
mov rcx, ghDevExtDumpFile
lea rdx, szColonSpace
mov r8, sizeof szColonSpace - 1
lea r9, dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;"Name: "
mov rcx, ghDevExtDumpFile
lea rdx, szInstExtName          ; Reuse "Name: " from instance extensions
mov r8, sizeof szInstExtName - 1
lea r9, dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;extensionName (string at R13)
mov rcx, ghDevExtDumpFile
mov rdx, r13
mov rbx, r13
dec rbx

@@:
inc rbx
cmp byte ptr [rbx], 0
jne @b
sub rbx, r13
mov r8, rbx
lea r9, dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;"Spec Version: "
mov rcx, ghDevExtDumpFile
lea rdx, szInstExtSpec           ; Reuse "Spec Version: "
mov r8, sizeof szInstExtSpec - 1
lea r9, dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;specVersion (dword at R13+256)
mov eax, dword ptr [r13 + 256]
lea rdi, tempBuffer + 31
mov byte ptr [rdi], 0
mov r10d, 10
test eax, eax
jnz spec_conv
mov byte ptr [rdi-1], '0'
dec rdi
jmp spec_write

spec_conv:
xor edx, edx
div r10d
add dl, '0'
dec rdi
mov [rdi], dl
test eax, eax
jnz spec_conv

spec_write:
mov rcx, ghDevExtDumpFile
mov rdx, rdi
lea r8, tempBuffer + 31
sub r8, rdi
lea r9, dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

inc r12d
cmp r12d, r14d
jb lbl_DevExt_Next

lbl_dumpDevExt_CloseFile:
mov rcx, ghDevExtDumpFile
call CloseHandle

lbl_dumpDevExt_End:
EPILOG
dumpDeviceExtensions endp
