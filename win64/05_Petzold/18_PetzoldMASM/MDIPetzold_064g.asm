option casemap:none
;option prologue:none
;option epilogue:none

;Standard Includes and Libraries
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	include D:\bin\dev\ml64\include\gdi32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;x64 Include by hutch--
	;include D:\bin\dev\ml64\hutch--\SDK\buildx64\include64\win64.inc
;Custom includes
	include include\struct64_20.inc
	include include\Mem_03.inc
	include include\Call_02.inc
	include include\Spell_09.inc

FrameWndProc PROTO :QWORD,:QWORD,:QWORD,:QWORD
CloseEnumProc PROTO :QWORD,:QWORD
HelloWndProc PROTO :QWORD,:QWORD,:QWORD,:QWORD
RectWndProc PROTO :QWORD,:QWORD,:QWORD,:QWORD

.const
;MDIDEMO.H header file
;(c) Charles Petzold,1996
	INIT_MENU_POS equ 0 ;Position of SubMenu in MenuInit = 0
	HELLO_MENU_POS equ 2 ;Position of SubMenu in MenuHello = 2
	RECT_MENU_POS equ 1 ;Position of SubMenu in MenuRect = 1
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
;Global variables
	szFrameClass db "MdiFrame",0
	szHelloClass db "MdiHelloChild",0
	szRectClass db "MdiRectChild",0
	szClientClass db "MDICLIENT",0 ;Pre-Defined by System
;Window Captions
	szFrameTitle db "MDI Demonstration",0
	szHelloTitle db "Hello",0
	szRectTitle db "Rectangles",0
;Normal Info Messages
	szHello db 'Hello,World!',0
	szAbout db 'Ч. Петзолд. Программирование для Windows® 95',0Ah,0Dh,'Глава 18 Многооконный интерфейс',0
;Prompt Messages
	szClose db "Close this Child Window?",0
	szExit db "Close this Application?",0
;Debug Messages
        szStackPointer db "rsp: 0000.0000.0000.0000h",0
	szLastErr db "Last Error Code: 0000.0000.0000.0000h",0
;Error Messages
	szErrFrameHandle db "Failed to get the Frame Window Handle",0
	szErrChildHandle db "Failed to get the Child Window Handle",0
	szHeapAlloc db "Failed to allocate memory in Heap",0
	szHeapFree db "Failed to free memory from Heap",0

.data?
;HINSTANCE hInst;
	hInst dq ?
;HMENU hMenuInit,hMenuHello,hMenuRect;
	hMenuInit dq ?
	hMenuHello dq ?
  	hMenuRect dq ?
;HMENU hMenuInitWindow,hMenuHelloWindow,hMenuRectWindow;
  	hMenuInitWindow dq ?
	hMenuHelloWindow dq ?
 	hMenuRectWindow dq ?
;Added during translation into MASM
;Window Handles
	hwndFrame dq ?
	hwndClient dq ?
	hwndChild dq ?
;Menu Handles
	hMenu dq ?
	hAccel dq ?
;Device Context and Drawing Handles
	hdc dq ?
	hBrush dq ?
;Rect Coordinates
	xLeft dd ?
	xRight dd ?
	yTop dd ?
	yBottom dd ?

;Structures declared in win64.inc
	wndclass WNDCLASSEX64 <?>
	msg MSG64 <?>
	clientcreate CLIENTCREATESTRUCT64 <?>
	mdicreate MDICREATESTRUCT64 <?>
	rect RECT64 <?>
	ps PAINTSTRUCT64 <?>

;Structure for storing data unique to each Hello child window
HELLODATA STRUCT
	iColor dd ? ;Two DWORDS are QWORD
	clrText dd ? ;QWORD is easier for x64
HELLODATA ENDS
HelloData HELLODATA <?>
lpHelloData dq ?
;Structure for storing data unique to each Rect child window
RECTDATA STRUCT
	cxClient dd ? ;Two DWORDS are QWORD
	cyClient dd ? ;QWORD is easier for x64
RECTDATA ENDS
RectData RECTDATA <?>
lpRectData dq ?

.code
start proc
;Be sure stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 20h Bytes as Buffer for 4 Parameters
	add rax,20h
	sub rsp,rax
;Get Application Handle
	Call1 GetModuleHandleA,0
	mov hInst,rax

	Call4 WinMain,rax,0,0,1

	call ExitProcess
start endp

