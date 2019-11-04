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
;Extended Includes and Libraries
	include D:\masm32\include\Advapi32.inc ;extern CryptGenRandom:proc
	includelib D:\masm32\lib\Advapi32.lib
;Custom includes
	include include\struct32_02.inc
	include include\Mem_04.inc

.const
;Position of SubMenu in Menus
	INIT_MENU_POS equ 0 ;Position in MenuInit = 0
	HELLO_MENU_POS equ 2 ;Position in MenuHello = 2
	RECT_MENU_POS equ 1 ;Position in MenuRect = 1
;File
	IDM_NEWHELLO equ 10
	IDM_NEWRECT equ 11
	IDM_CLOSE equ 12
	IDM_EXIT equ 13
;Color
	IDM_BLACK equ 20
	IDM_RED equ 21
	IDM_GREEN equ 22
	IDM_BLUE equ 23
	IDM_WHITE equ 24
;Window
	IDM_TILE equ 30
	IDM_CASCADE equ 31
	IDM_ARRANGE equ 32
	IDM_CLOSEALL equ 33
;Help
	IDM_ABOUT equ 40
;First Child
	IDM_FIRSTCHILD equ 100
;Added during translation into MASM
	MdiMenuInit equ 50
	MdiMenuHello equ 51
	MdiMenuRect equ 52
	MdiAccel equ 60
 

.data
;Class Names
	szFrameClass db "MdiFrame",0
	szHelloClass db "MdiHelloChild",0
	szRectClass db "MdiRectChild",0
	szClientClass db "MDICLIENT",0 ;Pre-Defined by System
	szMdiAccel db "MdiAccel",0
;Window Captions
	szFrameTitle db "MDI Demonstration",0
	szHelloTitle db "Hello",0
	szRectTitle db "Rectangles",0
;Random Variables
	nRand dd ?
	nRandBuf dd ? ;db 4 dup (?)
	dwLen = $-nRandBuf
;Info Messages
	szHello db 'Hello, World!',0
	szAbout db 'Ч. Петзолд. Программирование для Windows® 95',\
		0Ah,0Dh,'Глава 18 Многооконный интерфейс',0
;Prompt Messages
        szClose db "Close this Child Window?",0
        szExit db "Close this Application?",0
;Error Messages
	szErrFrameHandle db "Failed to get the Frame Window Handle",0
	szErrChildHandle db "Failed to get the Child Window Handle",0
	szErrMenu db "Failed to get the Menu Handle",0
	szErrWinMain db "Error in WinMain Occured",0
	szHeapAlloc db "Failed to allocate memory in Heap",0
	szHeapFree db "Failed to free memory from Heap",0

.data?
;HINSTANCE hInst;
	hInst dd ?
;HMENU hMenuInit,hMenuHello,hMenuRect;
	hMenuInit dd ?
	hMenuHello dd ?
  	hMenuRect dd ?
;HMENU hMenuInitWindow,hMenuHelloWindow,hMenuRectWindow;
  	hMenuInitWindow dd ?
	hMenuHelloWindow dd ?
 	hMenuRectWindow dd ?

.code
start proc
	invoke GetModuleHandleA,0
	mov hInst,eax

	push 1
	push 0
	push 0
	push eax
	call WinMain

	invoke ExitProcess, eax ;msg.wParam
start endp

;================================================================================================
WinMain proc uses ebx esi edi, hInstance:DWORD,hPrevInstance:DWORD,szCmdLine:DWORD,iCmdShow:DWORD
;================================================================================================
	LOCAL hAccel:DWORD
	LOCAL hwndFrame:DWORD, hwndClient:DWORD
	LOCAL msg:MSG32
	LOCAL wc:WNDCLASSEX32

        invoke GetModuleHandleA, 0
        mov hInstance,eax

;Register the Frame Window Class
        mov wc.cbSize,30h ;dword ptr sizeof WNDCLASSEX32
        mov wc.style,3 ;CS_HREDRAW + CS_VREDRAW = 2 + 1 = 3
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
        invoke RegisterClassExA, addr wc
		cmp eax,0
		je errWinMain
;Register the Hello Child Window Class
        m32addr wc.lpfnWndProc,HelloWndProc
        invoke GetStockObject, 0 ;WHITE_BRUSH
                mov wc.hbrBackground,eax
        m32addr wc.lpszClassName,szChildClass
        invoke RegisterClassExA, addr wc
		cmp eax,0
		je errWinMain
