;114_DestroyCommandPool.asm
destroyCommandObjects proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Destroy Fence
cmp ghVkFence,0
je @f
LOG_TEXT szLogVkDestroyFence
mov rcx,ghVkLogicalDevice
mov rdx,ghVkFence
xor r8,r8
call vkDestroyFence
LOG_TEXT szOK
mov ghVkFence,0

;Destroy Semaphores
@@:
cmp ghVkSemaphoreRenderFinished,0
je @f
LOG_TEXT szLogVkDestroySemaphoreRenderFinished
mov rcx,ghVkLogicalDevice
mov rdx,ghVkSemaphoreRenderFinished
xor r8,r8
call vkDestroySemaphore
LOG_TEXT szOK
mov ghVkSemaphoreRenderFinished,0

@@:
cmp ghVkSemaphoreImageAvailable,0
je @f
LOG_TEXT szLogVkDestroySemaphoreImageAvailable
mov rcx,ghVkLogicalDevice
mov rdx,ghVkSemaphoreImageAvailable
xor r8,r8
call vkDestroySemaphore
LOG_TEXT szOK
mov ghVkSemaphoreImageAvailable,0

@@:
;Destroy Command Pool
cmp ghVkCommandPool,0
je @f
LOG_TEXT szLogVkDestroyCommandPool
mov rcx,ghVkLogicalDevice
mov rdx,ghVkCommandPool
xor r8,r8
call vkDestroyCommandPool
LOG_TEXT szOK
mov ghVkCommandPool,0

@@:
lbl_destroyCommandObjects_End:
;Epilogue
leave
ret
destroyCommandObjects endp

