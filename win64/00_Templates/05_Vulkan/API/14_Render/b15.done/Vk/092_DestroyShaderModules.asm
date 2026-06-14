;092_DestroyShaderModulesProc.asm
destroyShaderModules proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

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
;Epilogue
leave
ret
destroyShaderModules endp

