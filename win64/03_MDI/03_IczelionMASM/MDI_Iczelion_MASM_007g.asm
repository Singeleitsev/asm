option casemap:none
;Standard Includes and Libraries
	include D:\bin\dev\ml64\VS2015\include\user32.inc
	include D:\bin\dev\ml64\VS2015\include\kernel32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib

;Custom includes
	include include\struct64_18.inc
	include include\Spell_09.inc

WinMain proto :QWORD,:QWORD,:QWORD,:QWORD

.const
	IDR_MAINMENU	equ 101
	IDR_CHILDMENU	equ 102
	IDM_EXIT	equ 40001
	IDM_TILEHORZ	equ 40002
	IDM_TILEVERT	equ 40003
	IDM_CASCADE	equ 40004
	IDM_NEW		equ 40005
	IDM_CLOSE	equ 40006

.data
;Names and Titles
	ClassName db "MDIASMClass",0
	MDIClientName db "MDICLIENT",0
	MDIChildClassName db "Win64asmMDIChild",0
	MDIChildTitle db "MDI Child",0
	AppName  db "Win64asm MDI Demo",0
	ClosePromptMessage db "Are you sure you want to close this window?",0
;Debug Messages
        szAppHandle db "Application Handle: 0000.0000.0000.0000h",0
        szFrameHandle db "Frame Window Handle: 0000.0000.0000.0000h",0
        szClientHandle db "Client Window Handle: 0000.0000.0000.0000h",0
        szStackPointer db "rsp: 0000.0000.0000.0000h",0
	szLastErr db "Last Error Code: 0000.0000.0000.0000h",0
	szRAX db "rax: 0000.0000.0000.0000h",0
;Error Messages
	szErrCreateFrame db "Failed to create Frame Window Class",0

.data?
;Handles and Structures
	hInstance dq ?
	hMainMenu dq ?
	hwndClient dq ?
	hChildMenu dq ?
	mdicreate MDICREATESTRUCT64 <>
	hwndFrame dq ?

.code
start proc
;Be sure stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 20h Bytes as Buffer for 4 Parameters
	add rax,20h
	sub rsp,rax
mov rax,rsp
Spell64rax 0, AppName, szStackPointer

;invoke GetModuleHandle, NULL
        xor rcx,rcx
        call GetModuleHandleA
        mov hInstance,rax
Spell64rax 0, AppName, szAppHandle

;invoke WinMain, hInstance,NULL,NULL, SW_SHOWDEFAULT
	mov rcx,rax
	xor rdx,rdx
	xor r8,r8
	mov r9,3 ;SW_SHOWDEFAULT = 10
	call WinMain
;invoke ExitProcess,eax
        mov rcx,rax
        call ExitProcess
start endp

;===================================================================
WinMain proc hInst:QWORD,hPrevInst:QWORD,CmdLine:QWORD,CmdShow:QWORD
;===================================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp
	;mov rbp,rsp
	LOCAL wc:WNDCLASSEX64
	LOCAL msg:MSG64
;Stack Usage: 8(return address)+20h(parameters)+8(push)+78h(locals) = 0A8h
;Be sure stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
mov rax,rsp
Spell64rax 0, AppName, szStackPointer

;Store Parameters
        mov hInst,rcx
        mov hPrevInst,rdx
        mov CmdLine,r8
        mov CmdShow,r9

;Register the frame window class
 	mov wc.cbSize,50h ;SIZEOF WNDCLASSEX64
 	mov wc.style,3 ;CS_HREDRAW or CS_VREDRAW
	lea rax,WndProc
	mov wc.lpfnWndProc,rax
	mov wc.cbClsExtra,0
	mov wc.cbWndExtra,0
	mov rax,hInstance
	mov wc.hInstance,rax
	mov wc.hbrBackground,0Ch ;COLOR_APPWORKSPACE
	mov wc.lpszMenuName,IDR_MAINMENU
	lea rax,ClassName
	mov wc.lpszClassName,rax
	;invoke LoadIcon,NULL,IDI_APPLICATION
		xor rcx,rcx
		mov rdx,7F00h ;IDI_APPLICATION
		call LoadIcon
	mov wc.hIcon,rax
	mov wc.hIconSm,rax
	;invoke LoadCursor,NULL,IDC_ARROW
		xor rcx,rcx
		mov rdx,7F00h ;IDI_ARROW
		call LoadCursorA
	mov wc.hCursor,rax
	;invoke RegisterClassEx, addr wc
		lea rcx,wc
		call RegisterClassExA

