option casemap:none

;Standard Includes and Libraries
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	include D:\bin\dev\ml64\include\gdi32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;Custom includes
	include include\struct64_20.inc
	include include\Mem_03.inc
	include include\Call_02.inc
	include include\Spell_09.inc

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
        szFrameTitle db "Win64 MDI Demo",0
        szChildTitle db "MDI Child",0
;Info Messages
	szHello db 'Hello, World!',0
	szAbout db 'Inspired by Charles Petzold, Iczelion, and Mikl___',0
;Prompt Messages
        szClose db "Close this Child Window?",0
        szExit db "Close this Application?",0
;Debug Messages
        szAppHandle db "Application Handle: 0000.0000.0000.0000h",0
        szFrameHandle db "Frame Window Handle: 0000.0000.0000.0000h",0
	szLastErr db "Last Error Code: 0000.0000.0000.0000h",0
;Error Messages
        szErrMenu db "Failed to load Menu",0
        szErrWinMain db "Error in WinMain",0

.data?
;Window Handles
        hInstance dq ?
        hWndFrame dq ?
        hWndClient dq ?
        hWndChild dq ?
;Menu Handles
        hMainMenu dq ?
        hMainSubMenu dq ?
        hChildMenu dq ?
        hChildSubMenu dq ?
;Structures
        wc WNDCLASSEX64 <>
        msg MSG64 <>
        MDICreate MDICREATESTRUCT64 <>
        ClientStruct CLIENTCREATESTRUCT64 <>

.code
;===========
WinMain proc
;===========
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Stack Usage: 8(return address)+0(parameters)+8(push)+0(locals) = 48h
;Align Stack by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

        Call1 GetModuleHandleA, 0
        mov hInstance,rax
Spell64rax 0, szFrameTitle, szAppHandle

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
        ;WndClass.cbSize = sizeof(WndClass);
                mov wc.cbSize,50h ;dword ptr sizeof WNDCLASSEX64
        ;WndClass.style = CS_HREDRAW | CS_VREDRAW;
                mov wc.style, 3 ;CS_HREDRAW + CS_VREDRAW = 2 + 1 = 3
        ;WndClass.lpfnWndProc = FrameWndProc;
                m64addr wc.lpfnWndProc,FrameWndProc
        ;WndClass.cbClsExtra = 0;
                mov wc.cbClsExtra,0
        ;WndClass.cbWndExtra = 0;
                mov wc.cbWndExtra,0
        ;WndClass.hInstance = hInstance;
                m64m64 wc.hInstance,hInstance
        ;WndClass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
                Call2 LoadIcon, 0, 7F00h
                mov wc.hIcon,rax
                mov wc.hIconSm,rax
        ;WndClass.hCursor = LoadCursor(NULL, IDC_ARROW);
                Call2 LoadCursorA, 0, 7F00h
                mov wc.hCursor,rax
        ;WndClass.hbrBackground =(HBRUSH)(COLOR_APPWORKSPACE + 1);
                mov wc.hbrBackground,0Dh
        ;WndClass.lpszMenuName = NULL;
                mov wc.lpszMenuName,0
        ;WndClass.lpszClassName = szFrameClass;
                m64addr wc.lpszClassName,szFrameClass
        ;WndClass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
                ;Already done
        ;invoke RegisterClassEx, WndClass
                Call1 RegisterClassExA, offset wc
cmp rax, 0
je errWinMain

;Register the Child Window Class
;There is no need to refill WNDCLASSEX again - just change some values
        ;WndClass.lpfnWndProc = ChildWndProc;
                m64addr wc.lpfnWndProc,ChildWndProc
        ;WndClass.cbWndExtra = sizeof(HANDLE);
                mov wc.cbWndExtra,8
        ;WndClass.hbrBackground =(HBRUSH) GetStockObject(WHITE_BRUSH);
                Call1 GetStockObject, 0
                mov wc.hbrBackground,rax
        ;WndClass.lpszClassName = szChildClass;
                m64addr wc.lpszClassName,szChildClass
        ;invoke RegisterClassEx, WndClass
                Call1 RegisterClassExA, offset wc
cmp rax, 0
je errWinMain

;Get Menu Handles
        Call2 LoadMenuA, hInstance, IDR_MAINMENU ;lpMenuName
        mov hMainMenu,rax
cmp rax, 0
je errMenu
        Call2 GetSubMenu, hMainMenu, 0 ;nPos = 0; 'File' Menu Position is 0
        mov hMainSubMenu,rax
cmp rax, 0
je errMenu
        Call2 LoadMenuA, hInstance, IDR_CHILDMENU
        mov hChildMenu,rax
cmp rax, 0
je errMenu
        Call2 GetSubMenu, hChildMenu, 1 ;nPos = 1; 'Window' Menu Position is 1
        mov hChildSubMenu,rax
cmp rax, 0
je errMenu

