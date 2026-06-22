createCommandPool proc
PROLOG 100h

;Fill the VkCommandPoolCreateInfo structure
mov eax,graphicsFamilyIndex
mov cmdPoolInfo_queueFamilyIndex,eax

LOG_TEXT szVkCreateCommandPool
mov rcx,ghVkLogicalDevice
lea rdx,cmdPoolInfo_sType
xor r8,r8
lea r9,ghVkCommandPool
call vkCreateCommandPool
test eax,eax
jnz lbl_createCommandPool_VkError
cmp ghVkCommandPool,0
je lbl_createCommandPool_VkError
LOG_TEXT szOK

jmp lbl_createCommandPool_End

lbl_createCommandPool_VkError:
call SpellVkError

lbl_createCommandPool_End:
EPILOG
createCommandPool endp



destroyCommandPool proc
PROLOG 100h

cmp ghVkCommandPool,0
je lbl_destroyCommandPool_End
LOG_TEXT szVkDestroyCommandPool
mov rcx,ghVkLogicalDevice
mov rdx,ghVkCommandPool
xor r8,r8
call vkDestroyCommandPool
LOG_TEXT szOK
mov ghVkCommandPool,0

lbl_destroyCommandPool_End:
EPILOG
destroyCommandPool endp
