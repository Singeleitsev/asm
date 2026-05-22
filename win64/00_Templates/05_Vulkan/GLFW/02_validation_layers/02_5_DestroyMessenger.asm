;02_5_DestroyDebugMessenger.asm
DestroyDebugMessenger proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Load the Destroy Function Pointer
mov rcx,ghVkInstance
lea rdx,sz_vkDestroyDebugUtilsMessengerEXT
call vkGetInstanceProcAddr
test rax,rax
jz lbl_DestroyDebugMessenger_End ;If the Pointer is 0

;Call the Destroy Function Pointer
mov rcx,ghVkInstance
mov rdx,ghDebugMessenger
xor r8,r8
call rax

lbl_DestroyDebugMessenger_End:
;Epilogue
leave
ret
DestroyDebugMessenger endp

