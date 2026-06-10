;00_CreateShaderModulesProc.asm
createShaderModules proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Fill the VkShaderModuleCreateInfo structure
mov shaderModuleInfo_codeSize, sizeof vert_spv
lea rax,vert_spv
mov shaderModuleInfo_pCode,rax

LOG_TEXT szLogVkCreateVertexShader
mov rcx,ghVkLogicalDevice
lea rdx,shaderModuleInfo_sType
xor r8,r8 ;pAllocator
lea r9,ghVkVertexShaderModule
call vkCreateShaderModule
cmp ghVkVertexShaderModule,0
jz lbl_createShaderModules_VkError
LOG_TEXT szOK

;ReFill the VkShaderModuleCreateInfo structure
mov shaderModuleInfo_codeSize, sizeof frag_spv
lea rax,frag_spv
mov shaderModuleInfo_pCode,rax

LOG_TEXT szLogVkCreateFragmentShader
mov rcx,ghVkLogicalDevice
lea rdx,shaderModuleInfo_sType
xor r8,r8
lea r9,ghVkFragmentShaderModule
call vkCreateShaderModule
cmp ghVkFragmentShaderModule,0
jz lbl_createShaderModules_VkError
LOG_TEXT szOK

jmp lbl_createShaderModules_End

lbl_createShaderModules_VkError:
call SpellVkError

lbl_createShaderModules_End:
;Epilogue
leave
ret
createShaderModules endp

