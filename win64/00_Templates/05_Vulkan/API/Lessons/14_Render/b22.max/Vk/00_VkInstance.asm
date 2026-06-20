createInstance proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

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
;Epilogue
leave
ret
createInstance endp



destroyInstance proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

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

;jmp lbl_destroyInstance_End

lbl_destroyInstance_End:
;Epilogue
leave
ret
destroyInstance endp
