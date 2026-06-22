createVkInstance proc
PROLOG 100h

LOG_TEXT szVkCreateInstance
lea rcx,createInfo_sType ;pCreateInfo
xor rdx,rdx ;pAllocator = NULL
lea r8,ghVkInstance ;pInstance
call vkCreateInstance
test eax,eax
jnz lbl_createVkInstance_VkError
cmp ghVkInstance,0
je lbl_createVkInstance_VkError
LOG_TEXT szOK
jmp lbl_createVkInstance_End

lbl_createVkInstance_VkError:
call SpellVkError

lbl_createVkInstance_End:
EPILOG
createVkInstance endp



destroyVkInstance proc
PROLOG 100h

;Skip if No vkInstance
cmp ghVkInstance,0
je lbl_destroyVkInstance_End

;Destroy the vkInstance
LOG_TEXT szVkDestroyInstance
mov rcx,ghVkInstance
xor rdx,rdx ;pAllocator = NULL
call vkDestroyInstance
mov ghVkInstance,0
LOG_TEXT szOK

lbl_destroyVkInstance_End:
EPILOG
destroyVkInstance endp
