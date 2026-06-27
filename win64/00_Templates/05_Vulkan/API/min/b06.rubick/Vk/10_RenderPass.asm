createRenderPass proc
PROLOG 100h

;Set the format from chosenFormat
mov eax,chosenFormat
mov colorAttachment_format,eax

LOG_TEXT szLogVkCreateRenderPass
mov rcx, ghVkLogicalDevice
lea rdx, renderPassInfo_sType
xor r8,r8 ;pAllocator
lea r9,ghVkRenderPass
call vkCreateRenderPass
test rax,rax
jnz lbl_createRenderPass_VkError
cmp ghVkRenderPass,0
jz lbl_createRenderPass_VkError
LOG_TEXT szOK

jmp lbl_createRenderPass_End

lbl_createRenderPass_VkError:
call SpellVkError

lbl_createRenderPass_End:
EPILOG
createRenderPass endp



destroyRenderPass proc
PROLOG 100h

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
EPILOG
destroyRenderPass endp
