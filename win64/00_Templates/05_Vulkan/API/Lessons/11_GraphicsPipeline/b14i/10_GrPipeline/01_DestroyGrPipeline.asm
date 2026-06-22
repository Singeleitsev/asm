;01_DestroyGraphicsPipelineProc.asm
destroyGraphicsPipeline proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

cmp ghVkGraphicsPipeline,0
je lbl_destroyGraphicsPipeline_End

LOG_TEXT szLogVkDestroyGraphicsPipeline
mov rcx,ghVkLogicalDevice
mov rdx,ghVkGraphicsPipeline
xor r8,r8
call vkDestroyPipeline
mov ghVkGraphicsPipeline,0
LOG_TEXT szOK

lbl_destroyGraphicsPipeline_End:
;Epilogue
leave
ret
destroyGraphicsPipeline endp