;Register the Rect Child Window Class
        m32addr wc.lpfnWndProc,RectWndProc
	mov wc.cbWndExtra,4 ;sizeof (HANDLE)
        invoke RegisterClassExA, addr wc
		cmp eax,0
		je errWinMain

;Obtain Handles to three possible Menus & SubMenus
        invoke LoadMenuA,hInst,MdiMenuInit
        mov hMenuInit,eax
		cmp eax,0
		je errMenu
        invoke LoadMenuA,hInst,MdiMenuHello
        mov hMenuHello,eax
		cmp eax,0
		je errMenu
        invoke LoadMenuA,hInst,MdiMenuRect
        mov hMenuRect,eax
		cmp eax,0
		je errMenu
        invoke GetSubMenu,hMenuInit,INIT_MENU_POS ;Position of SubMenu in MenuInit = 0
        mov hMenuInitWindow,eax
		cmp eax,0
		je errMenu
        invoke GetSubMenu,hMenuHello,HELLO_MENU_POS ;Position of SubMenu in MenuHello = 2
        mov hMenuHelloWindow,eax
		cmp eax,0
		je errMenu
        invoke GetSubMenu,hMenuRect,RECT_MENU_POS ;Position of SubMenu in MenuRect = 1
        mov hMenuRectWindow,eax
		cmp eax,0
		je errMenu
;Load Accelerator Table
	invoke LoadAccelerators, hInst,offset szMdiAccel
	mov hAccel,eax
		cmp eax,0
		je errMenu

;Create the Frame Window
        invoke CreateWindowExA,0,offset szFrameClass,offset szFrameTitle,\
        	2CF0000h,\ ;WS_OVERLAPPEDWINDOW + WS_CLIPCHILDREN
        	80000000h,80000000h,80000000h,80000000h,\ ;CW_USEDEFAULT
        	0,hMenuInit,hInstance,0
        	mov hwndFrame,eax
		cmp eax, 0
		je errWinMain

;Get Client Window Handle
        invoke GetWindow, hwndFrame, 5 ;GW_CHILD = 5
        mov hwndClient,eax

;Show and Update the Frame Window
        invoke ShowWindow, hwndFrame, 1 ;nCmdShow = SW_SHOWNORMAL = 1
        invoke UpdateWindow,hwndFrame

;Enter the Loop
MsgLoop:
	invoke GetMessageA, addr msg,0,0,0
		cmp ax,0
		je CleanUp
        invoke TranslateMDISysAccel, addr hwndClient, addr msg
		cmp eax,0
		jne MsgLoop
	invoke TranslateAccelerator, hwndFrame, hAccel, addr msg
		cmp eax,0
		jne MsgLoop
        invoke TranslateMessage, addr msg
        invoke DispatchMessageA, addr msg
		jmp MsgLoop

;Error Alarms
errMenu:
	;MB_OK + MB_ICONERROR
        invoke MessageBoxA, 0, addr szErrMenu, addr szFrameTitle, 10h
errWinMain:
        invoke MessageBoxA, 0, addr szErrWinMain, addr szFrameTitle, 10h

CleanUp:
        invoke DestroyMenu, hMenuHello
	invoke DestroyMenu, hMenuRect
;return msg.wParam
	mov eax,msg.wParam
        ret 10h
WinMain endp

;=====================================================================================
FrameWndProc proc uses ebx esi edi, hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
;=====================================================================================
LOCAL hwndClient:HWND
LOCAL clientcreate:CLIENTCREATESTRUCT32
LOCAL hwndChild:HWND
LOCAL mdicreate:MDICREATESTRUCT32

;Window Messages processing
        mov edx,uMsg
        cmp edx,111h ;WM_COMMAND = 0x0111
                je wmFrameCommand
        cmp edx,10h ;WM_CLOSE = 0x0010
                je wmFrameClose
        cmp edx,2 ;WM_DESTROY = 0x0002
                je wmFrameDestroy
        cmp edx,1 ;WM_CREATE = 0x0001
                je wmFrameCreate
        ;cmp edx,11h ;WM_QUERYENDSESSION = 0x0011
                ;je defFrameWndProc
        jmp defFrameWndProc

