;071_DestroyRenderPassProc.asm
destroyRenderPass proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

cmp ghVkRenderPass,0
je lbl_destroyRenderPass_End

LOG_TEXT szLogVkDestroyRenderPass
mov rcx,ghVkLogicalDevice
mov rdx,ghVkRenderPass
xor r8,r8
call vkDestroyRenderPass
mov ghVkRenderPass,0
LOG_TEXT szOK

lbl_destroyRenderPass_End:
;Epilogue
leave
ret
destroyRenderPass endp

