option casemap:none
include D:\bin\dev\ml64\VS2015\include\user32.inc
include D:\bin\dev\ml64\VS2015\include\kernel32.inc
include D:\bin\dev\ml64\VS2015\include\gdi32.inc
includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib

include include\struct64_18.inc
include include\Spell_09.inc

.const
        IDR_MAINMENU    = 100h
        IDR_CHILDMENU   = 110h
	;IDR_ACCEL = 200h
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
	szAbout db 'Ч. Петзолд. Программирование для Windows® 95',0Ah,0Dh,\
    'Глава 18 Многооконный интерфейс',0
;Prompt Messages
        szClose db "Close this Child Window?",0
        szExit db "Close this Application?",0
;Debug Messages
        szAppHandle db "Application Handle: 0000.0000.0000.0000h",0
        szFrameHandle db "Frame Window Handle: 0000.0000.0000.0000h",0
        szStackPointer db "rsp: 0000.0000.0000.0000h",0
        szLastErr db "Last Error Code: 0000.0000.0000.0000h",0
        szSpellRegister db "rax: 0000.0000.0000.0000h",0
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
;==============================================================================================
;int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
;==============================================================================================
WinMain proc
	;push rbp
	;mov rbp,rsp
;Stack Usage: 8(return address)+0(parameters)+8(push)+0(locals) = 48h
;Align Stack by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 20h Bytes as Buffer for possible 4 Parameters
	add rax,20h
	sub rsp,rax

        xor rcx,rcx
        call GetModuleHandleA
        mov hInstance,rax
Spell64rax 0, szFrameTitle, szAppHandle

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
        ;WndClass.cbSize = sizeof(WndClass);
                mov wc.cbSize,50h ;dword ptr sizeof WNDCLASSEX64
        ;WndClass.style = CS_HREDRAW | CS_VREDRAW;
                mov wc.style, 3 ;CS_HREDRAW + CS_VREDRAW = 2 + 1 = 3
        ;WndClass.lpfnWndProc = FrameWndProc;
                lea rax,FrameWndProc
                mov wc.lpfnWndProc,rax
        ;WndClass.cbClsExtra = 0;
                mov wc.cbClsExtra,0
        ;WndClass.cbWndExtra = 0;
                mov wc.cbWndExtra,0
        ;WndClass.hInstance = hInstance;
                mov rax,hInstance
                mov wc.hInstance,rax
        ;WndClass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
                xor rcx,rcx
                mov rdx,7F00h
                call LoadIcon
                mov wc.hIcon,rax
                mov wc.hIconSm,rax
        ;WndClass.hCursor = LoadCursor(NULL, IDC_ARROW);
                xor rcx,rcx
                mov rdx,7F00h
                call LoadCursorA
                mov wc.hCursor,rax
        ;WndClass.hbrBackground =(HBRUSH)(COLOR_APPWORKSPACE + 1);
                mov wc.hbrBackground,0Dh
        ;WndClass.lpszMenuName = NULL;
                mov wc.lpszMenuName,0
        ;WndClass.lpszClassName = szFrameClass;
                lea rax,szFrameClass
                mov wc.lpszClassName,rax
        ;WndClass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
                ;Already done
        ;invoke RegisterClassEx, WndClass
                lea rcx,wc
                call RegisterClassExA
cmp rax, 0
je errWinMain

;Register the Child Window Class
;There is no need to refill WNDCLASSEX again - just change some values
        ;WndClass.lpfnWndProc = ChildWndProc;
                lea rax, ChildWndProc
                mov wc.lpfnWndProc,rax
        ;WndClass.cbWndExtra = sizeof(HANDLE);
                mov wc.cbWndExtra,8
        ;WndClass.hbrBackground =(HBRUSH) GetStockObject(WHITE_BRUSH);
                xor rcx,rcx
                call GetStockObject
                mov wc.hbrBackground,rax
        ;WndClass.lpszClassName = szChildClass;
                lea rax,szChildClass
                mov wc.lpszClassName,rax
        ;invoke RegisterClassEx, WndClass
                lea rcx,wc
                call RegisterClassExA
