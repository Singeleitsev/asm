createFence proc
PROLOG 100h

LOG_TEXT szLogVkCreateFence
mov rcx,ghVkLogicalDevice
lea rdx,fenceInfo_sType
xor r8,r8
lea r9,ghVkFence
call vkCreateFence
test eax, eax
jnz lbl_createFence_VkError
cmp ghVkFence,0
je lbl_createFence_VkError
LOG_TEXT szOK

jmp lbl_createFence_End

lbl_createFence_VkError:
call SpellVkError

lbl_createFence_End:
EPILOG
createFence endp



destroyFence proc
PROLOG 100h

cmp ghVkFence,0
je lbl_destroyFence_End
LOG_TEXT szLogVkDestroyFence
mov rcx,ghVkLogicalDevice
mov rdx,ghVkFence
xor r8,r8
call vkDestroyFence
LOG_TEXT szOK
mov ghVkFence,0

lbl_destroyFence_End:
EPILOG
destroyFence endp