;=================================================================================
WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD
;=================================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Ensure Stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
;Store Parameters
	mov hInstance,rcx
        mov hPrevInstance,rdx
        mov szCmdLine,r8
	mov iCmdShow,r9

;Register the frame window class
	mov wndclass.cbSize,50h ;sizeof(wndclass);
	mov wndclass.style,3 ;CS_HREDRAW | CS_VREDRAW;
	m64addr wndclass.lpfnWndProc,FrameWndProc
	mov wndclass.cbClsExtra,0
	mov wndclass.cbWndExtra,0
	m64m64 wndclass.hInstance,hInstance
	Call2 LoadIcon,0,7F00h ;IDI_APPLICATION
	mov wndclass.hIcon,rax
	mov wndclass.hIconSm,rax
	Call2 LoadCursorA,0,7F00h ;IDC_ARROW
	mov wndclass.hCursor,rax
	mov wndclass.hbrBackground,0Dh ;COLOR_APPWORKSPACE + 1
	mov wndclass.lpszMenuName,0
	m64addr wndclass.lpszClassName,szFrameClass;
	Call1 RegisterClassExA,offset wndclass
;Register the Hello child window class
	m64addr wndclass.lpfnWndProc,HelloWndProc
	mov wndclass.cbWndExtra,8 ;sizeof.HANDLE
	Call1 GetStockObject,0 ;WHITE_BRUSH
	mov wndclass.hbrBackground,rax
	m64addr wndclass.lpszClassName,szHelloClass
	Call1 RegisterClassExA,offset wndclass
;Register the Rect child window class
	m64addr wndclass.lpfnWndProc,RectWndProc
	m64addr wndclass.lpszClassName,szRectClass
	Call1 RegisterClassExA,offset wndclass

;Obtain handles to three possible menus & submenus
        Call2 LoadMenuA,hInst,MdiMenuInit
        mov hMenuInit,rax
        Call2 LoadMenuA,hInst,MdiMenuHello
        mov hMenuHello,rax
        Call2 LoadMenuA,hInst,MdiMenuRect
        mov hMenuRect,rax
        Call2 GetSubMenu,hMenuInit,INIT_MENU_POS ;Position of SubMenu in MenuInit = 0
        mov hMenuInitWindow,rax
        Call2 GetSubMenu,hMenuHello,HELLO_MENU_POS ;Position of SubMenu in MenuHello = 2
        mov hMenuHelloWindow,rax
        Call2 GetSubMenu,hMenuRect,RECT_MENU_POS ;Position of SubMenu in MenuRect = 1
        mov hMenuRectWindow,rax
;Load accelerator table
        Call2 LoadAccelerators,hInst,MdiAccel
        mov hAccel,rax

;Create the frame window
	xor rcx,rcx ;dwExStyle
	lea rdx,szFrameClass ;lpClassName
	lea r8,szFrameTitle ;lpWindowName
	mov r9,2CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN
	mov rax,80000000h ;CW_USEDEFAULT
	mov qword ptr [rsp+20h],rax ;x
	mov qword ptr [rsp+28h],rax ;y
	mov qword ptr [rsp+30h],rax ;nWidth
	mov qword ptr [rsp+38h],rax ;nHeight
	mov qword ptr [rsp+40h],0 ;hWndParent
	m64m64 qword ptr [rsp+48h],hMenuInit ;hMenu
	m64m64 qword ptr [rsp+50h],hInstance
	mov qword ptr [rsp+58h],0 ;lpParam
	call CreateWindowExA
	mov hwndFrame,rax
cmp rax,0
je errFrameHandle

;Get Client Window Handle
	;Call2 GetWindow,hwndFrame,5 ;GW_CHILD = 5
	;mov hwndClient,rax
;Show and Update the Frame Window
	Call2 ShowWindow,hwndFrame,1 ;nCmdShow = SW_SHOWNORMAL = 1
	;mov rcx,hWndFrame
	call UpdateWindow

;Enter the modified message loop
MsgLoop:
	;while(GetMessage(&msg,NULL,0,0))
		Call4 GetMessageA,offset msg,0,0,0
		cmp rax,0
		je CleanUp
	;if(!TranslateMDISysAccel(hwndClient,&msg) &&
	        Call2 TranslateMDISysAccel,hwndClient,offset msg
	        cmp rax,0
		jne MsgLoop
	;!TranslateAccelerator(hwndFrame,hAccel,&msg))
		Call3 TranslateAccelerator,hwndFrame,hAccel,offset msg
		cmp rax,0
		jne MsgLoop
	;TranslateMessage(&msg);
		Call1 TranslateMessage,offset msg
	;DispatchMessage(&msg);
		Call1 DispatchMessageA,offset msg
