createPipelineLayout proc
PROLOG 100h

LOG_TEXT szLogVkCreatePipelineLayout
mov rcx,ghVkLogicalDevice
lea rdx,pipelineLayoutInfo_sType
xor r8,r8 ;pAllocator
lea r9,ghVkPipelineLayout
call vkCreatePipelineLayout
test rax,rax
jnz lbl_createPipelineLayout_VkError
cmp ghVkPipelineLayout,0
je lbl_createPipelineLayout_VkError
LOG_TEXT szOK

jmp lbl_createPipelineLayout_End

lbl_createPipelineLayout_VkError:
call SpellVkError

lbl_createPipelineLayout_End:
EPILOG
createPipelineLayout endp



destroyPipelineLayout proc
PROLOG 100h

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
EPILOG
destroyPipelineLayout endp
