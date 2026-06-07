;02_DebugCallback.asm
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

;R8 points to VkDebugUtilsMessengerCallbackDataEXT
mov rax,qword ptr[r8+28h] ;VkDebugUtilsMessengerCallbackDataEXT.pMessage
test rax,rax
jz lbl_DebugCallback_Return0

xor rcx,rcx
mov rdx,rax ;lpText = pMessage
lea r8,sz_vkCreateDebugUtilsMessengerEXT ;lpCaption
mov r9d,40h ;uType = MB_OK | MB_ICONINFORMATION (0x40)
call MessageBoxA

lbl_DebugCallback_Return0:
xor rax,rax

lbl_DebugCallback_End:
;Epilogue
leave
ret
DebugCallback endp