jmp MsgLoop

;Error Alarms
errFrameHandle:
        lea rdx, szErrFrameHandle ;lpText
	;jmp errWinMain
errWinMain:
	xor rcx,rcx ;hWnd
	;lpText is already in rdx
	lea r8,szFrameTitle ;lpCaption
	mov r9,10h ;uType = MB_OK + MB_ICONERROR = 0 + 10h = 10h
	call MessageBoxA
	call GetLastError
	Spell64rax 0, szFrameTitle, szLastErr

CleanUp: ;Clean up by deleting unattached menus
	Call1 DestroyMenu,hMenuHello
	Call1 DestroyMenu,hMenuRect
EndAll: ;return msg.wParam;
;Assembler will add this epilogue automatically:
	;leave
;return msg.wParam;
	mov rcx,msg.wParam
	ret
WinMain endp

;===================================================================
FrameWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD
;===================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Be sure stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store Values retrieved by DispatchMessageA
	mov hwnd,rcx
	mov iMsg,rdx
	mov wParam,r8
	mov lParam,r9

;switch(iMsg)
    cmp rdx,1 ;WM_CREATE = 0x0001
        je wmFrameCreate
    cmp rdx,111h ;WM_COMMAND = 0x0111
        je wmFrameCommand
    cmp rdx,11h ;WM_QUERYENDSESSION = 0x0011
	;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
        je wmFrameEndSession
    cmp rdx,10h ;WM_CLOSE = 0x0010
        je wmFrameClose
    cmp rdx,2 ;WM_DESTROY = 0x0002
        je wmFrameDestroy
    jmp defFrameWndProc

wmFrameCreate: ;Create the client window
	m64m64 clientcreate.hWindowMenu,hMenuInitWindow
	mov clientcreate.idFirstChild,IDM_FIRSTCHILD
	;Create ClientWindow. Why now?
		xor rcx,rcx
		lea rdx,szClientClass
		xor r8,r8
		mov r9,52000000h ;WS_CHILD or WS_CLIPCHILDREN or WS_VISIBLE
		mov qword ptr [rsp+20h],0 ;x
		mov qword ptr [rsp+28h],0 ;y
		mov qword ptr [rsp+30h],0 ;nWidth
		mov qword ptr [rsp+38h],0 ;nHeight
		m64m64 qword ptr [rsp+40h],hwnd ;hWndParent
		mov qword ptr [rsp+48h],1 ;hMenu = 1. Why?!
		m64m64 qword ptr [rsp+50h],hInst ;hInstance
		m64addr qword ptr [rsp+58h],clientcreate ;lpParam
		call CreateWindowExA
		mov hwndClient,rax
		cmp rax,0
		je errChildHandle
	jmp finFrameWndProc ;return 0;