wmFrameCreate:
        ;Create the Client window
		m32m32 clientcreate.hWindowMenu,hMainInitWindow
		mov clientcreate.idFirstChild,IDM_FIRSTCHILD
	invoke CreateWindowExA,0,addr szClientClass,0,\
        	52000000h,\ ;WS_CHILD or WS_CLIPCHILDREN or WS_VISIBLE
        	80000000h,80000000h,80000000h,80000000h,\ ;CW_USEDEFAULT
        	hWnd,1,hInst,addr clientcreate
		mov hwndClient,eax
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
        cmp eax,IDM_TILE
                je idmFrameTile
        cmp eax,IDM_CASCADE
                je idmFrameCascade
        cmp eax,IDM_ARRANGE
                je idmFrameCascade
        cmp eax,IDM_CLOSEALL
                je idmFrameCascade
        cmp eax,IDM_ABOUT
                je idmFrameAbout
        jmp defFrameCmd

        idmFrameNewHello:
		;Initialize the MDICREATESTRUCT
                        m32addr mdicreate.szClass,szHelloClass
                        m32addr mdicreate.szTitle,szHelloTitle
                        m32m32 mdicreate.hOwner,hInstance
                        mov mdicreate.x, 80000000h
                        mov mdicreate.y, 80000000h
                        mov mdicreate.lx, 80000000h
                        mov mdicreate.ly, 80000000h
                        mov mdicreate.style, 0
                        mov mdicreate.lParam, 0
                ;WM_MDICREATE = 0x0220
                invoke SendMessageA, hwndClient,220h,0,addr mdicreate
                mov hwndChild,eax
		xor eax,eax
                jmp finFrameWndProc
        idmFrameNewRect:
		;Initialize the MDICREATESTRUCT
                        m32addr mdicreate.szClass,szRectClass
                        m32addr mdicreate.szTitle,szRectTitle
                        m32m32 mdicreate.hOwner,hInstance
                        mov mdicreate.x, 80000000h
                        mov mdicreate.y, 80000000h
                        mov mdicreate.lx, 80000000h
                        mov mdicreate.ly, 80000000h
                        mov mdicreate.style, 0
                        mov mdicreate.lParam, 0
                ;WM_MDICREATE = 0x0220
                invoke SendMessageA, hwndClient,220h,0,addr mdicreate
                mov hwndChild,eax
		xor eax,eax
                jmp finFrameWndProc

        idmFrameClose:
                ;WM_MDIGETACTIVE = 0x0229
                invoke SendMessageA, hwndClient,229h,0,0
		mov hwndChild,eax
		;WM_QUERYENDSESSION = 0x0011
		invoke SendMessage, hwndChild,11h,0,0
			cmp eax,0
			je finFrameWndProc ;return 0
                ;WM_MDIDESTROY = 0x0221
                invoke SendMessageA, hwndClient,221h,hwndChild,0
		xor eax,eax
                jmp finFrameWndProc
        idmFrameExit:
                ;WM_CLOSE = 0x0010
                invoke SendMessageA, hWnd,10h,0,0
		xor eax,eax
                jmp finFrameWndProc
        idmFrameTile:
                ;WM_MDITILE = 0x0226 ;MDITILE_VERTICAL = 0
                invoke SendMessageA, hwndClient,226h,0,0
		xor eax,eax
                jmp finFrameWndProc
        idmFrameCascade:
                ;WM_MDICASCADE = 0x0227
                invoke SendMessageA, hwndClient,227h,0,0
		xor eax,eax
                jmp finFrameWndProc
        idmFrameArrange:
                ;WM_MDIICONARRANGE = 0x0228
                invoke SendMessageA, hwndClient,228h,0,0
		xor eax,eax
                jmp finFrameWndProc
	idmFrameCloseAll:
		invoke EnumChildWindows, hwndClient,offset CloseEnumProc,0
		xor eax,eax
		jmp finFrameWndProc
        idmFrameAbout:
		;MB_OK + MB_ICONINFORMATION = 40h
                invoke MessageBoxA, hWnd,addr szAbout,addr szFrameTitle,40h
		xor eax,eax
                jmp finFrameWndProc
        defFrameCmd:
                ;Pass to active child...
                        ;WM_MDIGETACTIVE = 0x0229
                        invoke SendMessageA, hwndClient,229h,0,0
                        mov hWndChild,eax
                        invoke IsWindow, hwndChild
                        	cmp eax,0
				jne defFrameWndProc
                        ;WM_COMMAND = 0x0111
                        invoke SendMessageA, hwndChild,111h,0,0
                ;...and then to DefFrameProc
                        jmp defFrameWndProc
