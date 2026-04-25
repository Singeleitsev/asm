lbl_WinMain_MsgLoop:

lea rcx,msg ;lpMsg
xor rdx,rdx ;All window messages and thread messages are processed
xor r8,r8 ;Return all available messages (no range filtering)
xor r9,r9 ;Return all available messages (no range filtering)
mov qword ptr [rsp+20h],1 ;PM_REMOVE Messages are removed from the queue after processing
call PeekMessageA

cmp rax,0 ;Is there a Message?
jne lbl_WinMain_ProceedMessage

;lbl_WinMain_CheckActive:
cmp isActive,0 ;No Messages. Is the Window Active?
je lbl_WinMain_MsgLoop

;lbl_WinMain_ReDraw:
;call DrawGLScene ;No Messages. The Window is Active
jmp lbl_WinMain_MsgLoop

lbl_WinMain_ProceedMessage:
cmp rax,12h ;msg.message == WM_QUIT
je lbl_WinMain_End
cmp rax,-1 ;msg.message == Error
je lbl_WinMain_End

mov rcx,g_hWndClient
lea rdx,msg
call TranslateMDISysAccel
cmp rax,0
jne lbl_WinMain_MsgLoop

mov rcx,g_hWndFrame
mov rdx,g_hAccel
lea r8,msg
call TranslateAcceleratorA
cmp rax,0
jne lbl_WinMain_MsgLoop

lea rcx,msg
call TranslateMessage
lea rcx,msg
call DispatchMessageA
jmp lbl_WinMain_MsgLoop