wmFrameCommand:
	cmp r8,IDM_NEWHELLO
		je idmFrameNewHello
	cmp r8,IDM_NEWRECT
		je idmFrameNewRect
	cmp r8,IDM_CLOSE
		je idmFrameClose
	cmp r8,IDM_EXIT
		je idmFrameExit
	cmp r8,IDM_TILE
		je idmFrameTile
	cmp r8,IDM_CASCADE
		je idmFrameCascade
	cmp r8,IDM_ARRANGE
		je idmFrameArrange
	cmp r8,IDM_CLOSEALL
		je idmFrameCloseAll
	cmp r8,IDM_ABOUT
		je idmFrameAbout
	jmp defFrameCmd

	idmFrameNewHello: ;Create a Hello Child Window
		;Initialize the MDICREATESTRUCT
			m64addr mdicreate.szClass,szHelloClass
			m64addr mdicreate.szTitle,szHelloTitle
			m64m64 mdicreate.hOwner,hInst
			mov rax,80000000h
			mov mdicreate.x,eax
			mov mdicreate.y,eax
			mov mdicreate.lx,eax
			mov mdicreate.ly,eax
			mov mdicreate.style,0
			mov mdicreate.lParam,0
		;WM_MDICREATE = 0x0220
			Call4 SendMessageA,hwndClient,220h,0,offset mdicreate
                	mov hwndChild,rax
                jmp finFrameWndProc ;return 0;
	idmFrameNewRect: ;Create a Rect Child Window
		;Initialize the MDICREATESTRUCT
			m64addr mdicreate.szClass,szRectClass
			m64addr mdicreate.szTitle,szRectTitle
			m64m64 mdicreate.hOwner,hInst
			mov rax,80000000h
			mov mdicreate.x,eax
			mov mdicreate.y,eax
			mov mdicreate.lx,eax
			mov mdicreate.ly,eax
			mov mdicreate.style,0
			mov mdicreate.lParam,0
		;WM_MDICREATE = 0x0220
			Call4 SendMessageA,hwndClient,220h,0,offset mdicreate
			mov hwndChild,rax
		jmp finFrameWndProc ;return 0;
	idmFrameClose: ;Close the active window
		;WM_MDIGETACTIVE = 0x0229
			Call4 SendMessageA,hwndClient,229h,0,0
			mov hwndChild,rax
		;WM_QUERYENDSESSION = 0x0011
			;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
			Call4 SendMessageA,hwndChild,11h,0,0
			cmp rax,0
			je finFrameWndProc
                ;WM_MDIDESTROY = 0x0221
                	Call4 SendMessageA,hwndClient,221h,hwndChild,0
                jmp finFrameWndProc ;return 0;
	idmFrameExit: ;Exit the program
		;WM_CLOSE = 0x0010
			Call4 SendMessageA,hwnd,10h,0,0
		jmp finFrameWndProc ;return 0;
	;Messages for arranging windows
	idmFrameTile: ;WM_MDITILE = 0x0226
			Call4 SendMessageA,hwndClient,226h,0,0
		jmp finFrameWndProc ;return 0;
	idmFrameCascade: ;WM_MDICASCADE = 0x227
			Call4 SendMessageA,hwndClient,227h,0,0
		jmp finFrameWndProc ;return 0;
	idmFrameArrange: ;WM_MDIICONARRANGE = 0x228
			Call4 SendMessageA,hwndClient,228h,0,0
		jmp finFrameWndProc ;return 0;
	idmFrameCloseAll: ;Attempt to close all children
			Call3 EnumChildWindows,hwndClient,offset CloseEnumProc,0
		jmp finFrameWndProc ;return 0;
	idmFrameAbout:
		;MB_OK + MB_ICONINFORMATION = 40h
			Call4 MessageBoxA,hwnd,offset szAbout,offset szFrameTitle,40h
		jmp finFrameWndProc
	defFrameCmd: ;Pass to active child...
		;WM_MDIGETACTIVE = 0x0229
			Call4 SendMessageA,hwndClient,229h,0,0
			mov hwndChild,rax
		Call1 IsWindow,hwndChild
			cmp rax,0
			je defFrameWndProc
		;WM_COMMAND = 0x0111
			Call4 SendMessageA,hwndChild,111h,wParam,lParam
		jmp defFrameWndProc ;break; // ...and then to DefFrameProc

wmFrameEndSession:
	;jmp wmFrameClose

wmFrameClose: ;Attempt to close all children
	;WM_COMMAND = 0x0111
	Call4 SendMessage,hwnd,111h,IDM_CLOSEALL,0
	Call2 GetWindow,hwndClient,5 ;GW_CHILD
	cmp rax,0
	jne finFrameWndProc ;return 0;
	jmp defFrameWndProc ;break; // I.e.,call DefFrameProc

wmFrameDestroy:
	Call1 PostQuitMessage,0
	jmp finFrameWndProc ;return 0;

defFrameWndProc: ;Pass unprocessed messages to DefFrameProc(not DefWindowProc)
	Call5 DefFrameProc,hwnd,hwndClient,iMsg,wParam,lParam
	;Assembler will add this epilogue automatically:
		;leave 
	ret ;Don't scramble rax

;Error Alarms
errChildHandle:
        lea rdx, szErrChildHandle ;lpText
        ;jmp errFrameWndProc
errFrameWndProc:
	xor rcx,rcx ;hWnd
	;lpText is already in rdx
	lea r8,szFrameTitle ;lpCaption
	mov r9,10h ;uType = MB_OK + MB_ICONERROR = 0 + 10h = 10h
	call MessageBoxA
	call GetLastError
	Spell64rax 0, szFrameTitle, szLastErr

