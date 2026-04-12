;case WM_SYSCOMMAND:
lbl_FrameWndProc_SysCommand:

;switch(LOWORD(wParam))
mov ax,r8w
and ax,0FFF0h
;Arranged by Menu Position
cmp ax,0F120h ;SC_RESTORE
je lbl_FrameWndProc_SysCommand_ReStore
cmp ax,0F060h ;SC_CLOSE
je lbl_FrameWndProc_SysCommand_Close
;None of the Above
jmp lbl_FrameWndProc_DefFrameProc

lbl_FrameWndProc_SysCommand_ReStore:
mov rcx,g_hMDIClient
mov rdx,229h ;WM_MDIGETACTIVE
xor r8,r8
xor r9,r9
Call SendMessageA ;<- Send, not Post
;int 3
cmp rax,0
je lbl_FrameWndProc_DefFrameProc ;No active child -> fall through to DefFrameProc

mov rcx,g_hMDIClient
mov rdx,223h ;WM_MDIRESTORE
mov r8,rax ;hChild retrieved by SendMessage
xor r9,r9
Call PostMessageA ;<- Post, not Send
jmp lbl_FrameWndProc_DefFrameProc

lbl_FrameWndProc_SysCommand_Close:
mov rcx,g_hMDIClient
mov rdx,229h ;WM_MDIGETACTIVE
xor r8,r8
xor r9,r9
Call SendMessageA ;<- Send, not Post
;int 3
cmp rax,0
je lbl_FrameWndProc_DefFrameProc ;No active child -> fall through to DefFrameProc

mov rcx,g_hMDIClient
mov rdx,221h ;WM_MDIDESTROY
mov r8,rax ;hChild retrieved by SendMessage
xor r9,r9
Call PostMessageA ;<- Post, not Send
jmp lbl_FrameWndProc_DefFrameProc