;Register the MDI child window class
	lea rax,ChildProc
	mov wc.lpfnWndProc,rax
	mov wc.hbrBackground,6 ;COLOR_WINDOW+1
	lea rax,MDIChildClassName
	mov wc.lpszClassName,rax
	;invoke RegisterClassEx,addr wc
		lea rcx,wc
		call RegisterClassExA

;Create the Frame Window
	;invoke CreateWindowEx,NULL,ADDR ClassName,ADDR AppName,\
		;WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN,\
		;CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,\
		;NULL,0,hInst,NULL
		;sub rsp,40h
		xor rcx,rcx
		lea rdx,ClassName
		lea r8,AppName
		mov r9,2CF0000h ;WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN
		mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
		mov qword ptr [rsp+20h],rax
		mov qword ptr [rsp+28h],rax
		mov qword ptr [rsp+30h],rax
		mov qword ptr [rsp+38h],rax
		mov qword ptr [rsp+40h],0
		mov qword ptr [rsp+48h],0
		mov rax,hInstance
		mov qword ptr [rsp+50h],rax
		mov qword ptr [rsp+58h],0
		call CreateWindowExA
		;add rsp,40h
	mov hwndFrame,rax
	cmp rax,0
		je ErrCreateFrame
	Spell64rax 0, AppName, szFrameHandle
	;invoke LoadMenu, hInstance,IDR_CHILDMENU
		mov rcx,hInstance
		mov rdx,IDR_CHILDMENU
		call LoadMenu
	mov hChildMenu,rax
	;invoke ShowWindow, hwndFrame,SW_SHOWNORMAL
		mov rcx,hwndFrame
		mov rdx,1 ;SW_SHOWNORMAL
		call ShowWindow
	;invoke UpdateWindow, hwndFrame
		mov rcx,hwndFrame
		call UpdateWindow

MsgLoop:
        lea rcx,msg ;lpMsg
        xor rdx,rdx ;hWnd
        xor r8,r8 ;wMsgFilterMin
        xor r9,r9 ;wMsgFilterMax
        call GetMessageA
        cmp rax,0
                je CleanUp
        mov rcx,hwndClient
        lea rdx,msg
        call TranslateMDISysAccel
        cmp rax,0
                jne MsgLoop
        lea rcx,msg
        call TranslateMessage
        lea rcx,msg
        call DispatchMessageA
jmp MsgLoop

ErrCreateFrame:
        lea rdx,szErrCreateFrame ;lpText
	;jmp Alarm
Alarm:
        xor rcx,rcx ;hWnd
        ;lpText is already in rdx
        lea r8,AppName ;lpCaption
        mov r9,10h ;uType = MB_OK + MB_ICONERROR = 0 + 10h = 10h
        call MessageBoxA

CleanUp:
	;invoke DestroyMenu, hChildMenu
		mov rcx,hChildMenu
		call DestroyMenu
	mov rax,msg.wParam
	ret
WinMain endp

;==============================================================
WndProc proc hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
;==============================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp
	;mov rbp,rsp
	LOCAL ClientStruct:CLIENTCREATESTRUCT64
;Stack Usage: 8(return address)+20h(parameters)+8(push)+10h(locals) = 40h
;Be sure stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
mov rax,rsp
Spell64rax 0, ClassName, szStackPointer

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
        cmp rdx,2 ;WM_DESTROY = 0x0002
                je wmFrameDestroy
        jmp defFrameWndProc

