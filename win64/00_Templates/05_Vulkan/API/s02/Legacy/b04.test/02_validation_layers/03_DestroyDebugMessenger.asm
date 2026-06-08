;03_DestroyDebugMessenger.asm
destroyDebugMessenger proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Get the Function pointer
LOG_TEXT szLogVkGetInstanceProcAddr
mov rcx,vkInstance
lea rdx,sz_vkDestroyDebugUtilsMessengerEXT ;String Constant
call vkGetInstanceProcAddr
test rax,rax
jz lbl_destroyDebugMessenger_Error
mov pfnDestroyDebugUtilsMessenger,rax
LOG_TEXT szOK

;2. Destroy the Messenger
LOG_TEXT szLogVkDestroyDebugUtilsMessengerEXT
mov rcx,vkInstance
mov rdx,vkDebugMessenger
xor r8,r8
call pfnDestroyDebugUtilsMessenger
LOG_TEXT szOK

jmp lbl_destroyDebugMessenger_End

;Errors
lbl_destroyDebugMessenger_Error:
call SpellError

lbl_destroyDebugMessenger_End:
;Epilogue
leave
ret
destroyDebugMessenger endp

