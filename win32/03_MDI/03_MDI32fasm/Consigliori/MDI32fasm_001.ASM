format PE GUI 4.0
entry WinMain

include 'win32a.inc'

    IDR_MAINMENU = 100h
    IDR_CHILDMENU = 101h
    ;IDR_ACCEL = 200h
;File
    IDM_NEW = 1100h
    IDM_CLOSE = 1F00h
    IDM_CLOSEALL = 01FF0h
    IDM_EXIT = 1FFFh
;Window
    IDM_TILEHORZ = 0E001h
    IDM_TILEVERT = 0E002h
    IDM_CASCADE = 0E004h
;Help
    IDM_ABOUT = 0F000h
;First Child
    IDM_FIRSTCHILD = 800h

section '.data' data readable writeable
;Class Names
    szFrameClass db 'MDIFrame',0
    szClientClass db 'MDICLIENT',0 ;Pre-defined by System
    szChildClass db 'MDIChild',0
;Window Captions
    szFrameTitle db 'Win32 MDI fasm Demo',0
    szChildTitle db 'MDI Child',0
;Window Handles
    hInstance dd ?
    hWndFrame dd ?
    hWndClient dd ?
    hWndChild dd ?
;Menu Handles
    hMenu dd ?
    hMainMenu dd ?
    hChildMenu dd ?
    hMainSubMenu dd ?
    hChildSubMenu dd ?
    ;hAccel dd ?
;Structures
    WndClass WNDCLASSEX
    msg MSG
    MDICreate MDICREATESTRUCT
    ClientCreate CLIENTCREATESTRUCT
;Info Messages
    szHello db 'Hello, 32-bit World!',0
    szAbout db 'Inspired by Charles Petzold',0
;Prompt Messages
    szClose db 'Close Child Window?',0
    szExit db 'Exit Application?',0

;********************************************************************
section '.text' code readable executable

;==============================================================================================
;int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
;==============================================================================================
proc WinMain uses ebx esi edi;, hInst:DWORD, hPrevInst:DWORD, CmdLine:DWORD, CmdShow:DWORD

    invoke GetModuleHandle,0
    mov [hInstance], eax ;Global
    ;mov [hInst],eax ;Local is not used

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
	mov [WndClass.cbSize], sizeof.WNDCLASSEX
	mov [WndClass.style], 3 ;CS_HREDRAW | CS_VREDRAW
	mov eax, FrameWndProc
	mov [WndClass.lpfnWndProc], eax ;FrameWndProc
	mov [WndClass.cbClsExtra], 0
	mov [WndClass.cbWndExtra], 0
	mov eax, [hInstance]
	mov [WndClass.hInstance], eax
	invoke LoadIcon, 0, 7F00h ;IDI_APPLICATION
	mov [WndClass.hIcon], eax
	mov [WndClass.hIconSm], eax
	invoke LoadCursor, 0, 7F00h ;IDC_ARROW
	mov [WndClass.hCursor], eax
	mov [WndClass.hbrBackground], 0Dh ;COLOR_APPWORKSPACE + 1 = 0Dh
	mov [WndClass.lpszMenuName], 0
	mov eax, szFrameClass
	mov [WndClass.lpszClassName], eax ;szFrameClass
	mov [WndClass.hIconSm], 0
    invoke RegisterClassEx, WndClass
;Register the Child Window Class
;There is no need to refill WNDCLASSEX again - just change some values
	mov eax, ChildWndProc
	mov [WndClass.lpfnWndProc], eax ;ChildWndProc
	mov [WndClass.cbWndExtra], 0
	invoke GetStockObject, 0 ;WHITE_BRUSH
	mov [WndClass.hbrBackground], eax
	mov eax, szChildClass
	mov [WndClass.lpszClassName], eax ;szChildClass
    invoke RegisterClassEx, WndClass

