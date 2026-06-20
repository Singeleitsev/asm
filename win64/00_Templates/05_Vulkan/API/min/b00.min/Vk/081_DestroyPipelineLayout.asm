;081_DestroyPipelineLayoutProc.asm
destroyPipelineLayout proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

cmp ghVkPipelineLayout,0
je lbl_destroyPipelineLayout_End

LOG_TEXT szLogVkDestroyPipelineLayout
mov rcx,ghVkLogicalDevice
mov rdx,ghVkPipelineLayout
xor r8,r8
call vkDestroyPipelineLayout
mov ghVkPipelineLayout,0
LOG_TEXT szOK

lbl_destroyPipelineLayout_End:
;Epilogue
leave
ret
destroyPipelineLayout endp