cmp rax, 0
je errWinMain

;Get Menu Handles
        mov rcx,hInstance
        mov rdx,IDR_MAINMENU ;lpMenuName
        call LoadMenuA
        mov hMainMenu,rax
cmp rax, 0
je errMenu
        mov rcx,hMainMenu
        xor rdx,rdx ;nPos = 0; 'File' Menu Position is 0
        call GetSubMenu
        mov hMainSubMenu,rax
cmp rax, 0
je errMenu
        mov rcx,hInstance
        mov rdx,IDR_CHILDMENU ;lpMenuName
        call LoadMenuA
        mov hChildMenu,rax
cmp rax, 0
je errMenu
        mov rcx,hChildMenu
        mov rdx,1 ;nPos = 1; 'Window' Menu Position is 1
        call GetSubMenu
        mov hChildSubMenu,rax
cmp rax, 0
je errMenu

;Create the Frame Window
        sub rsp,40h ;reserve more stack space for additional 8 (total 12) parameters
        xor rcx,rcx ;dwExStyle
        lea rdx,szFrameClass ;lpszFrameClass
        lea r8,szFrameTitle ;lpszFrameTitle
        mov r9,2CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW + WS_CLIPCHILDREN = 00CF.0000h + 0200.0000h
        mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+28h],rax ;y = СW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+40h],0 ;hWndParent
        mov rax,hMainMenu
        mov qword ptr [rsp+48h],rax
        mov rax,hInstance
        mov qword ptr [rsp+50h],rax ;hInstance
        mov qword ptr [rsp+58h],0 ;lpParam 
        call CreateWindowExA
        add rsp,40h ; release reserved stack space
        mov hWndFrame,rax
Spell64rax 0, szFrameTitle, szFrameHandle

;Get Client Window Handle
        mov rcx,hWndFrame
        mov rdx,5 ;GW_CHILD
        call GetWindow
        mov hWndClient,rax ;hWndClient

;Show and Update the Frame Window
        mov rcx,hWndFrame
        mov rdx,1 ;nCmdShow = SW_SHOWNORMAL = 1
        call ShowWindow
	;mov rcx,hWndFrame
        call UpdateWindow

;Enter the Loop
MsgLoop:
        lea rcx,msg ;lpMsg
        xor rdx,rdx ;hWnd
        xor r8,r8 ;wMsgFilterMin
        xor r9,r9 ;wMsgFilterMax
        call GetMessageA
        cmp rax,0
                je CleanUp
        mov rcx,hWndClient
        lea rdx,msg
        call TranslateMDISysAccel
        cmp rax,0
                jne MsgLoop
        lea rcx,msg
        call TranslateMessage
        ;lea rcx,msg
        call DispatchMessageA
jmp MsgLoop

;Error Alarms
errMenu:
        lea rdx,szErrMenu ;lpText
        jmp errWinMainAlarm
errWinMain:
        lea rdx,szErrWinMain ;lpText
errWinMainAlarm:
        xor rcx,rcx ;hWnd
        ;lpText is already in rdx
        lea r8,szFrameTitle ;lpCaption
        mov r9,10h ;uType = MB_OK + MB_ICONERROR = 0 + 10h = 10h
        call MessageBoxA
        call GetLastError
        Spell64rax 0, szFrameTitle, szLastErr

CleanUp:
        mov rcx,hChildMenu
        call DestroyMenu
;There is no need to restore the Stack before exit
        mov rcx,msg.wParam
        call ExitProcess
WinMain endp

;=========================================
;proc FrameWndProc hWnd,uMsg,wParam,lParam
;=========================================
FrameWndProc proc hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp
	;mov rbp,rsp
;Stack Usage: 8(return address)+20h(parameters)+8(push)+0(locals) = 30h
	mov rax,rsp
;Align Stack by 10h
	and rax,0Fh
