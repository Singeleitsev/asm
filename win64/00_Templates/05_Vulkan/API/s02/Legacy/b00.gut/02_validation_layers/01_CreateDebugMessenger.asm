;01_CreateDebugMessenger.asm
createDebugMessenger proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Get function pointer
mov rcx,vkInstance
lea rdx,sz_vkCreateDebugUtilsMessengerEXT   ;String Constant
call vkGetInstanceProcAddr
test rax,rax
jz lbl_ErrNoDebugUtilsFunction
mov pfnCreateDebugUtilsMessenger,rax

;2. Create the Messenger
mov rcx,vkInstance
lea rdx,dbgMessenger_sType ;pCreateInfo
xor r8,r8 ;pAllocator = NULL
lea r9,vkDebugMessenger ;pMessenger
call qword ptr [pfnCreateDebugUtilsMessenger]
test eax,eax
jnz lbl_ErrCreateMessenger

jmp lbl_createDebugMessenger_End

;Errors
lbl_ErrNoDebugUtilsFunction:
lea rcx,szErrNoDebugUtilsFunction
lea rdx,szErrNoDebugUtilsCode
call SpellError
jmp lbl_createDebugMessenger_End

lbl_ErrCreateMessenger:
lea rcx, szErrCreateDebugMessenger
lea rdx, szErrCreateDebugMessengerCode
call SpellError
;jmp lbl_createDebugMessenger_End

lbl_createDebugMessenger_End:
;Epilogue
leave
ret
createDebugMessenger endp

