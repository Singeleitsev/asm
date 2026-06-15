;091_CreateShaderModulesProc.asm
createShaderModules proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

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
;mov  rcx,gpCodeShaderV
;call HeapFree
;mov gpCodeShaderV,0

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
;mov  rcx,gpCodeShaderF
;call HeapFree
;mov gpCodeShaderF,0

jmp lbl_createShaderModules_End

;Errors
lbl_createShaderModules_WinError:
call SpellWinError
jmp lbl_createShaderModules_End

lbl_createShaderModules_VkError:
call SpellVkError

lbl_createShaderModules_End:
;Epilogue
leave
ret
createShaderModules endp

