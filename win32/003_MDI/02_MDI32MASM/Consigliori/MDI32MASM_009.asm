;Created with The Honourable Consigliori:
;CPU: Intel Pentium III (Katmai) @ 550MHz
;MBoard: Acorp 6VIA81
;Memory: NoName(?) 128M
;VCard: nVidia GeForce4 64M
;January, 4, 2018, Samara

;Modified with Asus GL552VX Laptop PC
;January, 11, 2018, Krasnodar

.386
.model flat, stdcall
option casemap:none

;Standard Includes and Libraries
	include D:\masm32\include\windows.inc
	include D:\masm32\include\kernel32.inc
	include D:\masm32\include\user32.inc
	include D:\masm32\include\gdi32.inc
	includelib D:\masm32\lib\kernel32.lib
	includelib D:\masm32\lib\user32.lib
	includelib D:\masm32\lib\gdi32.lib
;Custom includes
	include include\struct32_02.inc
	include include\Mem_04.inc

.const
        IDR_MAINMENU    = 100h
        IDR_CHILDMENU   = 110h
	;IDR_ACCEL	= 200h
;File
        IDM_NEW         = 1100h
        IDM_CLOSE       = 1F00h
        IDM_EXIT        = 1FFFh
;Window
        IDM_TILEHORZ    = 0E001h
        IDM_TILEVERT    = 0E002h
        IDM_CASCADE     = 0E004h
;Help
        IDM_ABOUT       = 0F000h

        IDM_FIRSTCHILD  = 800h

.data
;Class Names
        szFrameClass db "MdiFrame",0
        szClientClass db "MDICLIENT",0
        szChildClass db "MdiChild",0
;Window Captions
        szFrameTitle db "Win32 MDI Demo",0
        szChildTitle db "MDI Child",0
;Info Messages
	szHello db 'Hello, World!',0
	szAbout db 'Inspired by Charles Petzold, Iczelion, and Mikl___',0
;Prompt Messages
        szClose db "Close this Child Window?",0
        szExit db "Close this Application?",0
;Error Messages
        szErrMenu db "Failed to load Menu",0
        szErrWinMain db "Error in WinMain",0

.data?
;Window Handles
        hInstance dd ?
        hWndFrame dd ?
        hWndClient dd ?
        hWndChild dd ?
;Menu Handles
        hMainMenu dd ?
        hMainSubMenu dd ?
        hChildMenu dd ?
        hChildSubMenu dd ?
;Structures
        wc WNDCLASSEX32 <>
        msg MSG32 <>
        MDICreate MDICREATESTRUCT32 <>
        ClientStruct CLIENTCREATESTRUCT32 <>

.code
;===========
WinMain proc
;===========

        invoke GetModuleHandleA, 0
        mov hInstance,eax

;Register the Frame Window Class
        mov wc.cbSize,30h ;dword ptr sizeof WNDCLASSEX32
        mov wc.style, 3 ;CS_HREDRAW + CS_VREDRAW = 2 + 1 = 3
        m32addr wc.lpfnWndProc,FrameWndProc
        mov wc.cbClsExtra,0
        mov wc.cbWndExtra,0
        m32m32 wc.hInstance,hInstance
        invoke LoadIcon, 0,7F00h ;IDI_APPLICATION
                mov wc.hIcon,eax
                mov wc.hIconSm,eax
        invoke LoadCursorA, 0,7F00h ;IDC_ARROW
                mov wc.hCursor,eax
        mov wc.hbrBackground,0Dh ;COLOR_APPWORKSPACE + 1
        mov wc.lpszMenuName,0
        m32addr wc.lpszClassName,szFrameClass
        invoke RegisterClassExA, offset wc
		cmp eax, 0
		je errWinMain

;Register the Child Window Class
        m32addr wc.lpfnWndProc,ChildWndProc
        mov wc.cbWndExtra,0
        invoke GetStockObject, 0 ;WHITE_BRUSH
                mov wc.hbrBackground,eax
        m32addr wc.lpszClassName,szChildClass
        invoke RegisterClassExA, offset wc
		cmp eax, 0
		je errWinMain

