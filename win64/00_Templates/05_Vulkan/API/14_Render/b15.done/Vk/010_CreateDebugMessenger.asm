;010_CreateDebugMessenger.asm
createDebugMessenger proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Get the Function Pointer
LOG_TEXT szLogVkGetInstanceProcAddr
mov rcx,ghVkInstance
lea rdx,sz_vkCreateDebugUtilsMessengerEXT ;String Constant
call vkGetInstanceProcAddr
test rax,rax
jz lbl_createDebugMessenger_VkError
mov pfnCreateDebugUtilsMessenger,rax
LOG_TEXT szOK

;2. Create the Messenger
LOG_TEXT szLogVkCreateDebugUtilsMessengerEXT
mov rcx,ghVkInstance
lea rdx,dbgMessenger_sType ;pCreateInfo
xor r8,r8 ;pAllocator = NULL
lea r9,ghVkDebugMessenger ;pMessenger
call pfnCreateDebugUtilsMessenger
test eax,eax
jnz lbl_createDebugMessenger_VkError
cmp ghVkDebugMessenger,0
je lbl_createDebugMessenger_VkError
LOG_TEXT szOK

jmp lbl_createDebugMessenger_End

;Errors
lbl_createDebugMessenger_VkError:
call SpellError

lbl_createDebugMessenger_End:
;Epilogue
leave
ret
createDebugMessenger endp