;Create the Frame Window
        xor rcx,rcx ;dwExStyle
        lea rdx,szFrameClass ;lpszFrameClass
        lea r8,szFrameTitle ;lpszFrameTitle
        mov r9,2CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW + WS_CLIPCHILDREN
        mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+28h],rax ;y = ÑW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+40h],0 ;hWndParent
        m64m64 qword ptr [rsp+48h],hMainMenu
        m64m64 qword ptr [rsp+50h],hInstance
        mov qword ptr [rsp+58h],0 ;lpParam 
        call CreateWindowExA
        mov hWndFrame,rax
Spell64rax 0, szFrameTitle, szFrameHandle

;Get Client Window Handle
        Call2 GetWindow, hWndFrame, 5 ;GW_CHILD = 5
        mov hWndClient,rax ;hWndClient

;Show and Update the Frame Window
        Call2 ShowWindow, hWndFrame, 1 ;nCmdShow = SW_SHOWNORMAL = 1
        Call1 UpdateWindow,hWndFrame

;Enter the Loop
MsgLoop: ;Critical time, don't use macros
        lea rcx,msg
	xor rdx,rdx
	xor r8,r8
	xor r9,r9
	call GetMessageA
        cmp rax,0
	je CleanUp
	mov rcx, hWndClient
	lea rdx,msg ;Re-Load is necessary
        call TranslateMDISysAccel
        cmp rax,0
	jne MsgLoop
	lea rcx,msg ;Re-Load is necessary
        call TranslateMessage
	lea rcx,msg ;Re-Load is necessary
        call DispatchMessageA
jmp MsgLoop

;Error Alarms
errMenu:
        lea rdx,szErrMenu ;lpText
        jmp errWinMainAlarm
errWinMain:
        lea rdx,szErrWinMain ;lpText
errWinMainAlarm:
	;MB_OK + MB_ICONERROR
        Call4 MessageBoxA, 0, rdx, offset szFrameTitle, 10h
        call GetLastError
        Spell64rax 0, szFrameTitle, szLastErr

CleanUp:
        Call1 DestroyMenu, hChildMenu
;There is no need to restore the Stack before exit
        Call1 ExitProcess, msg.wParam
WinMain endp

;===================================================================
FrameWndProc proc hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
;===================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Stack Usage: 8(return address)+20h(parameters)+8(push)+0(locals) = 30h
;Ensure Stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store Values retrieved by DispatchMessageA
        mov hWnd,rcx
        mov uMsg,rdx
        mov wParam,r8
        mov lParam,r9

;Window Messages processing
        cmp rdx,1 ;WM_CREATE = 0x0001
                je wmFrameCreate
        cmp rdx,111h ;WM_COMMAND = 0x0111
                je wmFrameCommand
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmFrameClose
        cmp rdx,2 ;WM_DESTROY = 0x0002
                je wmFrameDestroy
        jmp defFrameWndProc

wmFrameCreate:
        ;Initialize the CLIENTSTRUCT
		m64m64 ClientStruct.hWindowMenu,hMainSubMenu
		mov ClientStruct.idFirstChild,IDM_FIRSTCHILD
        ;INVOKE CreateWindowEx,NULL,ADDR szClientClass,NULL,\
        ;WS_CHILD or WS_VISIBLE or WS_CLIPCHILDREN,\
        ;CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,\
        ;hWnd,NULL,hInstance,addr ClientStruct
                xor rcx,rcx ;dwExStyle
                lea rdx,szClientClass ;lpszFrameClass
                xor r8,r8 ;lpszFrameTitle
                mov r9,52000000h ;dwStyle=WS_CHILD+WS_VISIBLE+WS_CLIPCHILDREN
                mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
                mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT
                mov qword ptr [rsp+28h],rax ;y = ÑW_USEDEFAULT
                mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT
                mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT
                m64m64 qword ptr [rsp+40h],hWnd ;hWndParent
                mov qword ptr [rsp+48h],0 ;hMenu
                m64m64 qword ptr [rsp+50h],hInstance
                m64addr qword ptr [rsp+58h],ClientStruct ;lpParam == lpClientStruct
                call CreateWindowExA
        mov hWndClient,rax
        jmp finFrameWndProc

