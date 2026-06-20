createDebugMessenger proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Check for VK_LAYER_KHRONOS_validation support
cmp gfValidationLayerSupport,1
jne lbl_createDebugMessenger_End

;2. Get the Function Pointer
LOG_TEXT szLogVkGetInstanceProcAddr
mov rcx,ghVkInstance
lea rdx,szVkCreateDebugUtilsMessengerEXT ;String Constant
call vkGetInstanceProcAddr
test rax,rax
jz lbl_createDebugMessenger_VkError
mov pfnCreateDebugUtilsMessenger,rax
LOG_TEXT szOK

;3. Create the Messenger
LOG_TEXT szVkCreateDebugUtilsMessengerEXT
mov rcx,ghVkInstance
lea rdx,dbgMessenger_sType ;pDebugCreateInfo
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
call SpellVkError

lbl_createDebugMessenger_End:
;Epilogue
leave
ret
createDebugMessenger endp



DebugCallback proc messageSeverity:QWORD, messageTypes:QWORD, pCallbackData:QWORD, pUserData:QWORD

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Store Parameters
mov messageSeverity,rcx
mov messageTypes,rdx
mov pCallbackData,r8
mov pUserData,r9

;R8 points to VkDebugUtilsMessengerCallbackDataEXT structure
mov rax,qword ptr[r8+28h] ;VkDebugUtilsMessengerCallbackDataEXT.pMessage
test rax,rax
jz lbl_DebugCallback_Return0

LOG_TEXT szCRLF
mov rsi,pCallbackData
mov rcx,qword ptr[rsi+28h] ;VkDebugUtilsMessengerCallbackDataEXT.pMessage
call WriteLog
LOG_TEXT szCRLF

xor rcx,rcx
mov rsi,pCallbackData
mov rdx,qword ptr[rsi+28h] ;VkDebugUtilsMessengerCallbackDataEXT.pMessage
lea r8,szVkCreateDebugUtilsMessengerEXT ;lpCaption
mov r9d,40h ;uType = MB_OK | MB_ICONINFORMATION (0x40)
call MessageBoxA

lbl_DebugCallback_Return0:
xor rax,rax

lbl_DebugCallback_End:
;Epilogue
leave
ret
DebugCallback endp



destroyDebugMessenger proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

cmp ghVkDebugMessenger,0
je lbl_destroyDebugMessenger_End

;1. Get the Function pointer
LOG_TEXT szLogVkGetInstanceProcAddr
mov rcx,ghVkInstance
lea rdx,szVkDestroyDebugUtilsMessengerEXT ;String Constant
call vkGetInstanceProcAddr
test rax,rax
jz lbl_destroyDebugMessenger_Error
mov pfnDestroyDebugUtilsMessenger,rax
LOG_TEXT szOK

;2. Destroy the Messenger
LOG_TEXT szVkDestroyDebugUtilsMessengerEXT
mov rcx,ghVkInstance
mov rdx,ghVkDebugMessenger
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
