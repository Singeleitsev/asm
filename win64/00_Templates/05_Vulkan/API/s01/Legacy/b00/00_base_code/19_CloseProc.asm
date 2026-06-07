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

;lea rcx,ghAccTable
;Call DestroyAcceleratorTable

;mov rcx,ghWndMain
;mov rdx,ghDC
;Call ReleaseDC

mov rcx,ghWndMain
Call DestroyWindow

lbl_CloseWndProc_End:
;Epilogue:
leave
ret
CloseWndProc endp

