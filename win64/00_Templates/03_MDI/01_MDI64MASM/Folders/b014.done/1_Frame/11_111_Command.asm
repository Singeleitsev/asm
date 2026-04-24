wmFrameCommand:

;switch (wParam)
cmp r8w,IDM_FILE_NEW_CHILD_0
je lbl_MenuFrame_FileNewChild0
cmp r8w,IDM_FILE_NEW_CHILD_1
je lbl_MenuFrame_FileNewChild1
cmp r8w,IDM_FILE_CLOSE
je lbl_MenuFrame_FileClose
cmp r8w,IDM_FILE_EXIT
je lbl_MenuFrame_FileExit
cmp r8w,IDM_WINDOW_TILE
je lbl_MenuFrame_WindowTile
cmp r8w,IDM_WINDOW_CASCADE
je lbl_MenuFrame_WindowCascade
cmp r8w,IDM_WINDOW_ARRANGE
je lbl_MenuFrame_WindowArrange
cmp r8w,IDM_WINDOW_CLOSEALL
je lbl_MenuFrame_WindowCloseAll
;jmp defFrmCmd

defFrmCmd:
;Default - Pass to active child...
mov rcx,g_hWndClient
mov rdx,229h ;WM_MDIGETACTIVE
xor r8,r8
xor r9,r9
call SendMessageA
mov hwndChild,rax

mov rcx,hwndChild
call IsWindow
cmp rax,0
je defFrmProc ;Break

mov rcx,hwndChild
mov rdx,111h ;WM_COMMAND
mov r8,wParam
mov r9,lParam
call SendMessageA
jmp defFrmProc


lbl_MenuFrame_FileNewChild0:
;Fill the mdicreate Struct
lea rax,szClassChild0
mov mdicreate.szClass,rax
lea rax,szTitleChild0
mov mdicreate.szTitle,rax
mov rax,g_hInst
mov mdicreate.hOwner,rax
mov rax,80000000h ;CW_USEDEFAULT
mov mdicreate.xPos,eax
mov mdicreate.yPos,eax
mov mdicreate.cxWidth,eax
mov mdicreate.cyHeight,eax
mov mdicreate.style,0
mov mdicreate.lParam,0

mov rcx,g_hWndClient
mov rdx,220h ;WM_MDICREATE
xor r8,r8
lea r9,mdicreate
call SendMessageA
mov hwndChild,rax

jmp lblFrmCmdRet0


lbl_MenuFrame_FileNewChild1:
;Fill the mdicreate Struct
lea rax,szClassChild1
mov mdicreate.szClass,rax
lea rax,szTitleChild1
mov mdicreate.szTitle,rax
mov rax,g_hInst
mov mdicreate.hOwner,rax
mov rax,80000000h ;CW_USEDEFAULT
mov mdicreate.xPos,eax
mov mdicreate.yPos,eax
mov mdicreate.cxWidth,eax
mov mdicreate.cyHeight,eax
mov mdicreate.style,0
mov mdicreate.lParam,0

mov rcx,g_hWndClient
mov rdx,220h ;WM_MDICREATE
xor r8,r8
lea r9,mdicreate
call SendMessageA
mov hwndChild,rax

jmp lblFrmCmdRet0


lbl_MenuFrame_FileClose:
mov rcx,g_hWndClient
mov rdx,229h ;WM_MDIGETACTIVE
xor r8,r8
xor r9,r9
call SendMessageA
mov hwndChild,rax

;In Windows NT, WM_QUERYENDSESSION can be sent only to the Frame Window
mov rcx,hwndChild
mov rdx,11h ;WM_QUERYENDSESSION
xor r8,r8
xor r9,r9
call SendMessageA
test rax,rax
je lblFrmCmdRet0

mov rcx,g_hWndClient
mov rdx,221h ;WM_MDIDESTROY
mov r8,hwndChild
xor r9,r9
call SendMessageA

jmp lblFrmCmdRet0

lbl_MenuFrame_FileExit:
mov rcx,hwnd
mov rdx,10h ;WM_CLOSE
xor r8,r8
xor r9,r9
call SendMessageA
jmp lblFrmCmdRet0

lbl_MenuFrame_WindowTile:
mov rcx,g_hWndClient
mov rdx,226h ;WM_MDITILE
xor r8,r8
xor r9,r9
call SendMessageA
jmp lblFrmCmdRet0

lbl_MenuFrame_WindowCascade:
mov rcx,g_hWndClient
mov rdx,227h ;WM_MDICASCADE
xor r8,r8
xor r9,r9
call SendMessageA
jmp lblFrmCmdRet0

lbl_MenuFrame_WindowArrange:
mov rcx,g_hWndClient
mov rdx,228h ;WM_MDIICONARRANGE
xor r8,r8
xor r9,r9
call SendMessageA
jmp lblFrmCmdRet0

lbl_MenuFrame_WindowCloseAll:
mov rcx,g_hWndClient
lea rdx, CloseEnumProc
xor r8,r8
call EnumChildWindows
jmp lblFrmCmdRet0


lblFrmCmdRet0:
xor rax, rax
jmp endFrmProc
