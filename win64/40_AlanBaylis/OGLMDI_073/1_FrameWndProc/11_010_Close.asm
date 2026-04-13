;case WM_CLOSE:
lbl_FrameWndProc_Close:

;Get active MDI child window handle
mov rcx,g_hWndClient
mov rdx,229h ;WM_MDIGETACTIVE
xor r8,r8
xor r9,r9
call SendMessageA
test rax,rax
jz lbl_FrameWndProc_Close_Frame

;Send WM_CLOSE to the active child
mov rcx,rax ;hWndChild
mov rdx,10h ;WM_CLOSE
xor r8,r8
xor r9,r9
call SendMessageA
jmp lbl_FrameWndProc_Return0

lbl_FrameWndProc_Close_Frame:
mov rcx,hWnd
call DestroyWindow
jmp lbl_FrameWndProc_Return0