;Obtain handles to all possible menus & submenus
    invoke LoadMenu, [hInstance],IDR_MAINMENU
    mov [hMainMenu], eax
    invoke LoadMenu, [hInstance],IDR_CHILDMENU
    mov [hChildMenu], eax
    invoke GetSubMenu, [hMainMenu], 0 ;Position of SubMenu in MainMenu = 0
    mov [hMainSubMenu], eax
    invoke GetSubMenu, [hChildMenu], 1 ;Position of SubMenu in ChildMenu = 1
    mov [hChildSubMenu], eax

;Load accelerator table
    ;invoke LoadAccelerators, [hInst], IDR_ACCEL
    ;mov [hAccel], rax

;Create the Frame Window
    invoke CreateWindowEx, 0, szFrameClass, szFrameTitle,\
	   WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN,\
	   CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,\
	   NULL, [hMainMenu], [hInstance], NULL
    mov [hWndFrame], eax

;Get Client Window Handle
    invoke GetWindow, [hWndFrame], GW_CHILD
    mov [hWndClient], eax

;Show and Update the Frame Window
    invoke ShowWindow, [hWndFrame], 1 ;nCmdShow = SW_SHOWNORMAL = 1
    invoke UpdateWindow, [hWndFrame]

;Enter the Loop
MsgLoop:
    invoke GetMessage, msg, 0, 0, 0
    cmp eax, 0
	je CleanUp
    invoke TranslateMDISysAccel, [hWndClient], msg
    cmp eax,0
	jne MsgLoop
    invoke TranslateMessage, msg
    invoke DispatchMessage, msg
jmp MsgLoop

CleanUp:
    invoke DestroyMenu, [hChildMenu]

EndAll:
    invoke ExitProcess, [msg.wParam] ;return msg.wParam;
endp ;WinMain

;=================================================================================
;LRESULT CALLBACK FrameWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;=================================================================================
proc FrameWndProc hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD

;Window Messages processing
    mov edx,[uMsg]
    cmp edx, WM_CREATE ;0x0001
	je wmFrameCreate
    cmp edx, WM_COMMAND ;0x0111
	je wmFrameCommand
    cmp edx, WM_CLOSE ;0x0010
	je wmFrameClose
    cmp edx, WM_DESTROY ;0x0002
	je wmFrameDestroy
    jmp defFrameWndProc

wmFrameCreate: ;Create the Client Window
    mov eax, [hMainSubMenu]
    mov [ClientCreate.hWindowMenu], eax
    mov [ClientCreate.idFirstChild], IDM_FIRSTCHILD
    invoke CreateWindowEx, 0, szClientClass, 0,\
	   WS_CHILD or WS_VISIBLE or WS_CLIPCHILDREN,\
	   CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,\
	   [hWnd], 0, [hInstance], ClientCreate
    mov [hWndClient], eax
    jmp finFrameWndProc