;Reserve 20h Bytes as Buffer for possible 4 Parameters
	add rax,20h
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
                mov rax,hMainSubMenu
                mov ClientStruct.hWindowMenu,rax
                mov ClientStruct.idFirstChild,IDM_FIRSTCHILD
        ;INVOKE CreateWindowEx,NULL,ADDR szClientClass,NULL,\
        ;WS_CHILD or WS_VISIBLE or WS_CLIPCHILDREN,\
        ;CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,\
        ;hWnd,NULL,hInstance,addr ClientStruct
		sub rsp,40h ;reserve more stack space for additional 8 (total 12) parameters
                xor rcx,rcx ;dwExStyle
                lea rdx,szClientClass ;lpszFrameClass
                xor r8,r8 ;lpszFrameTitle
                mov r9,52000000h ;dwStyle=WS_CHILD+WS_VISIBLE+WS_CLIPCHILDREN=4000.0000h+1000.0000h+0200.0000h
                mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
                mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT = 8000.0000h
                mov qword ptr [rsp+28h],rax ;y = СW_USEDEFAULT = 8000.0000h
                mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT = 8000.0000h
                mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT = 8000.0000h
                mov rax,hWnd
                mov qword ptr [rsp+40h],rax ;hWndParent
                mov qword ptr [rsp+48h],0 ;hMenu
                mov rax,hInstance
                mov qword ptr [rsp+50h],rax ;hInstance
                lea rax,ClientStruct
                mov qword ptr [rsp+58h], rax ;lpParam == lpClientStruct
                call CreateWindowExA
                add rsp,40h ; release reserved stack space
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
                        lea rax, szChildClass
                        mov MDICreate.szClass,rax
                        lea rax, szChildTitle
                        mov MDICreate.szTitle,rax
                        mov rax,hInstance
                        mov MDICreate.hOwner,rax
                        mov rax, 80000000h ;CW_USEDEFAULT
                        mov MDICreate.x, eax
                        mov MDICreate.y, eax
                        mov MDICreate.lx, eax
                        mov MDICreate.ly, eax
                        mov MDICreate.style, 0
                        mov MDICreate.lParam, 0
                mov rcx,hWndClient
                mov rdx,220h ;WM_MDICREATE = 0x0220
                xor r8,r8
                lea r9,MDICreate
                call SendMessageA
                mov hWndChild,rax
                jmp finFrameWndProc
        idmFrameClose:
                mov rcx,hWndClient
                mov rdx,229h ;WM_MDIGETACTIVE = 0x0229
                xor r8,r8
                xor r9,r9
                call SendMessageA
                mov hWndChild,rax
                mov rcx,hWndChild
                mov rdx,10h ;WM_CLOSE = 0x0010
                xor r8,r8
                xor r9,r9
                call SendMessageA
                jmp finFrameWndProc
        idmFrameExit:
                mov rcx,hWnd ;hWnd is already in rcx
                mov rdx,10h ;WM_CLOSE = 0x0010
                xor r8,r8
                xor r9,r9
                call SendMessageA
                jmp finFrameWndProc
        idmFrameTileHorz:
                mov rcx,hWndClient
                mov rdx,226h ;WM_MDITILE = 0x0226
                mov r8,1 ;MDITILE_HORIZONTAL = 1
                xor r9,r9
                call SendMessageA
                jmp finFrameWndProc
        idmFrameTileVert:
                mov rcx,hWndClient
                mov rdx,226h
                xor r8,r8
                xor r9,r9
                call SendMessageA
                jmp finFrameWndProc
        idmFrameCascade:
                mov rcx,hWndClient
                mov rdx,227h ;WM_MDICASCADE = 0x0227
                mov r8,2 ;MDITILE_SKIPDISABLED = 2
                xor r9,r9
                call SendMessageA
                jmp finFrameWndProc
        idmFrameAbout:
                mov rcx,hWnd
                lea rdx,szAbout ;lpText
                lea r8,szFrameTitle ;lpCaption
                mov r9,40h ;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h = 40h
                call MessageBoxA
                jmp finFrameWndProc
        defFrameCmd:
                ;Pass to active child...
                        mov rcx,hWndClient
                        mov rdx,229h ;WM_MDIGETACTIVE = 0x0229
                        xor r8,r8
                        xor r9,r9
                        call SendMessageA
                        ;mov hWndChild,rax
                        mov rcx,rax ;hWndChild
                        call IsWindow
                        cmp rax,0
                                jne defFrameWndProc
                        mov rcx,hWndChild
                        mov rdx,111h ;WM_COMMAND = 0x0111
                        mov r8,wParam
                        mov r9,lParam
                        call SendMessageA
                ;...and then to DefFrameProc
                        jmp defFrameWndProc

