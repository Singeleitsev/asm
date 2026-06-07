CloseWndProc proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx,ghWndMain
lea rdx,szMsgCloseText ;"Exit?"
lea r8,szMainWndTitle ;"Vulkan Template"
mov r9,24h ;MB_YESNO Or MB_ICONQUESTION
Call MessageBoxA
cmp rax,6 ;IDYES
jne lbl_CloseWndProc_End

;mov rcx,ghWndMain
;mov rdx,ghDC
;Call ReleaseDC

;Destroy vkDebugUtilsMessenger
cmp vkInstance,0
je lbl_DestroyAccelerators
cmp vkDebugMessenger,0
je @f
;Load the Destroy Function Pointer
mov rcx,vkInstance
lea rdx,sz_vkDestroyDebugUtilsMessengerEXT
call vkGetInstanceProcAddr
test rax,rax
jz @f
mov rcx,vkInstance
mov rdx,vkDebugMessenger
xor r8,r8
call rax ;vkDestroyDebugUtilsMessengerEXT

@@:
;Destroy Vulkan Instance
mov rcx,vkInstance
xor rdx,rdx ;pAllocator = NULL
call vkDestroyInstance

lbl_DestroyAccelerators:
cmp ghAccTable, 0
je @f
mov rcx,ghAccTable
Call DestroyAcceleratorTable

@@:
cmp ghWndMain,0
je @f
mov rcx,ghWndMain
Call DestroyWindow

@@:
lbl_CloseWndProc_End:
xor rax,rax
mov vkInstance,rax
mov vkDebugMessenger,rax
mov ghAccTable,rax
mov ghWndMain,rax

;Epilogue:
leave
ret
CloseWndProc endp

