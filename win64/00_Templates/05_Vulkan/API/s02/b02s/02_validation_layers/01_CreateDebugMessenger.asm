;01_CreateDebugMessenger.asm
createDebugMessenger proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Get function pointer
LOG_TEXT szLogVkGetInstanceProcAddr
mov rcx,vkInstance
lea rdx,sz_vkCreateDebugUtilsMessengerEXT ;String Constant
call vkGetInstanceProcAddr
test rax,rax
jz lbl_createDebugMessenger_Error
mov pfnCreateDebugUtilsMessenger,rax
LOG_TEXT szOK

;2. Create the Messenger
LOG_TEXT szLogVkCreateDebugUtilsMessengerEXT
mov rcx,vkInstance
lea rdx,dbgMessenger_sType ;pCreateInfo
xor r8,r8 ;pAllocator = NULL
lea r9,vkDebugMessenger ;pMessenger
call qword ptr [pfnCreateDebugUtilsMessenger]
test eax,eax
jnz lbl_createDebugMessenger_Error
LOG_TEXT szOK

jmp lbl_createDebugMessenger_End

;Errors
lbl_createDebugMessenger_Error:
call SpellError

lbl_createDebugMessenger_End:
;Epilogue
leave
ret
createDebugMessenger endp