finFrameWndProc:
	xor rax,rax ;return 0;
	;Assembler will add this epilogue automatically:
	;leave 
	ret
FrameWndProc endp

;==========================================
CloseEnumProc proc hwnd:QWORD,lParam:QWORD
;==========================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Be sure stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 20h Bytes as Buffer for 4 Parameters
	add rax,20h
	sub rsp,rax
;Store Values
	;mov rcx,hwndChild ;Closes all Child Windows
	mov hwnd,rcx

;Check for icon title
	Call2 GetWindow,hwnd,4 ;GW_OWNER
	cmp rax,0
	jne finCloseEnumProc ;return 1;
;WM_MDIRESTORE =0x0223
	Call1 GetParent,hwnd
	Call4 SendMessageA,rax,223h,hwnd,0
;WM_QUERYENDSESSION = 0x0011
	;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window
	Call4 SendMessageA,hwnd,11h,0,0
	cmp rax,0
	je finCloseEnumProc ;return 1;
;WM_MDIDESTROY = 0x0221
	Call1 GetParent,hwnd
	Call4 SendMessageA,rax,221h,hwnd,0

finCloseEnumProc:
	mov rax,1 ;return 1;
	;Assembler will add this epilogue automatically:
	;leave 
	ret
CloseEnumProc endp

;===================================================================
HelloWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD
;===================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Be sure stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
;Store Values retrieved by DispatchMessageA:
	mov hwnd,rcx
	mov iMsg,rdx
	mov wParam,r8
	mov lParam,r9

;switch(iMsg)
	cmp rdx,1 ;WM_CREATE = 0x0001
		je wmHelloCreate
	cmp rdx,111h ;WM_COMMAND = 0x0111
		je wmHelloCommand
	cmp rdx,0Fh ;WM_PAINT = 0x000F
		je wmHelloPaint
	cmp rdx,222h ;WM_MDIACTIVATE = 0x0222
		je wmHelloActivate
	cmp rdx,11h ;WM_QUERYENDSESSION = 0x0011
		;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
		je wmHelloEndSession
	cmp rdx,10h ;WM_CLOSE = 0x0010
		je wmHelloClose
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmHelloDestroy
	jmp defHelloWndProc

wmHelloCreate: ;Allocate memory for window private data
	call GetProcessHeap
	Call3 HeapAlloc,rax,8,8
	mov lpHelloData,rax
	mov HelloData.iColor,IDM_BLACK;
	mov HelloData.clrText,0 ;Black by default
	Call3 SetWindowLong,hwnd,0,lpHelloData
	;Save some window handles
	Call1 GetParent,hwnd
	mov hwndClient,rax
	Call1 GetParent,hwndClient
	mov hwndFrame,rax
	jmp finHelloWndProc ;return 0;

wmHelloCommand:
	;switch(wParam)
		cmp r8,IDM_BLACK
			je idmHelloBlack
		cmp r8,IDM_RED
			je idmHelloRed
		cmp r8,IDM_GREEN
			je idmHelloGreen
		cmp r8,IDM_BLUE
			je idmHelloBlue
		cmp r8,IDM_WHITE
			je idmHelloWhite
		jmp defHelloCmd

	;Change the text color
	idmHelloBlack: ;0
		Call2 GetWindowLongA,hwnd,0
		mov lpHelloData,rax
		Call1 GetMenu,hwndFrame
		mov hMenu,rax
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,0 ;MF_UNCHECKED
		mov HelloData.iColor,IDM_BLACK
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,8 ;MF_CHECKED
		mov HelloData.clrText,0 ;Black
		Call3 InvalidateRect,hwnd,0,0
		jmp finHelloWndProc
	idmHelloRed: ;0FFh
		Call2 GetWindowLongA,hwnd,0
		mov lpHelloData,rax
		Call1 GetMenu,hwndFrame
		mov hMenu,rax
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,0 ;MF_UNCHECKED
		mov HelloData.iColor,IDM_RED
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,8 ;MF_CHECKED
		mov HelloData.clrText,0FFh ;Red
		Call3 InvalidateRect,hwnd,0,0
		jmp finHelloWndProc
	idmHelloGreen: ;0FF00h
		Call2 GetWindowLongA,hwnd,0
		mov lpHelloData,rax
		Call1 GetMenu,hwndFrame
		mov hMenu,rax
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,0 ;MF_UNCHECKED
		mov HelloData.iColor,IDM_GREEN
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,8 ;MF_CHECKED
		mov HelloData.clrText,0FF00h ;Green
		Call3 InvalidateRect,hwnd,0,0
		jmp finHelloWndProc
	idmHelloBlue: ;0FF0000h
		Call2 GetWindowLongA,hwnd,0
		mov lpHelloData,rax
		Call1 GetMenu,hwndFrame
		mov hMenu,rax
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,0 ;MF_UNCHECKED
		mov HelloData.iColor,IDM_BLUE
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,8 ;MF_CHECKED
		mov HelloData.clrText,0FF0000h ;Blue
		Call3 InvalidateRect,hwnd,0,0
		jmp finHelloWndProc
	idmHelloWhite: ;0C0C0C0h
		Call2 GetWindowLongA,hwnd,0
		mov lpHelloData,rax
		Call1 GetMenu,hwndFrame
		mov hMenu,rax
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,0 ;MF_UNCHECKED
		mov HelloData.iColor,IDM_WHITE
		Call3 CheckMenuItem,hMenu,qword ptr HelloData.iColor,8 ;MF_CHECKED
		mov HelloData.clrText,0C0C0C0h ;Almost White
		Call3 InvalidateRect,hwnd,0,0
		jmp finHelloWndProc
	defHelloCmd:
		nop 
		jmp defHelloWndProc

