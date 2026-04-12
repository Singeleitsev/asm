;case WM_COMMAND:
lbl_FrameWndProc_Command:

;switch(LOWORD(wParam))
;Arranged by Menu Position
cmp r8w,CM_FILE_NEW_TOP
je lbl_FrameWndProc_Command_NewTop
cmp r8w,CM_FILE_NEW_FRONT
je lbl_FrameWndProc_Command_NewFront
cmp r8w,CM_FILE_NEW_LEFT
je lbl_FrameWndProc_Command_NewLeft
cmp r8w,CM_FILE_NEW_3D
je lbl_FrameWndProc_Command_New3D
cmp r8w,CM_FILE_OPEN
je lbl_FrameWndProc_Return0
cmp r8w,CM_FILE_SAVE
je lbl_FrameWndProc_Return0
cmp r8w,CM_FILE_SAVEAS
je lbl_FrameWndProc_Return0
cmp r8w,CM_FILE_CLOSE
je lbl_FrameWndProc_Close
cmp r8w,CM_FILE_EXIT
je lbl_FrameWndProc_Destroy
cmp r8w,CM_EDIT_UNDO
je lbl_FrameWndProc_Return0
cmp r8w,CM_EDIT_CUT
je lbl_FrameWndProc_Return0
cmp r8w,CM_EDIT_COPY
je lbl_FrameWndProc_Return0
cmp r8w,CM_EDIT_PASTE
je lbl_FrameWndProc_Return0
cmp r8w,CM_WINDOW_TILEVERT
je lbl_FrameWndProc_Command_WindowTileVert
cmp r8w,CM_WINDOW_TILEHORZ
je lbl_FrameWndProc_Command_WindowTileHorz
cmp r8w,CM_WINDOW_CASCADE
je lbl_FrameWndProc_Command_WindowCascade

;None of the Above
lbl_FrameWndProc_Command_Default: ;Keep this Label

;Pass to active child...
mov rcx,g_hWndClient
mov rdx,229h ;WM_MDIGETACTIVE
xor r8,r8
xor r9,r9
call SendMessageA ;<- Send, not Post
cmp rax,0
je lbl_DefFrameProc ;No active child -> fall through to DefFrameProc
mov hWndChildActive,rax

mov rcx,rax ;hWndChildActive
call IsWindow
cmp rax,0
jne lbl_DefFrameProc ;Skip if minimized

mov rcx,hWndChildActive
mov rdx,111h ;WM_COMMAND
mov r8,wParam
mov r9,lParam
call SendMessageA

;...and then to DefFrameProc
jmp lbl_DefFrameProc



include 12_CreateChild.asm



lbl_FrameWndProc_Command_WindowTileVert:
mov rcx,g_hWndClient
mov rdx,226h ;WM_MDITILE
xor r8,r8 ;MDITILE_VERTICAL
xor r9,r9
Call SendMessageA
jmp lbl_FrameWndProc_Return0

lbl_FrameWndProc_Command_WindowTileHorz:
mov rcx,g_hWndClient
mov rdx,226h ;WM_MDITILE
mov r8,1 ;MDITILE_HORIZONTAL
xor r9,r9
Call SendMessageA
jmp lbl_FrameWndProc_Return0

lbl_FrameWndProc_Command_WindowCascade:
mov rcx,g_hWndClient
mov rdx,227h ;WM_MDICASCADE
mov r8,2 ;MDITILE_SKIPDISABLED
xor r9,r9
Call SendMessageA
jmp lbl_FrameWndProc_Return0