wmFrameCommand:
        ;mov r9,lParam ;lParam is already in r9
        cmp r9,0
                jne finFrameWndProc
        ;Distributing with respect to wParam
	;mov r8,wParam ;wParam is already in r8
        cmp r8,IDM_NEW
                je idmFrameNew
        cmp r8,IDM_CLOSE
                je idmFrameClose
        cmp r8,IDM_EXIT
                je idmFrameExit
        cmp r8,IDM_TILEHORZ
                je idmFrameTileHorz
        cmp r8,IDM_TILEVERT
                je idmFrameTileVert
        cmp r8,IDM_CASCADE
                je idmFrameCascade
        cmp r8,IDM_ABOUT
                je idmFrameAbout
        jmp defFrameCmd

        idmFrameNew:
		;Initialize the MDICREATESTRUCT
                        m64addr MDICreate.szClass,szChildClass
                        m64addr MDICreate.szTitle,szChildTitle
                        m64m64 MDICreate.hOwner,hInstance
                        mov rax, 80000000h ;CW_USEDEFAULT
                        mov MDICreate.x, eax
                        mov MDICreate.y, eax
                        mov MDICreate.lx, eax
                        mov MDICreate.ly, eax
                        mov MDICreate.style, 0
                        mov MDICreate.lParam, 0
                ;WM_MDICREATE = 0x0220
                Call4 SendMessageA, hWndClient, 220h, 0, offset MDICreate
                mov hWndChild,rax
                jmp finFrameWndProc
        idmFrameClose:
                ;WM_MDIGETACTIVE = 0x0229
                Call4 SendMessageA, hWndClient, 229h, 0, 0
		mov hWndChild,rax
                ;WM_CLOSE = 0x0010
                Call4 SendMessageA, hWndChild, 10h, 0, 0
                jmp finFrameWndProc
        idmFrameExit:
                ;WM_CLOSE = 0x0010
                Call4 SendMessageA, hWnd, 10h, 0, 0
                jmp finFrameWndProc
        idmFrameTileHorz:
                ;WM_MDITILE = 0x0226 ;MDITILE_HORIZONTAL = 1
                Call4 SendMessageA, hWndClient, 226h, 1, 0
                jmp finFrameWndProc
        idmFrameTileVert:
                ;WM_MDITILE = 0x0226 ;MDITILE_VERTICAL = 0
                Call4 SendMessageA, hWndClient, 226h, 0, 0
                jmp finFrameWndProc
        idmFrameCascade:
                ;WM_MDICASCADE = 0x0227 ;MDITILE_SKIPDISABLED = 2
                Call4 SendMessageA, hWndClient, 227h, 2, 0
                jmp finFrameWndProc
        idmFrameAbout:
		;MB_OK + MB_ICONINFORMATION = 40h
                Call4 MessageBoxA, hWnd, offset szAbout, offset szFrameTitle, 40h
                jmp finFrameWndProc
        defFrameCmd:
                ;Pass to active child...
                        ;WM_MDIGETACTIVE = 0x0229
                        Call4 SendMessageA, hWndClient, 229h, 0, 0
                        mov hWndChild,rax
                        Call1 IsWindow, hWndChild
                        cmp rax,0
			jne defFrameWndProc
                        ;WM_COMMAND = 0x0111
                        Call4 SendMessageA, hWndChild, 111h, 0, 0
                ;...and then to DefFrameProc
                        jmp defFrameWndProc

wmFrameClose:
	;MB_YESNO = 0x00000004L
        Call4 MessageBoxA, hWnd, offset szExit, offset szFrameTitle, 4
        cmp rax,6 ;IDYES
                jne finFrameWndProc
	;WM_DESTROY ;0x0002
        Call4 SendMessageA, hWnd, 2, 0, 0
        jmp finFrameWndProc
wmFrameDestroy:
        Call1 PostQuitMessage, 0
        xor rax,rax
        jmp finFrameWndProc
defFrameWndProc:
        Call5 DefFrameProcA, hWnd, hWndClient, uMsg, wParam, lParam
finFrameWndProc:
;Assembler will add this epilogue automatically:
	;leave 
        ret
FrameWndProc endp

;================================================================
ChildWndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;================================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;Stack Usage: 8(return address)+20h(parameters)+8(push)+0(locals) = 30h
;Ensure Stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store Values retrieved by DispatchMessageA:
        mov hWnd, rcx
        mov uMsg, rdx
        mov wParam, r8
        mov lParam, r9

;Distributing with respect to uMsg
        cmp rdx,1 ;WM_CREATE = 0x0001
                je wmChildCreate
        cmp rdx,222h ;WM_MDIACTIVATE = 0x0222
                je wmChildActivate
        cmp rdx,202h ;WM_LBUTTONUP = 0x0202
                je wmChildLButtonUp
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmChildClose
        jmp defChildWndProc

wmChildCreate:
	nop
        jmp finChildWndProc

wmChildActivate:
        ;mov rcx, hWnd
        ;mov r9, lParam
        cmp r9,rcx
                jne notChild
        ;Child:
                ;WM_MDISETMENU = 0x0230
                Call4 SendMessageA, hWndClient, 230h, hChildMenu, hChildSubMenu
                Call1 DrawMenuBar, hWndFrame
                jmp finChildWndProc
        notChild:
                ;WM_MDISETMENU = 0x0230
                Call4 SendMessageA, hWndClient, 230h, hMainMenu, hMainSubMenu
                Call1 DrawMenuBar, hWndFrame
                jmp finChildWndProc

wmChildLButtonUp:
        ;MB_OK + MB_ICONINFORMATION = 40h
        Call4 MessageBoxA, hWnd, offset szHello, offset szFrameTitle, 40h
        jmp finChildWndProc

wmChildClose:
	;MB_YESNO = 0x00000004L
        Call4 MessageBoxA, hWnd, offset szClose, offset szFrameTitle, 4
        cmp rax,6 ;IDYES = 6
                jne finChildWndProc
        ;WM_MDIDESTROY = 0x0221
        Call4 SendMessageA, hWndClient, 221h, hWnd, 0
        jmp finChildWndProc

defChildWndProc:
        Call4 DefMDIChildProcA, hWnd, uMsg, wParam, lParam
finChildWndProc:
;Assembler will add this epilogue automatically:
	;leave
        ret
ChildWndProc endp
end