wmFrameClose:
        mov rcx,hWnd
        lea rdx,szExit ;lpText
        lea r8,szFrameTitle ;lpCaption
        mov r9,4 ;MB_YESNO
        call MessageBoxA
        cmp rax,6 ;IDYES
                jne finFrameWndProc
        mov rcx,hWnd
        mov rdx,2
        xor r8,r8
        xor r9,r9
        call SendMessageA
        jmp finFrameWndProc
wmFrameDestroy:
        xor rcx,rcx
        call PostQuitMessage
        xor rax,rax
        jmp finFrameWndProc
defFrameWndProc:
        sub rsp,10h ;reserve more stack space for 1 additional (5 total) parameters
        mov rcx,hWnd
        mov rdx,hWndClient
        mov r8,uMsg
        mov r9,wParam
        mov rax,lParam
        mov qword ptr [rsp+20h],rax
        call DefFrameProcA
        add rsp,10h ; release reserved stack space
finFrameWndProc:
;This Procedure has parameters hence Assembler WILL put the 'leave' instruction here
	;mov rsp,rbp
	;pop rbp
        ret
FrameWndProc endp

;==============================================================
;proc ChildWndProc uses rbx rsi rdi, hWnd, uMsg, wParam, lParam
;==============================================================
ChildWndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp ;<-- sub rsp,8
	;mov rbp,rsp ;<--
;Stack Usage: 8(return address)+20h(parameters)+8(push)+0(locals) = 30h
	mov rax,rsp
;Align Stack by 10h
	and rax,0Fh
;Reserve 20h Bytes as Buffer for possible 4 Parameters
	add rax,20h
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
                mov rcx,hWndClient
                mov rdx,230h ;WM_MDISETMENU = 0x0230
                mov r8,hChildMenu
                mov r9,hChildSubMenu
                call SendMessageA
                mov rcx,hWndFrame
                call DrawMenuBar
                jmp finChildWndProc
        notChild:
                mov rcx,hWndClient
                mov rdx,230h ;WM_MDISETMENU = 0x0230
                mov r8,hMainMenu
                mov r9,hMainSubMenu
                call SendMessageA
                mov rcx,hWndFrame
                call DrawMenuBar
                jmp finChildWndProc

wmChildLButtonUp:
        mov rcx,hWnd
        lea rdx,szHello ;lpText
        lea r8,szFrameTitle ;lpCaption
        mov r9,40h ;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h = 40h
        call MessageBoxA
        jmp finChildWndProc

wmChildClose:
        mov rcx,hWnd
        lea rdx,szClose
        lea r8,szFrameTitle
        mov r9,4 ;MB_YESNO = 0x00000004L
        call MessageBoxA
        cmp rax,6 ;IDYES = 6
                jne finChildWndProc
        mov rcx,hWndClient
        mov rdx,221h ;WM_MDIDESTROY = 0x0221
        mov r8,hWnd
        xor r9,r9
        call SendMessageA
        jmp finChildWndProc

defChildWndProc:
        mov rcx,hWnd
        mov rdx,uMsg
        mov r8,wParam
        mov r9,lParam
        call DefMDIChildProcA
finChildWndProc:
;This Procedure has parameters hence Assembler WILL put the 'leave' instruction here
	;mov rsp,rbp
	;pop rbp
        ret
ChildWndProc endp
end
