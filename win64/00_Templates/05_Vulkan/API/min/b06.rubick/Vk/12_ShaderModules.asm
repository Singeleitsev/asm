LoadShader proc pszFileName:QWORD, pdwSize:QWORD, pszLog:QWORD, pgpBuffer:QWORD
LOCAL hFile:QWORD, dwRead:QWORD
PROLOG 100h

mov pszFileName,rcx
mov pdwSize,rdx
mov pszLog,r8
mov pgpBuffer,r9

;LOG_TEXT szLog
mov rcx,r8
call WriteLog

;Open file
mov rcx,pszFileName
mov rdx,80000000h ;GENERIC_READ
mov r8,1 ;FILE_SHARE_READ
xor r9,r9 ;lpSecurityAttributes
mov qword ptr [rsp+20h],3 ;OPEN_EXISTING
mov qword ptr [rsp+28h],0 ;dwFlagsAndAttributes
mov qword ptr [rsp+30h],0; hTemplateFile
call CreateFileA
cmp rax,-1
je lbl_LoadShader_WinError
mov hFile,rax

;Get file size
mov rcx,hFile
xor rdx,rdx
xor r8,r8
call GetFileSize
test rax,rax
jz lbl_LoadShader_Error_Close
mov rdi,pdwSize
mov qword ptr[rdi],rax

;Allocate heap memory
call GetProcessHeap
test rax,rax
jz lbl_LoadShader_Error_Close

mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rsi,pdwSize
mov r8,qword ptr[rsi]
call HeapAlloc
test rax,rax
jz lbl_LoadShader_Error_Close
mov rdi,pgpBuffer
mov qword ptr[rdi],rax

;Read file
mov rcx,hFile
mov rdi,pgpBuffer
mov rdx,qword ptr[rdi]
mov rsi,pdwSize
mov r8,qword ptr[rsi]
lea r9,dwRead
mov qword ptr[rsp+20h],0
call ReadFile
test rax,rax
jz lbl_LoadShader_Error_Free_Close

;Close file
mov rcx,hFile
call CloseHandle

;Success
LOG_TEXT szOK
jmp lbl_LoadShader_End

lbl_LoadShader_Error_Free_Close:
mov rsi,pgpBuffer
mov rcx,qword ptr[rsi]
call HeapFree
jmp lbl_LoadShader_WinError

lbl_LoadShader_Error_Close:
mov rcx,hFile
call CloseHandle

lbl_LoadShader_WinError:
call SpellWinError

lbl_LoadShader_End:
EPILOG
LoadShader endp



createShaderModules proc
PROLOG 100h

;Load Vertex Shader SPIR-V
lea rcx,szFileNameShaderV ;pszFileName
lea rdx,dwSizeShaderV ;pdwSize
lea r8,szLogLoadShaderV ;pszLog
lea r9,gpCodeShaderV ;pgpBuffer
call LoadShader
cmp gpCodeShaderV,0
je lbl_createShaderModules_WinError

;Fill the VkShaderModuleCreateInfo structure
mov rax,dwSizeShaderV
mov shaderModuleInfo_codeSize,rax
mov rax,gpCodeShaderV
mov shaderModuleInfo_pCode,rax

LOG_TEXT szLogVkCreateVertexShader
mov rcx,ghVkLogicalDevice
lea rdx,shaderModuleInfo_sType
xor r8,r8 ;pAllocator
lea r9,ghVkVertexShaderModule
call vkCreateShaderModule
test rax,rax
jnz lbl_createShaderModules_VkError
cmp ghVkVertexShaderModule,0
je lbl_createShaderModules_VkError
LOG_TEXT szOK

;Load Fragment Shader SPIR-V
lea rcx,szFileNameShaderF ;pszFileName
lea rdx,dwSizeShaderF ;pdwSize
lea r8,szLogLoadShaderF ;pszLog
lea r9,gpCodeShaderF ;pgpBuffer
call LoadShader
cmp gpCodeShaderF,0
je lbl_createShaderModules_WinError

;ReFill the VkShaderModuleCreateInfo structure
mov rax,dwSizeShaderF
mov shaderModuleInfo_codeSize,rax
mov rax,gpCodeShaderF
mov shaderModuleInfo_pCode,rax

LOG_TEXT szLogVkCreateFragmentShader
mov rcx,ghVkLogicalDevice
lea rdx,shaderModuleInfo_sType
xor r8,r8
lea r9,ghVkFragmentShaderModule
call vkCreateShaderModule
test rax,rax
jnz lbl_createShaderModules_VkError
cmp ghVkFragmentShaderModule,0
je lbl_createShaderModules_VkError
LOG_TEXT szOK

jmp lbl_createShaderModules_End

;Errors
lbl_createShaderModules_WinError:
call SpellWinError
jmp lbl_createShaderModules_End

lbl_createShaderModules_VkError:
call SpellVkError

lbl_createShaderModules_End:
EPILOG
createShaderModules endp



destroyShaderModules proc
PROLOG 100h

cmp ghVkFragmentShaderModule,0
je lbl_destroyShaderModules_SkipFragment

LOG_TEXT szLogVkDestroyFragmentShader
mov rcx,ghVkLogicalDevice
mov rdx,ghVkFragmentShaderModule
xor r8,r8
call vkDestroyShaderModule
mov ghVkFragmentShaderModule,0
LOG_TEXT szOK

lbl_destroyShaderModules_SkipFragment:
cmp ghVkVertexShaderModule,0
je lbl_destroyShaderModules_End

LOG_TEXT szLogVkDestroyVertexShader
mov rcx,ghVkLogicalDevice
mov rdx,ghVkVertexShaderModule
xor r8,r8
call vkDestroyShaderModule
mov ghVkVertexShaderModule,0
LOG_TEXT szOK

lbl_destroyShaderModules_End:
EPILOG
destroyShaderModules endp