;wmEndSession:

wmFrameClose:
	;WM_COMMAND = 0x0111
	invoke SendMessage, hWnd,111h,IDM_CLOSEALL,0
	;GW_CHILD = 5
	invoke GetWindow, hwndClient,5
		cmp eax,0
		je defFrameWndProc
        jmp finFrameWndProc
wmFrameDestroy:
        invoke PostQuitMessage, 0
        xor eax,eax
        jmp finFrameWndProc
defFrameWndProc:
        invoke DefFrameProcA, hWnd,hwndClient,uMsg,wParam,lParam
finFrameWndProc:
        ret 10h
FrameWndProc endp

;============================================================
CloseEnumProc proc uses ebx esi edi, hWnd:DWORD, lParam:DWORD
;============================================================
	;GW_OWNER = 4
	invoke GetWindow, hWnd,4
		cmp rax,0
		jne finCloseEnumProc ;return 1;

	invoke GetParent,hWnd
	;WM_MDIRESTORE = 0x0223
	invoke SendMessage,eax,223h,hWnd,0
	;WM_QUERYENDSESSION = 0x0011
	invoke SendMessage, hWnd,11h,0,0
		cmp rax,0
		jne finCloseEnumProc ;return 1;

	invoke GetParent,hWnd
	;WM_MDIDESTROY = 0x0221
	invoke SendMessage, eax,221h,hWnd,0

finCloseEnumProc:
	mov eax,1
	ret 8
CloseEnumProc endp

;=================================================================================
HelloWndProc proc uses ebx esi edi hWnd:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
;=================================================================================
LOCAL hwndClient:DWORD
LOCAL hwndFrame:DWORD
LOCAL hdc:DWORD
LOCAL hMenu:DWORD
LOCAL lpHelloData:DWORD
LOCAL ps:PAINTSTRUCT
LOCAL rect:RECT
;switch(iMsg)
	cmp edx,1 ;WM_CREATE = 0x0001
		je wmHelloCreate
	cmp edx,111h ;WM_COMMAND = 0x0111
		je wmHelloCommand
	cmp edx,0Fh ;WM_PAINT = 0x000F
		je wmHelloPaint
	cmp edx,222h ;WM_MDIACTIVATE = 0x0222
		je wmHelloActivate
	cmp edx,11h ;WM_QUERYENDSESSION = 0x0011
		;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
		je wmHelloEndSession
	cmp edx,10h ;WM_CLOSE = 0x0010
		je wmHelloClose
	cmp edx,2 ;WM_DESTROY = 0x0002
		je wmHelloDestroy
	jmp defHelloWndProc

wmHelloCreate:
	nop
        jmp finChildWndProc

wmHelloActivate:
        mov ecx, hWnd
        mov eax, lParam
        cmp eax,ecx
                jne notChild
        ;Child:
                ;WM_MDISETMENU = 0x0230
                invoke SendMessageA, hwndClient,230h,hChildMenu,hChildSubMenu
                invoke DrawMenuBar, hWndFrame
                jmp finChildWndProc
        notChild:
                ;WM_MDISETMENU = 0x0230
                invoke SendMessageA, hwndClient,230h,hMainMenu,hMainSubMenu
                invoke DrawMenuBar, hwndFrame
                jmp finChildWndProc

wmHelloLButtonUp:
        ;MB_OK + MB_ICONINFORMATION = 40h
        invoke MessageBoxA, hWnd,addr szHello,addr szFrameTitle, 40h
        jmp finChildWndProc

wmHelloClose:
	;MB_YESNO = 0x00000004L
        invoke MessageBoxA, hWnd,addr szClose,addr szFrameTitle, 4
        cmp eax,6 ;IDYES = 6
                jne finChildWndProc
        ;WM_MDIDESTROY = 0x0221
        invoke SendMessageA, hwndClient,221h,hWnd,0
        jmp finChildWndProc

defHelloWndProc:
        invoke DefMDIChildProcA, hWnd,uMsg,wParam,lParam
finHelloWndProc:
        ret
HelloWndProc endp

;=================
GetRandomProc proc
;=================
	invoke CryptAcquireContext, addr nRand,0,0,1,0 ;PROV_RSA_FULL = 1
	invoke CryptGenRandom, nRand,4,addr nRandBuf
	invoke CryptReleaseContext, nRand,0
        ret
GetRandomProc endp
end