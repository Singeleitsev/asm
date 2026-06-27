createInstance proc
PROLOG 100h

LOG_TEXT szLogVkCreateInstance
lea rcx,createInfo_sType ;pCreateInfo
xor rdx,rdx ;pAllocator = NULL
lea r8,ghVkInstance ;pInstance
call vkCreateInstance
test eax,eax
jnz lbl_createInstance_VkError
cmp ghVkInstance,0
je lbl_createInstance_VkError
LOG_TEXT szOK
jmp lbl_createInstance_End

;Errors
lbl_createInstance_VkError:
call SpellVkError

lbl_createInstance_End:
EPILOG
createInstance endp



destroyInstance proc
PROLOG 100h

;Skip if No vkInstance
cmp ghVkInstance,0
je lbl_destroyInstance_End

;Destroy the vkInstance
LOG_TEXT szLogVkDestroyInstance
mov rcx,ghVkInstance
xor rdx,rdx ;pAllocator = NULL
call vkDestroyInstance
mov ghVkInstance,0
LOG_TEXT szOK

lbl_destroyInstance_End:
EPILOG
destroyInstance endp
