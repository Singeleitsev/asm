;case WM_CLOSE:
lbl_FrameWndProc_Close:

cmp g_iNumChild,0
je lbl_FrameWndProc_Close_Frame ;If no Childreh then close the Frame

;lbl_FrameWndProc_Close_Child:
mov rcx,g_hWndClient
mov rdx,229h ;WM_MDIGETACTIVE
xor r8,r8
xor r9,r9
call SendMessageA
;mov hWndChild,rax
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