wmHelloPaint: ;Paint the window
	Call2 BeginPaint,hwnd,offset ps
	mov hdc,rax
	Call2 GetWindowLong,hwnd,0
	mov lpHelloData,rax
	Call2 SetTextColor,hdc,qword ptr HelloData.clrText
	Call2 GetClientRect,hwnd,offset rect
	;DT_SINGLELINE + DT_CENTER + DT_VCENTER = 25h
	Call5 DrawText,hdc,offset szHello,-1,offset rect,25h
	Call2 EndPaint,hwnd,offset ps
	jmp finHelloWndProc ;return 0;

wmHelloActivate: ;Set the Hello menu if gaining focus
	cmp r9,rcx
		jne notHello
	;Hello:
		;WM_MDISETMENU = 0x0230
		Call4 SendMessageA,hwndClient,230h,hMenuHello,hMenuHelloWindow
		Call2 GetWindowLongA,hwnd,0
		mov lpHelloData,rax
		Call3 CheckMenuItem,hMenuHello,qword ptr HelloData.iColor,8 ;MF_CHECKED
		Call1 DrawMenuBar,hwndFrame
		jmp finHelloWndProc
	notHello:
		Call2 GetWindowLongA,hwnd,0
		mov lpHelloData,rax
		Call3 CheckMenuItem,hMenuHello,qword ptr HelloData.iColor,0 ;MF_UNCHECKED
		;WM_MDISETMENU = 0x0230
		Call4 SendMessageA,hwndClient,230h,hMenuInit,hMenuInitWindow
		Call1 DrawMenuBar,hwndFrame
		jmp finHelloWndProc

wmHelloEndSession:
	;jmp wmHelloClose

wmHelloClose:
	;MB_ICONQUESTION or MB_OKCANCEL = 21h
	Call4 MessageBoxA,hwnd,offset szClose,offset szHelloTitle,21h 
	cmp rax,1 ;IDOK
		jne finHelloWndProc ;return 0;
	jmp defHelloWndProc ;I.e.,call DefMDIChildProc

wmHelloDestroy:
	Call2 GetWindowLong,hwnd,0
	mov lpHelloData,rax
	call GetProcessHeap
	;Call3 HeapFree,rax,0,lpHelloData ;<--- 
	;Crashes here though HeapFree retrieves non-zero value
	jmp finHelloWndProc ;return 0;

defHelloWndProc: ;Pass unprocessed message to DefMDIChildProc
	Call4 DefMDIChildProc,hwnd,iMsg,wParam,lParam
	;Assembler will add this epilogue automatically:
	;leave 
	ret ;Don't scramble rax

finHelloWndProc:
	xor rax,rax ;return 0;
	;Assembler will add this epilogue automatically:
	;leave
	ret
HelloWndProc endp

;==================================================================
RectWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD
;==================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Be sure stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
;Store Values retrieved by DispatchMessageA:
	mov hwnd,rcx
	mov iMsg,rdx
	mov wParam,r8
	mov lParam,r9