;Get Menu Handles
        invoke LoadMenuA, hInstance, IDR_MAINMENU ;lpMenuName
	        mov hMainMenu,eax
		cmp eax, 0
		je errMenu
        invoke GetSubMenu, hMainMenu, 0 ;nPos = 0; 'File' Menu Position is 0
	        mov hMainSubMenu,eax
		cmp eax, 0
		je errMenu
        invoke LoadMenuA, hInstance, IDR_CHILDMENU
	        mov hChildMenu,eax
		cmp eax, 0
		je errMenu
        invoke GetSubMenu, hChildMenu, 1 ;nPos = 1; 'Window' Menu Position is 1
	        mov hChildSubMenu,eax
		cmp eax, 0
		je errMenu

;Load accelerator table
	;invoke LoadAccelerators, hInst, IDR_ACCEL
		;mov hAccel, eax
		;cmp eax, 0
		;je errMenu

;Create the Frame Window
        invoke CreateWindowExA,0,offset szFrameClass,offset szFrameTitle,\
        	2CF0000h,\ ;WS_OVERLAPPEDWINDOW + WS_CLIPCHILDREN
        	80000000h,80000000h,80000000h,80000000h,\ ;CW_USEDEFAULT
        	0,hMainMenu,hInstance,0
;	sub esp,48
;	mov dword ptr [esp],0 ;dwExStyle
;	m32addr dword ptr [esp+4],szFrameClass ;lpszFrameClass
;	m32addr dword ptr [esp+8],szFrameTitle ;lpszFrameTitle
;	mov dword ptr [esp+12],2CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW + WS_CLIPCHILDREN
;	mov dword ptr [esp+16],80000000h ;x = CW_USEDEFAULT = 8000.0000h
;	mov dword ptr [esp+20],80000000h ;y = ÑW_USEDEFAULT = 8000.0000h
;	mov dword ptr [esp+24],80000000h ;nWidth = CW_USEDEFAULT = 8000.0000h
;	mov dword ptr [esp+28],80000000h ;nHeight = CW_USEDEFAULT = 8000.0000h
;	mov dword ptr [esp+32],0 ;hWndParent
;	m32m32 dword ptr [esp+36],hMainMenu
;	m32m32 dword ptr [esp+40],hInstance
;	mov dword ptr [esp+44],0 ;lpParam 
;	call CreateWindowExA
        	mov hWndFrame,eax
		cmp eax, 0
		je errWinMain

;Get Client Window Handle
        invoke GetWindow, hWndFrame, 5 ;GW_CHILD = 5
        mov hWndClient,eax ;hWndClient

;Show and Update the Frame Window
        invoke ShowWindow, hWndFrame, 1 ;nCmdShow = SW_SHOWNORMAL = 1
        invoke UpdateWindow,hWndFrame

;Enter the Loop
MsgLoop:
	invoke GetMessageA, offset msg,0,0,0
	cmp ax,0
		je CleanUp
        invoke TranslateMDISysAccel, offset hWndClient, offset msg
        cmp eax,0
		jne MsgLoop
        invoke TranslateMessage, offset msg
        invoke DispatchMessageA, offset msg
jmp MsgLoop

;Error Alarms
errMenu:
	;MB_OK + MB_ICONERROR
        invoke MessageBoxA, 0, offset szErrMenu, offset szFrameTitle, 10h
errWinMain:
        invoke MessageBoxA, 0, offset szErrWinMain, offset szFrameTitle, 10h

CleanUp:
        invoke DestroyMenu, hChildMenu
;There is no need to restore the Stack before exit
        invoke ExitProcess, msg.wParam
WinMain endp



;===================================================================
FrameWndProc proc hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
;===================================================================

;Window Messages processing
        mov edx,uMsg
        cmp edx,1 ;WM_CREATE = 0x0001
                je wmFrameCreate
        cmp edx,111h ;WM_COMMAND = 0x0111
                je wmFrameCommand
        cmp edx,10h ;WM_CLOSE = 0x0010
                je wmFrameClose
        cmp edx,2 ;WM_DESTROY = 0x0002
                je wmFrameDestroy
        jmp defFrameWndProc

