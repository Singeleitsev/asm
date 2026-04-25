lbl_WinMain_MsgLoop:

lea rcx,msg
xor rdx,rdx
xor r8,r8
xor r9,r9
call GetMessageA
test rax,rax
jz lbl_WinMain_End
cmp rax,-1
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