;switch(iMsg)
	cmp rdx,1 ;WM_CREATE = 0x0001
		je wmRectCreate
	cmp rdx,5 ;WM_SIZE = 0x0005
		je wmRectSize
	cmp rdx,113h ;WM_TIMER = 0x0113
		je wmRectTimer
	cmp rdx,0Fh ;WM_PAINT = 0x000F
		je wmRectPaint
	cmp rdx,222h ;WM_MDIACTIVATE = 0x0222
		je wmRectActivate
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmRectDestroy
	jmp defRectWndProc

wmRectCreate: ;Allocate memory for window private data
	call GetProcessHeap
	Call3 HeapAlloc,rax,8,8
	mov lpRectData,rax
	Call3 SetWindowLong,hwnd,0,lpRectData
	Call4 SetTimer,hwnd,1,0FFh,0 ;Start the timer going
	;Save some window handles
	Call1 GetParent,hwnd
	mov hwndClient,rax
	Call1 GetParent,hwndClient
	mov hwndFrame,rax
	jmp finRectWndProc ;return 0;

wmRectSize: ;If not minimized,save the window size
	cmp r8,1 ;SIZE_MINIMIZED
		je defRectWndProc
	Call2 GetWindowLong,hwnd,0
	mov lpRectData,rax
	mov rax,lParam
	mov RectData.cxClient,eax
	mov rax,lParam
	shr rax,32
	mov RectData.cyClient,eax
	jmp defRectWndProc ;WM_SIZE must be processed by DefMDIChildProc

wmRectTimer: ;Display a 'random' rectangle
	Call2 GetWindowLong,hwnd,0
	mov lpRectData,rax
	;xLeft = rand() % lpRectData->cxClient;
		mov eax,xLeft
		inc eax
		mov xLeft,eax
	;xRight = rand() % lpRectData->cxClient;
		mov eax,xLeft
		add eax,50
		mov xRight,eax
	;yTop = rand() % lpRectData->cyClient;
		mov eax,yBottom
		inc eax
		mov yBottom,eax
	;yBottom = rand() % lpRectData->cyClient;
		mov eax,yBottom
		add eax,50
		mov yTop,eax
	;nRed = rand() & 255;
		;mov nRed,255
	;nGreen = rand() & 255;
		;mov nGreen,255
	;nBlue = rand() & 255;
		;mov nBlue,225
	Call1 GetDC,hwnd
	mov hdc,rax
	Call1 CreateSolidBrush,0E0FFFFh ;RGB(255,255,225)
	mov hBrush,rax
	Call2 SelectObject,hdc,hBrush
	Call5 Rectangle,hdc,qword ptr xLeft,qword ptr yBottom,qword ptr xRight,qword ptr yTop
	Call2 ReleaseDC,hwnd,hdc
	Call1 DeleteObject,hBrush
	jmp finRectWndProc ;return 0;

wmRectPaint: ;Clear the window
	Call3 InvalidateRect,hwnd,0,1
	Call2 BeginPaint,hwnd,offset ps
	mov hdc,rax
	Call2 EndPaint,hwnd,offset ps
	jmp finRectWndProc ;return 0;

wmRectActivate: ;Set the appropriate menu
	cmp r9,rcx
		jne notRect
	;Rect:
		;WM_MDISETMENU = 0x0230
		Call4 SendMessageA,hwndClient,230h,hMenuRect,hMenuRectWindow
		Call1 DrawMenuBar,hwndFrame
		jmp finRectWndProc ;return 0;
	notRect:
		;WM_MDISETMENU = 0x0230
		Call4 SendMessageA,hwndClient,230h,hMenuInit,hMenuInitWindow
		Call1 DrawMenuBar,hwndFrame
		jmp finRectWndProc ;return 0;

wmRectDestroy:
	Call2 GetWindowLong,hwnd,0
	mov lpRectData,rax
	call GetProcessHeap
	;Call3 HeapFree,rax,0,lpRectData ;<--- 
	;Crashes here though HeapFree retrieves non-zero value
	Call2 KillTimer,hwnd,1
	jmp finRectWndProc ;return 0;

defRectWndProc: ;Pass unprocessed message to DefMDIChildProc
	Call4 DefMDIChildProc,hwnd,iMsg,wParam,lParam
	;Assembler will add this epilogue automatically:
	;leave
	ret
 finRectWndProc:
	xor rax,rax ;return 0;
	;Assembler will add this epilogue automatically:
	;leave 
	ret  
RectWndProc endp
end