;.if uMsg==WM_CREATE
wmFrameCreate:
	;invoke GetMenu,hWnd
		mov rcx, hWnd
		call GetMenu
	mov hMainMenu,rax
	;invoke GetSubMenu,hMainMenu,1
		mov rcx,hMainMenu
		mov rdx,1
		call GetSubMenu
	mov ClientStruct.hWindowMenu,rax
	mov ClientStruct.idFirstChild,100
	;INVOKE CreateWindowEx,NULL,ADDR MDIClientName,NULL,\
		;WS_CHILD or WS_VISIBLE or WS_CLIPCHILDREN,\
		;CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,\
		;hWnd,NULL,hInstance,addr ClientStruct
			sub rsp,40h
			xor rcx,rcx
			lea rdx,MDIClientName
			xor r8,r8
			mov r9,52000000h ;WS_CHILD+WS_VISIBLE+WS_CLIPCHILDREN
	                mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
	                mov qword ptr [rsp+20h],rax ;CW_USEDEFAULT
	                mov qword ptr [rsp+28h],rax ;ÑW_USEDEFAULT
	                mov qword ptr [rsp+30h],rax ;CW_USEDEFAULT
	                mov qword ptr [rsp+38h],rax ;CW_USEDEFAULT
	                mov rax,hWnd
	                mov qword ptr [rsp+40h],rax
	                mov qword ptr [rsp+48h],0
	                mov rax,hInstance
	                mov qword ptr [rsp+50h],rax
	                lea rax,ClientStruct
	                mov qword ptr [rsp+58h], rax
	                call CreateWindowExA
			add rsp,40h
		mov hwndClient,rax
		Spell64rax 0, AppName, szClientHandle
	;Initialize the MDICREATESTRUCT
		lea rax,MDIChildClassName
		mov mdicreate.szClass,rax
		lea rax,MDIChildTitle
		mov mdicreate.szTitle,rax
		mov rax,hInstance
		mov mdicreate.hOwner,rax
                mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
		mov mdicreate.x,eax
		mov mdicreate.y,eax
		mov mdicreate.lx,eax
		mov mdicreate.ly,eax
	jmp finFrameWndProc

;.elseif uMsg==WM_COMMAND
wmFrameCommand:
	;.if lParam==0
        ;mov r9,lParam ;lParam is already in r9
        cmp r9,0
                jne finFrameWndProc
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
	        jmp defFrameCmd

	;.if ax==IDM_NEW
        idmFrameNew:
		;invoke SendMessage,hwndClient,WM_MDICREATE,0,addr mdicreate
			mov rcx,hwndClient
			mov rdx,220h ;WM_MDICREATE = 0x0220
			xor r8,r8
			lea r9,mdicreate
			call SendMessageA
		jmp finFrameWndProc
	;.elseif ax==IDM_CLOSE
	idmFrameClose:
		;invoke SendMessage,hwndClient,WM_MDIGETACTIVE,0,0
			mov rcx,hwndClient
			mov rdx,229h ;WM_MDIGETACTIVE = 0x0229
			xor r8,r8
			xor r9,r9
			call SendMessage
		;invoke SendMessage,eax,WM_CLOSE,0,0
			mov rcx,rax
			mov rdx,10h ;WM_CLOSE = 0x0010
			xor r8,r8
			xor r9,r9
			call SendMessageA
		jmp finFrameWndProc
	;.elseif ax==IDM_EXIT
	idmFrameExit:
		;invoke SendMessage,hWnd,WM_CLOSE,0,0
			mov rcx,hWnd
			mov rdx,10h ;WM_CLOSE = 0x0010
			xor r8,r8
			xor r9,r9
			call SendMessageA
		jmp finFrameWndProc
	;.elseif ax==IDM_TILEHORZ
	idmFrameTileHorz:
		;invoke SendMessage,hwndClient,WM_MDITILE,MDITILE_HORIZONTAL,0
			mov rcx,hwndClient
			mov rdx,226h ;WM_MDITILE = 0x0226
			mov r8,1 ;MDITILE_HORIZONTAL = 1
			xor r9,r9
			call SendMessageA
		jmp finFrameWndProc
	;.elseif ax==IDM_TILEVERT
	idmFrameTileVert:
		;invoke SendMessage,hwndClient,WM_MDITILE,MDITILE_VERTICAL,0
			mov rcx,hwndClient
			mov rdx,226h
			xor r8,r8
			xor r9,r9
			call SendMessageA
		jmp finFrameWndProc
	;.elseif ax==IDM_CASCADE
	idmFrameCascade:
		;invoke SendMessage,hwndClient,WM_MDICASCADE,MDITILE_SKIPDISABLED,0
			mov rcx,hwndClient
			mov rdx,227h ;WM_MDICASCADE = 0x0227
			mov r8,2 ;MDITILE_SKIPDISABLED = 2
			xor r9,r9
			call SendMessageA
		jmp finFrameWndProc
	;.else
	defFrameCmd:
		;invoke DefFrameProc,hWnd,hwndClient,uMsg,wParam,lParam
			jmp defFrameWndProc
		;ret
	;.endif
