;01_CreateSemaphores.asm
createSemaphores proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

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
;Epilogue
leave
ret
createSemaphores endp

