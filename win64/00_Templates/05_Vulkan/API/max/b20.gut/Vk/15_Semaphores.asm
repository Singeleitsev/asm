createSemaphores proc
PROLOG 100h

;First semaphore: image available
LOG_TEXT szLogVkCreateSemaphoreImageAvailable
mov rcx,ghVkLogicalDevice
lea rdx,semaphoreInfo_sType
xor r8,r8
lea r9,ghVkSemaphoreImageAvailable
call vkCreateSemaphore
test eax, eax
jnz lbl_createSemaphores_VkError
cmp ghVkSemaphoreImageAvailable,0
je lbl_createSemaphores_VkError
LOG_TEXT szOK

;Second semaphore: render finished
LOG_TEXT szLogVkCreateSemaphoreRenderFinished
mov rcx,ghVkLogicalDevice
lea rdx,semaphoreInfo_sType
xor r8,r8
lea r9,ghVkSemaphoreRenderFinished
call vkCreateSemaphore
test eax,eax
jnz lbl_createSemaphores_VkError
cmp ghVkSemaphoreRenderFinished,0
je lbl_createSemaphores_VkError
LOG_TEXT szOK

jmp lbl_createSemaphores_End

lbl_createSemaphores_VkError:
call SpellVkError

lbl_createSemaphores_End:
EPILOG
createSemaphores endp



destroySemaphores proc
PROLOG 100h

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
lbl_destroySemaphores_End:
EPILOG
destroySemaphores endp
