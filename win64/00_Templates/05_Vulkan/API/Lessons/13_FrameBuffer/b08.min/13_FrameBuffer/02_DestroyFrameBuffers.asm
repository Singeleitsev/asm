;02_DestroyFrameBuffers.asm
destroyFrameBuffers proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

cmp gpFramebuffers,0
je lbl_destroyFrameBuffers_End

xor rbx,rbx
mov rsi,gpFramebuffers

destroy_fb:
LOG_TEXT szLogVkDestroyFrameBuffer
mov rcx,ghVkLogicalDevice
mov rdx,qword ptr[rsi]
xor r8,r8
call vkDestroyFramebuffer
LOG_TEXT szOK

add rsi,8
inc ebx
cmp ebx,dwSwapchainImageCount
jl destroy_fb

mov gpFramebuffers,0

lbl_destroyFrameBuffers_End:
;Epilogue
leave
ret
destroyFrameBuffers endp

