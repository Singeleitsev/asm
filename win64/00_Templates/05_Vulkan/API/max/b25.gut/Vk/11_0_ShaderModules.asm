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

LOG_TEXT szVkCreateVertexShader
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

LOG_TEXT szVkCreateFragmentShader
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
EPILOG
createShaderModules endp



destroyShaderModules proc
PROLOG 100h

cmp ghVkFragmentShaderModule,0
je lbl_destroyShaderModules_SkipFragment

LOG_TEXT szVkDestroyFragmentShader
mov rcx,ghVkLogicalDevice
mov rdx,ghVkFragmentShaderModule
xor r8,r8
call vkDestroyShaderModule
mov ghVkFragmentShaderModule,0
LOG_TEXT szOK

lbl_destroyShaderModules_SkipFragment:
cmp ghVkVertexShaderModule,0
je lbl_destroyShaderModules_End

LOG_TEXT szVkDestroyVertexShader
mov rcx,ghVkLogicalDevice
mov rdx,ghVkVertexShaderModule
xor r8,r8
call vkDestroyShaderModule
mov ghVkVertexShaderModule,0
LOG_TEXT szOK

lbl_destroyShaderModules_End:
EPILOG
destroyShaderModules endp