wmFrameCreate:
        ;Initialize the CLIENTSTRUCT
		m32m32 ClientStruct.hWindowMenu,hMainSubMenu
		mov ClientStruct.idFirstChild,IDM_FIRSTCHILD
	invoke CreateWindowExA,0,offset szClientClass,0,\
        	52000000h,\ ;WS_CHILD or WS_VISIBLE or WS_CLIPCHILDREN
        	80000000h,80000000h,80000000h,80000000h,\ ;CW_USEDEFAULT
        	hWnd,0,hInstance,offset ClientStruct
	;sub esp,48
        ;mov dword ptr [esp],0 ;dwExStyle
        ;m32addr dword ptr [esp+4],szClientClass ;lpszFrameClass
        ;mov dword ptr [esp+8],0 ;lpszFrameTitle
        ;mov dword ptr [esp+12],52000000h ;dwStyle = WS_OVERLAPPEDWINDOW + WS_CLIPCHILDREN
        ;mov dword ptr [esp+16],80000000h ;x = CW_USEDEFAULT = 8000.0000h
        ;mov dword ptr [esp+20],80000000h ;y = ÑW_USEDEFAULT = 8000.0000h
        ;mov dword ptr [esp+24],80000000h ;nWidth = CW_USEDEFAULT = 8000.0000h
        ;mov dword ptr [esp+28],80000000h ;nHeight = CW_USEDEFAULT = 8000.0000h
        ;m32m32 dword ptr [esp+32],hWnd ;hWndParent
        ;mov dword ptr [esp+36],0 ;hMenu
        ;m32m32 dword ptr [esp+40],hInstance
        ;m32addr dword ptr [esp+44],ClientStruct ;lpParam == lpClientStruct
	;call CreateWindowExA
		mov hWndClient,eax
		jmp finFrameWndProc

wmFrameCommand:
        mov eax,lParam
        cmp eax,0
                jne finFrameWndProc
        ;Distributing with respect to wParam
	mov eax,wParam
        cmp eax,IDM_NEW
                je idmFrameNew
        cmp eax,IDM_CLOSE
                je idmFrameClose
        cmp eax,IDM_EXIT
                je idmFrameExit
        cmp eax,IDM_TILEHORZ
                je idmFrameTileHorz
        cmp eax,IDM_TILEVERT
                je idmFrameTileVert
        cmp eax,IDM_CASCADE
                je idmFrameCascade
        cmp eax,IDM_ABOUT
                je idmFrameAbout
        jmp defFrameCmd

        idmFrameNew:
		;Initialize the MDICREATESTRUCT
                        m32addr MDICreate.szClass,szChildClass
                        m32addr MDICreate.szTitle,szChildTitle
                        m32m32 MDICreate.hOwner,hInstance
                        mov eax, 80000000h ;CW_USEDEFAULT
                        mov MDICreate.x, eax
                        mov MDICreate.y, eax
                        mov MDICreate.lx, eax
                        mov MDICreate.ly, eax
                        mov MDICreate.style, 0
                        mov MDICreate.lParam, 0
                ;WM_MDICREATE = 0x0220
                invoke SendMessageA, hWndClient, 220h, 0, offset MDICreate
                mov hWndChild,eax
                jmp finFrameWndProc
        idmFrameClose:
                ;WM_MDIGETACTIVE = 0x0229
                invoke SendMessageA, hWndClient, 229h, 0, 0
		mov hWndChild,eax
                ;WM_CLOSE = 0x0010
                invoke SendMessageA, hWndChild, 10h, 0, 0
                jmp finFrameWndProc
        idmFrameExit:
                ;WM_CLOSE = 0x0010
                invoke SendMessageA, hWnd, 10h, 0, 0
                jmp finFrameWndProc
        idmFrameTileHorz:
                ;WM_MDITILE = 0x0226 ;MDITILE_HORIZONTAL = 1
                invoke SendMessageA, hWndClient, 226h, 1, 0
                jmp finFrameWndProc
        idmFrameTileVert:
                ;WM_MDITILE = 0x0226 ;MDITILE_VERTICAL = 0
                invoke SendMessageA, hWndClient, 226h, 0, 0
                jmp finFrameWndProc
        idmFrameCascade:
                ;WM_MDICASCADE = 0x0227 ;MDITILE_SKIPDISABLED = 2
                invoke SendMessageA, hWndClient, 227h, 2, 0
                jmp finFrameWndProc
        idmFrameAbout:
		;MB_OK + MB_ICONINFORMATION = 40h
                invoke MessageBoxA, hWnd, offset szAbout, offset szFrameTitle, 40h
                jmp finFrameWndProc
        defFrameCmd:
                ;Pass to active child...
                        ;WM_MDIGETACTIVE = 0x0229
                        invoke SendMessageA, hWndClient, 229h, 0, 0
                        mov hWndChild,eax
                        invoke IsWindow, hWndChild
                        cmp eax,0
			jne defFrameWndProc
                        ;WM_COMMAND = 0x0111
                        invoke SendMessageA, hWndChild, 111h, 0, 0
                ;...and then to DefFrameProc
                        jmp defFrameWndProc

