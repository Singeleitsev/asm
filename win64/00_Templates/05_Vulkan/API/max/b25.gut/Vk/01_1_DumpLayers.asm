dumpLayers proc
LOCAL dwBytesWritten:DWORD, tempBuffer[32]:BYTE
PROLOG 100h

;Create/overwrite output file
lea rcx,szLayerDumpFileName
mov rdx,40000000h ;GENERIC_WRITE
mov r8,1 ;FILE_SHARE_READ
xor r9,r9
mov qword ptr[rsp+20h],2 ;CREATE_ALWAYS
mov qword ptr[rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
mov qword ptr[rsp+30h],0
call CreateFileA
cmp rax,-1
je lbl_dumpLayers_End
mov ghLayerDumpFile,rax

;Write header
mov rcx,ghLayerDumpFile
lea rdx,szLayerDumpFileHeader
mov r8,sizeof szLayerDumpFileHeader - 1
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0 ;lpOverlapped = NULL
call WriteFile

;Get available layer count and pointer
xor r14,r14
mov r14d,dwInstanceLayersCount
test r14d,r14d
jz lbl_dumpLayers_CloseFile

mov r15,gpLayerProperties
test r15,r15
jz lbl_dumpLayers_CloseFile

xor r12d,r12d ;index

lbl_Layer_Next:
mov rax,r12
imul rax,208h ;sizeof(VkLayerProperties) = 520 bytes
lea r13, [r15 + rax] ; R13 = VkLayerProperties*

;"Layer X: "
mov rcx,ghLayerDumpFile
lea rdx,szLayerHeader
mov r8,sizeof szLayerHeader - 1
lea r9,dwBytesWritten
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
xor edx,edx
div r10d
add dl,'0'
dec rdi
mov [rdi],dl
test eax,eax
jnz idx_conv

idx_write:
mov rcx,ghLayerDumpFile
mov rdx,rdi
lea r8,tempBuffer + 31
sub r8,rdi
lea r9,dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;": "
mov rcx,ghLayerDumpFile
lea rdx,szColonSpace
mov r8,sizeof szColonSpace - 1
lea r9,dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;"Name: "
mov rcx,ghLayerDumpFile
lea rdx,szLayerName
mov r8,sizeof szLayerName - 1
lea r9,dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;layerName (string at R13)
mov rcx,ghLayerDumpFile
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
mov qword ptr [rsp+20h],0
call WriteFile

;"Spec Version: "
mov rcx,ghLayerDumpFile
lea rdx,szLayerSpec
mov r8, sizeof szLayerSpec - 1
lea r9, dwBytesWritten
mov qword ptr [rsp+20h], 0
call WriteFile

;specVersion (dword at R13+256)
mov eax,dword ptr [r13 + 256]
lea rdi,tempBuffer + 31
mov byte ptr [rdi], 0
mov r10d,10
test eax,eax
jnz spec_conv
mov byte ptr [rdi-1],'0'
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
mov rcx,ghLayerDumpFile
mov rdx,rdi
lea r8,tempBuffer + 31
sub r8,rdi
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0
call WriteFile

;"Implementation Version: "
mov rcx,ghLayerDumpFile
lea rdx,szLayerVer
mov r8,sizeof szLayerVer - 1
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0
call WriteFile

;implementationVersion (dword at R13+260)
mov eax,dword ptr [r13 + 260]
lea rdi,tempBuffer + 31
mov byte ptr [rdi], 0
mov r10d,10
test eax,eax
jnz impl_conv
mov byte ptr [rdi-1],'0'
dec rdi
jmp impl_write

impl_conv:
xor edx,edx
div r10d
add dl,'0'
dec rdi
mov [rdi],dl
test eax, eax
jnz impl_conv

impl_write:
mov rcx,ghLayerDumpFile
mov rdx,rdi
lea r8,tempBuffer + 31
sub r8,rdi
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0
call WriteFile

;"Description: "
mov rcx,ghLayerDumpFile
lea rdx,szLayerDesc
mov r8,sizeof szLayerDesc - 1
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0
call WriteFile

;description (string at R13+264)
mov rcx,ghLayerDumpFile
lea rdx,[r13 + 264]
mov rbx,rdx
dec rbx

@@: inc rbx
cmp byte ptr [rbx],0
jne @b
sub rbx,rdx
mov r8,rbx
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0
call WriteFile

inc r12d
cmp r12d,r14d
jb lbl_Layer_Next

lbl_dumpLayers_CloseFile:
mov rcx, ghLayerDumpFile
call CloseHandle

lbl_dumpLayers_End:
EPILOG
dumpLayers endp
