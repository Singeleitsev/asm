createPipelineLayout proc
PROLOG_PUSH 100h

LOG_TEXT szVkCreatePipelineLayout
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
EPILOG_POP
createPipelineLayout endp



destroyPipelineLayout proc
PROLOG_PUSH 100h

cmp ghVkPipelineLayout,0
je lbl_destroyPipelineLayout_End

LOG_TEXT szVkDestroyPipelineLayout
mov rcx,ghVkLogicalDevice
mov rdx,ghVkPipelineLayout
xor r8,r8
call vkDestroyPipelineLayout
mov ghVkPipelineLayout,0
LOG_TEXT szOK

lbl_destroyPipelineLayout_End:
EPILOG_POP
destroyPipelineLayout endp