wmFrameClose:
	;MB_YESNO = 0x00000004L
        invoke MessageBoxA, hWnd, offset szExit, offset szFrameTitle, 4
        cmp eax,6 ;IDYES
                jne finFrameWndProc
	;WM_DESTROY ;0x0002
        invoke SendMessageA, hWnd, 2, 0, 0
        jmp finFrameWndProc
wmFrameDestroy:
        invoke PostQuitMessage, 0
        xor eax,eax
        jmp finFrameWndProc
defFrameWndProc:
        invoke DefFrameProcA, hWnd, hWndClient, uMsg, wParam, lParam
finFrameWndProc:
        ret
FrameWndProc endp

;================================================================
ChildWndProc proc hWnd:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
;================================================================

;Distributing with respect to uMsg
        mov edx,uMsg
        cmp edx,1 ;WM_CREATE = 0x0001
                je wmChildCreate
        cmp edx,222h ;WM_MDIACTIVATE = 0x0222
                je wmChildActivate
        cmp edx,202h ;WM_LBUTTONUP = 0x0202
                je wmChildLButtonUp
        cmp edx,10h ;WM_CLOSE = 0x0010
                je wmChildClose
        jmp defChildWndProc

wmChildCreate:
	nop
        jmp finChildWndProc

wmChildActivate:
        mov ecx, hWnd
        mov eax, lParam
        cmp eax,ecx
                jne notChild
        ;Child:
                ;WM_MDISETMENU = 0x0230
                invoke SendMessageA, hWndClient, 230h, hChildMenu, hChildSubMenu
                invoke DrawMenuBar, hWndFrame
                jmp finChildWndProc
        notChild:
                ;WM_MDISETMENU = 0x0230
                invoke SendMessageA, hWndClient, 230h, hMainMenu, hMainSubMenu
                invoke DrawMenuBar, hWndFrame
                jmp finChildWndProc

wmChildLButtonUp:
        ;MB_OK + MB_ICONINFORMATION = 40h
        invoke MessageBoxA, hWnd, offset szHello, offset szFrameTitle, 40h
        jmp finChildWndProc

wmChildClose:
	;MB_YESNO = 0x00000004L
        invoke MessageBoxA, hWnd, offset szClose, offset szFrameTitle, 4
        cmp eax,6 ;IDYES = 6
                jne finChildWndProc
        ;WM_MDIDESTROY = 0x0221
        invoke SendMessageA, hWndClient, 221h, hWnd, 0
        jmp finChildWndProc

defChildWndProc:
        invoke DefMDIChildProcA, hWnd, uMsg, wParam, lParam
finChildWndProc:
        ret
ChildWndProc endp
end