wmFrameCommand:
    ;Distributing with respect to wParam
	mov eax,[wParam]
	cmp eax, IDM_NEW
	    je idmFrameNew
	cmp eax, IDM_CLOSE
	    je idmFrameClose
	cmp eax, IDM_CLOSEALL
	    je idmFrameCloseAll
	cmp eax, IDM_EXIT
	    je idmFrameExit
	cmp eax, IDM_TILEHORZ
	    je idmFrameTileHorz
	cmp eax, IDM_TILEVERT
	    je idmFrameTileVert
	cmp eax, IDM_CASCADE
	    je idmFrameCascade
	cmp eax, IDM_ABOUT
	    je idmFrameAbout
	jmp defFrameCmd
    idmFrameNew:
	;Initialize the MDICREATESTRUCT
	    mov eax, szChildClass
	    mov [MDICreate.szClass],eax
	    mov eax,szChildTitle
	    mov [MDICreate.szTitle],eax
	    mov eax,[hInstance]
	    mov [MDICreate.hOwner],eax
	    mov [MDICreate.x],CW_USEDEFAULT
	    mov [MDICreate.y],CW_USEDEFAULT
	    mov [MDICreate.cx],CW_USEDEFAULT
	    mov [MDICreate.cy],CW_USEDEFAULT
	    mov [MDICreate.style],0
	    mov [MDICreate.lParam],0
	invoke SendMessage, [hWndClient], WM_MDICREATE, 0, MDICreate
	mov [hWndChild], eax
	jmp finFrameWndProc
    idmFrameClose: ;Close the active window
	invoke SendMessage, [hWndClient], WM_MDIGETACTIVE, 0, 0
	mov [hWndChild], eax
	invoke SendMessage, [hWndChild], WM_QUERYENDSESSION, 0, 0
	cmp eax, 0
	    je finFrameWndProc
	invoke SendMessage, [hWndClient], WM_MDIDESTROY, [hWndChild], 0
	jmp finFrameWndProc
    idmFrameCloseAll: ;Attempt to close all children
	invoke EnumChildWindows, [hWndClient], CloseEnumProc, 0
	jmp finFrameWndProc
    idmFrameExit: ;Exit the program
	invoke SendMessage, [hWnd], WM_CLOSE, 0, 0
	jmp finFrameWndProc
    idmFrameTileHorz:
	invoke SendMessage, [hWndClient], WM_MDITILE, MDITILE_HORIZONTAL, 0
	jmp finFrameWndProc
    idmFrameTileVert:
	invoke SendMessage, [hWndClient], WM_MDITILE, MDITILE_VERTICAL, 0
	jmp finFrameWndProc
    idmFrameCascade:
	invoke SendMessage, [hWndClient], WM_MDICASCADE, MDITILE_SKIPDISABLED, 0
	jmp finFrameWndProc
    idmFrameAbout:
	invoke MessageBox, [hWnd], szAbout, szFrameTitle, MB_ICONINFORMATION
	jmp finFrameWndProc
    defFrameCmd:
	;Pass to active child...
	invoke SendMessage, [hWndClient], WM_MDIGETACTIVE, 0, 0
	mov [hWndChild],eax
	invoke IsWindow,[hWndChild]
	cmp eax, 0
	    jne defFrameWndProc
	invoke SendMessage, [hWndChild], WM_COMMAND, [wParam], [lParam]
	;...and then to DefFrameProc
	jmp defFrameWndProc
wmFrameClose:
    ;invoke MessageBox, [hWnd], szExit, szFrameTitle, MB_YESNO
    ;cmp rax, IDYES
	;jne finFrameWndProc
    invoke SendMessage, [hWnd], WM_COMMAND, IDM_CLOSEALL, 0
    invoke GetWindow, [hWndClient], GW_CHILD
    cmp eax, 0
	je defFrameWndProc
    jmp finFrameWndProc
wmFrameDestroy:
    invoke PostQuitMessage, 0
    jmp finFrameWndProc
defFrameWndProc:
    invoke DefFrameProc, [hWnd],[hWndClient],[uMsg],[wParam],[lParam]
finFrameWndProc:
    ret
endp	;WndProc

;=====================================================
;BOOL CALLBACK CloseEnumProc(HWND hwnd, LPARAM lParam)
;=====================================================
proc CloseEnumProc uses ebx esi edi, hWnd:DWORD, lParam:DWORD

    invoke GetWindow, [hWnd], GW_OWNER ;Check for icon title
    cmp eax, 0
	jne finCloseEnumProc

    invoke GetParent, [hWnd]
    invoke SendMessage, eax, WM_MDIRESTORE, [hWnd], 0

    invoke SendMessage, [hWnd], WM_QUERYENDSESSION, 0, 0
    cmp eax, 0
	je finCloseEnumProc

    invoke GetParent, [hWnd]
    invoke SendMessage, eax, WM_MDIDESTROY, [hWnd], 0

finCloseEnumProc:
    mov eax, 1
    ret
endp ;CloseEnumProc

;=================================================================================
;LRESULT CALLBACK ChildWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;=================================================================================
proc ChildWndProc uses ebx esi edi, hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD

;Distributing with respect to uMsg
    mov edx, [uMsg]
    cmp edx, WM_CREATE ;0x0001
	je wmChildCreate
    cmp edx, WM_MDIACTIVATE ;0x0222
	je wmChildActivate
    ;cmp edx, WM_COMMAND ;0x0111
	;je wmChildCommand
    cmp edx, WM_LBUTTONUP ;0x0202
	je wmChildLButtonUp
    cmp edx, WM_CLOSE ;0x0010
	je wmChildClose
    cmp edx, WM_DESTROY ;0x0002
	je wmChildDestroy
    jmp defChildWndProc ;Pass unprocessed message to DefMDIChildProc

