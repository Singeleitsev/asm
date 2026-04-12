;https://learn.microsoft.com/en-us/windows/win32/winmsg/using-the-multiple-document-interface
;case WM_CREATE: 
lbl_WndProc_Create:

;Retrieve the handle to the window menu and assign the first child window identifier
include 11_001_1_MenuMain.asm ;ccs.hWindowMenu = GetSubMenu(GetMenu(hwnd), WINDOWMENU);
cmp ccs.hWindowMenu,0
je lbl_CreateSubMenu_Err

mov ccs.idFirstChild,ID_MDI_FIRSTCHILD

;hwndMDIClient = CreateWindow( "MDICLIENT", (LPCTSTR) NULL, 
;WS_CHILD | WS_CLIPCHILDREN | WS_VSCROLL | WS_HSCROLL, 
;0, 0, 0, 0, hwnd, (HMENU) 0xCAC, hInst, (LPSTR) &ccs); 
mov rcx,200h ;WS_EX_CLIENTEDGE
lea rdx,szClientClassName
xor r8,r8
mov r9,52000000h ;WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN
mov rax,80000000h ;CW_USEDEFAULT
mov qword ptr[rsp+20h],rax
mov qword ptr[rsp+28h],rax
mov qword ptr[rsp+30h],rax
mov qword ptr[rsp+38h],rax
mov rax,hWnd
mov qword ptr[rsp+40h],rax
mov qword ptr[rsp+48h],0 ;ID_MDI_CLIENT
mov rax,g_hInst
mov qword ptr[rsp+50h],rax
lea rax,ccs
mov qword ptr[rsp+58h],rax
Call CreateWindowExA
mov g_hMDIClient,rax
cmp rax,0 ;hChild
je lbl_CreateMDIClient_Err

jmp lbl_WndProc_Return0

