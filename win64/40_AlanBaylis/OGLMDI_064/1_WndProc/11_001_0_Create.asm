;https://learn.microsoft.com/en-us/windows/win32/winmsg/using-the-multiple-document-interface
;case WM_CREATE: 
lbl_WndProc_Create:

;Retrieve the handle to the window menu and assign the first child window identifier
include 11_001_1_MenuMain.asm ;ccs.hWindowMenu = GetSubMenu(GetMenu(hwnd), WINDOWMENU);
cmp ccs.hWindowMenu,0
je lbl_CreateSubMenu_Err

mov ccs.idFirstChild,ID_MDI_FIRSTCHILD

;https://github.com/dotnet/winforms/blob/e4ede9b8979b9d2b1b1d4383f30a791414f0625b/src/System.Windows.Forms/src/System/Windows/Forms/MDIClient.cs
;Don't set the MDIS_ALLCHILDSTYLES CreatParams.Style bit, it prevents an MDI child form from getting
;activated when made visible (no WM_MDIACTIVATE sent to it), and forcing activation on it changes the
;activation event sequence (MdiChildActivate/Enter/Focus/Activate/etc.).

;hwndMDIClient = CreateWindow( "MDICLIENT", (LPCTSTR) NULL, 
;WS_CHILD | WS_CLIPCHILDREN | WS_VSCROLL | WS_HSCROLL, 
;0, 0, 0, 0, hwnd, (HMENU) 0xCAC, hInst, (LPSTR) &ccs); 
xor rcx,rcx ;dwExStyle
lea rdx,szClientClassName ;lpszFrameClass
xor r8,r8 ;lpszFrameTitle
mov r9,52000000h ;WS_CHILD | WS_VISIBLE | WS_CLIPCHILDREN
mov rax,80000000h ;CW_USEDEFAULT
mov qword ptr[rsp+20h],rax ;x
mov qword ptr[rsp+28h],rax ;y
mov qword ptr[rsp+30h],rax ;nWidth
mov qword ptr[rsp+38h],rax ;nHeight
mov rax,hWnd
mov qword ptr[rsp+40h],rax ;hWndParent
mov qword ptr[rsp+48h],0 ;hMenu = ID_MDI_CLIENT. Charles Petzold set it to 1
mov rax,g_hInst
mov qword ptr[rsp+50h],rax
lea rax,ccs
mov qword ptr[rsp+58h],rax ;lpParam == lpClientStruct
Call CreateWindowExA
mov g_hMDIClient,rax
cmp rax,0 ;hChild
je lbl_CreateMDIClient_Err

jmp lbl_WndProc_Return0

