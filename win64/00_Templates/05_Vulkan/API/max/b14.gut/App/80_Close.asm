CloseWndProc proc

PROLOG 100h

LOG_TEXT szLogWmClose

mov rcx,ghWndMain
lea rdx,szMsgCloseText ;"Exit?"
lea r8,szMainWndTitle ;"Vulkan Template"
mov r9,24h ;MB_YESNO Or MB_ICONQUESTION
Call MessageBoxA
cmp rax,6 ;IDYES
jne lbl_CloseWndProc_End

mov rcx,ghVkLogicalDevice
call vkDeviceWaitIdle

call destroyVkContext

mov rcx,ghWndMain
call DestroyWindow

lbl_CloseWndProc_End:
;Epilogue:
leave
ret
CloseWndProc endp