wmChildCreate:
    ;Save some window handles ;Why?!
	invoke GetParent, [hWnd]
	mov [hWndClient], eax
	invoke GetParent, [hWndClient]
	mov [hWndFrame], eax
    jmp finChildWndProc

wmChildActivate:
    mov ecx, [hWnd]
    mov eax, [lParam]
    cmp eax, ecx
	jne notChild
    ;Child:
	invoke SendMessage, [hWndClient], WM_MDISETMENU, [hChildMenu], [hChildSubMenu]
	invoke DrawMenuBar, [hWndFrame]
	jmp finChildWndProc
    notChild: ;lParam != hWndChild
	invoke SendMessage,[hWndClient], WM_MDISETMENU, [hMainMenu], [hMainSubMenu]
	invoke DrawMenuBar, [hWndFrame]
	jmp finChildWndProc

wmChildLButtonUp:
    invoke MessageBox, [hWnd], szHello, szChildTitle, 30h ;MB_ICONEXCLAMATION+MB_OK
    jmp finChildWndProc

wmChildClose:
    invoke MessageBox, [hWnd], szClose, szChildTitle, MB_ICONQUESTION or MB_OKCANCEL
    cmp eax, IDOK
	je defChildWndProc
    jmp finChildWndProc

wmChildDestroy:
    nop
    jmp finChildWndProc

defChildWndProc: ;Pass unprocessed message to DefMDIChildProc
    invoke DefMDIChildProc, [hWnd], [uMsg], [wParam], [lParam]
finChildWndProc:
    ret
endp	;ChildProc

;*********************************************************************
section '.idata' import data readable writeable

    library kernel32,'KERNEL32.DLL',\
	    user32,'USER32.DLL',\
	    gdi32, 'GDI32.dll'

    include 'api\kernel32.inc'
    include 'api\user32.inc'
    include 'api\gdi32.inc'

section '.rsrc' resource data readable

    ;resource directory

    directory RT_MENU,menus,\
	      RT_VERSION,versions

    ;resource subdirectories

    resource menus,\
	     IDR_MAINMENU, LANG_ENGLISH+SUBLANG_DEFAULT, MainMenu,\
	     IDR_CHILDMENU, LANG_ENGLISH+SUBLANG_DEFAULT, ChildMenu

    menu MainMenu
	 menuitem '&File', 0, MFR_POPUP
		  menuitem '&New', IDM_NEW
		  menuseparator
		  menuitem 'E&xit', IDM_EXIT,MFR_END
	 menuitem '&Help', 0, MFR_POPUP+MFR_END
		  menuitem '&About...', IDM_ABOUT,MFR_END

    menu ChildMenu
	 menuitem '&File', 0, MFR_POPUP
		  menuitem '&New', IDM_NEW
		  menuitem '&Close', IDM_CLOSE
		  menuitem 'Close &All', IDM_CLOSEALL
		  menuseparator
		  menuitem 'E&xit', IDM_EXIT,MFR_END
	 menuitem '&Window', 0, MFR_POPUP
		  menuitem 'Tile &Horizontal', IDM_TILEHORZ
		  menuitem 'Tile &Vertical', IDM_TILEVERT
		  menuitem 'Ca&scade', IDM_CASCADE,MFR_END
	 menuitem '&Help', 0, MFR_POPUP+MFR_END
		  menuitem '&About...', IDM_ABOUT,MFR_END

    resource versions,\
	     1,LANG_NEUTRAL,version

    versioninfo version,0,VFT_APP,0,LANG_ENGLISH+SUBLANG_DEFAULT,0,\
		'FileDescription','Multiple Document Interface',\
		'LegalCopyright','All rights spread among community',\
		'FileVersion','0.33',\
		'ProductVersion','0.33',\
		'OriginalFilename','fasm64MDI_000.exe'