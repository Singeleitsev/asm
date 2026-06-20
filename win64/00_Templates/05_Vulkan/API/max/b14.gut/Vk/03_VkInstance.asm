createVkInstance proc
PROLOG 100h

LOG_TEXT szLogVkCreateInstance
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

;Errors
lbl_createVkInstance_VkError:
call SpellVkError

lbl_createVkInstance_End:
;Epilogue
leave
ret
createVkInstance endp



destroyVkInstance proc
PROLOG 100h

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Skip if No vkInstance
cmp ghVkInstance,0
je lbl_destroyVkInstance_End

;Destroy the vkInstance
LOG_TEXT szLogVkDestroyInstance
mov rcx,ghVkInstance
xor rdx,rdx ;pAllocator = NULL
call vkDestroyInstance
mov ghVkInstance,0
LOG_TEXT szOK

;jmp lbl_destroyVkInstance_End

lbl_destroyVkInstance_End:
;Epilogue
leave
ret
destroyVkInstance endp
