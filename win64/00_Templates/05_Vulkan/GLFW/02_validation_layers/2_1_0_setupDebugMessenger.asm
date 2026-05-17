;02_3_DebugMessenger.asm
;https://github.com/KhronosGroup/Vulkan-ValidationLayers

setupDebugMessenger proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Fill create info structure
;VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT EQU 1000128000 ;vk.xml
mov DebugCreateInfo.sType,3B9CBE00h
mov DebugCreateInfo.pNext, 0
mov DebugCreateInfo.flags, 0
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT EQU 1
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT EQU 10h - Not used
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT EQU 100h
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT EQU 1000h
mov DebugCreateInfo.messageSeverity,1101h
;VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT EQU 1h
;VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT EQU 2h
;VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT EQU 4h
mov DebugCreateInfo.messageType,7
lea rax,DebugCallback ;Debug Callback Procedure
mov DebugCreateInfo.pfnUserCallback,rax
mov DebugCreateInfo.pUserData,0

;Load vkCreateDebugUtilsMessengerEXT
lea rdx,sz_vkCreateDebugUtilsMessengerEXT
mov rcx,ghVkInstance
call vkGetInstanceProcAddr
mov pfnCreateDebugMessenger,rax
test rax,rax
jz lbl_setupDebugMessenger_Err ;If the Pointer is 0

;Call the function
mov rcx,ghVkInstance
lea rdx,DebugCreateInfo
xor r8,r8 ;pAllocator = nullptr
lea r9,ghDebugMessenger
call pfnCreateDebugMessenger
test rax,rax
jnz lbl_setupDebugMessenger_Err ;Jump if error (non-zero)

jmp lbl_setupDebugMessenger_Return0

;Error messages
lbl_setupDebugMessenger_Err:
xor rcx,rcx
lea rdx,sz_setupDebugMessenger_Err ;Failed to create a vk Debug Messenger
lea r8,sz_setupDebugMessenger ;MessageBox Title
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_setupDebugMessenger_End

lbl_setupDebugMessenger_Return0:
xor rax,rax

lbl_setupDebugMessenger_End:
;Epilogue
leave
ret
setupDebugMessenger endp

