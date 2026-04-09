;case WM_COMMAND:
lbl_WndProc_Command:

;switch(LOWORD(wParam))
;Arranged by Menu Position
cmp r8w,CM_FILE_NEW_TOP
je lbl_WndProc_Command_NewTop
cmp r8w,CM_FILE_NEW_FRONT
je lbl_WndProc_Command_NewFront
cmp r8w,CM_FILE_NEW_LEFT
je lbl_WndProc_Command_NewLeft
cmp r8w,CM_FILE_NEW_3D
je lbl_WndProc_Command_New3D
cmp r8w,CM_FILE_OPEN
je lbl_WndProc_Command_Default
cmp r8w,CM_FILE_SAVE
je lbl_WndProc_Command_Default
cmp r8w,CM_FILE_SAVEAS
je lbl_WndProc_Command_Default
cmp r8w,CM_FILE_EXIT
je lbl_WndProc_Close
cmp r8w,CM_EDIT_UNDO
je lbl_WndProc_Command_Default
cmp r8w,CM_EDIT_CUT
je lbl_WndProc_Command_Default
cmp r8w,CM_EDIT_COPY
je lbl_WndProc_Command_Default
cmp r8w,CM_EDIT_PASTE
je lbl_WndProc_Command_Default
cmp r8w,CM_WINDOW_TILEVERT
je lbl_WndProc_Command_WindowTileVert
cmp r8w,CM_WINDOW_TILEHORZ
je lbl_WndProc_Command_WindowTileHorz
cmp r8w,CM_WINDOW_CASCADE
je lbl_WndProc_Command_WindowCascade
cmp r8w,CM_WINDOW_ARRANGE
je lbl_WndProc_Command_WindowArrange

;None of the Above
lbl_WndProc_Command_Default: ;Keep this Label
cmp r8w,ID_MDI_FIRSTCHILD
jge lbl_WndProc_DefFrameProc ;childIDs go directly to DefFrameProc

mov rcx,g_hMDIClient
mov rdx,229h ;WM_MDIGETACTIVE
xor r8,r8
xor r9,r9
Call SendMessageA ;<- Send, not Post
cmp rax,0
je lbl_WndProc_DefFrameProc ;No active child -> fall through to DefFrameProc

mov rcx,rax ;hChild retrieved by SendMessage
mov rdx,111h ;WM_COMMAND
mov r8,wParam
mov r9,lParam
Call SendMessageA
jmp lbl_WndProc_DefFrameProc ;Change from Return0 to DefFrameProc

lbl_WndProc_Command_NewTop:
mov bType,CHILD_TYPE_TOP
jmp lbl_CreateChild
lbl_WndProc_Command_NewFront:
mov bType,CHILD_TYPE_FRONT
jmp lbl_CreateChild
lbl_WndProc_Command_NewLeft:
mov bType,CHILD_TYPE_LEFT
jmp lbl_CreateChild
lbl_WndProc_Command_New3D:
mov bType,CHILD_TYPE_3D
jmp lbl_CreateChild

include 12_CreateChild.asm

lbl_WndProc_Command_WindowTileVert:
mov rcx,g_hMDIClient
mov rdx,226h ;WM_MDITILE
xor r8,r8 ;MDITILE_VERTICAL
xor r9,r9
Call PostMessageA ;<- Post, not Send
jmp lbl_WndProc_Return0

lbl_WndProc_Command_WindowTileHorz:
mov rcx,g_hMDIClient
mov rdx,226h ;WM_MDITILE
mov r8,1 ;MDITILE_HORIZONTAL
xor r9,r9
Call PostMessageA ;<- Post, not Send
jmp lbl_WndProc_Return0

lbl_WndProc_Command_WindowCascade:
mov rcx,g_hMDIClient
mov rdx,227h ;WM_MDICASCADE
xor r8,r8
xor r9,r9
Call PostMessageA ;<- Post, not Send
jmp lbl_WndProc_Return0

lbl_WndProc_Command_WindowArrange:
mov rcx,g_hMDIClient
mov rdx,228h ;WM_MDIICONARRANGE
xor r8,r8
xor r9,r9
Call PostMessageA ;<- Post, not Send
jmp lbl_WndProc_Return0