;.endif
;.elseif uMsg==WM_DESTROY
wmFrameDestroy:
	;invoke PostQuitMessage,NULL
		xor rcx,rcx
		call PostQuitMessage
		xor rax,rax
		jmp finFrameWndProc
;else
defFrameWndProc:
	;invoke DefFrameProc,hWnd,hwndClient,uMsg,wParam,lParam
		;sub rsp,10h
		mov rcx,hWnd
		mov rdx,hwndClient
		mov r8,uMsg
		mov r9,wParam
		mov rax,lParam
		mov qword ptr [rsp+20h],rax
		call DefFrameProcA
		;add rsp,10h	
	;ret
;.endif
finFrameWndProc:
	xor rax,rax
	ret
WndProc endp

;===============================================================
ChildProc proc hChild:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;===============================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp ;<-- sub rsp,8
	;mov rbp,rsp ;<--

;Stack Usage: 8(return address)+20h(parameters)+8(push)+0(locals) = 30h
;Be sure stack is aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
mov rax,rsp
Spell64rax 0, MDIChildTitle, szStackPointer

;Store Values retrieved by DispatchMessageA:
        mov hChild, rcx
        mov uMsg, rdx
        mov wParam, r8
        mov lParam, r9

;Distributing with respect to uMsg
        cmp rdx,222h ;WM_MDIACTIVATE = 0x0222
                je wmChildActivate
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmChildClose
        jmp defChildWndProc

;.if uMsg==WM_MDIACTIVATE
wmChildActivate:
        ;mov rcx, hWnd
        ;mov r9, lParam
        cmp r9,rcx
                jne notChild
	;.if eax==hChild
		;invoke GetSubMenu,hChildMenu,1
			mov rcx,hChildMenu
			mov rdx,1
			call GetSubMenu
		mov r9,rax
		;invoke SendMessage,hwndClient,WM_MDISETMENU,hChildMenu,edx
			mov rcx,hwndClient
			mov rdx,230h ;WM_MDISETMENU = 0x0230
			mov r8,hChildMenu
			;mov r9,rax
			call SendMessageA
		jmp DrawMenu
	;.else
	notChild:
		;invoke GetSubMenu,hMainMenu,1
			mov rcx,hMainMenu
			mov rdx,1
			call GetSubMenu
		mov r9,rax
		;invoke SendMessage,hwndClient,WM_MDISETMENU,hMainMenu,edx
			mov rcx,hwndClient
			mov rdx,230h ;WM_MDISETMENU = 0x0230
			mov r8,hMainMenu
			;mov r9,rax
			call SendMessageA			
	;.endif
	DrawMenu:
		;invoke DrawMenuBar,hwndFrame
			mov rcx,hwndFrame
			call DrawMenuBar
		jmp finChildWndProc
;.elseif uMsg==WM_CLOSE
wmChildClose:
	;invoke MessageBox,hChild,addr ClosePromptMessage,addr AppName,MB_YESNO
		mov rcx,hChild
		lea rdx,ClosePromptMessage
		lea r8,AppName
		mov r9,4 ;MB_YESNO = 0x00000004L
		call MessageBoxA
	;.if eax==IDYES
	cmp rax,6 ;IDYES = 6
		jne finChildWndProc
		;invoke SendMessage,hwndClient,WM_MDIDESTROY,hChild,0
			mov rcx,hwndClient
			mov rdx,221h ;WM_MDIDESTROY = 0x0221
			mov r8,hChild
			xor r9,r9
			call SendMessageA
			jmp finChildWndProc
	;.endif		
;.else
defChildWndProc:
	;invoke DefMDIChildProc,hChild,uMsg,wParam,lParam
		mov rcx,hChild
		mov rdx,uMsg
		mov r8,wParam
		mov r9,lParam
		call DefMDIChildProcA
	;ret
;.endif
finChildWndProc:
;This Procedure has parameters hence Assembler WILL put the 'leave' instruction here
	;mov rsp,rbp
	;pop rbp
	xor rax,rax
	ret
ChildProc endp
end ;end start
