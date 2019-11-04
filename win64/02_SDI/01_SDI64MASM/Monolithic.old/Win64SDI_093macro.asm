option casemap:none
;Standard Includes and Libraries
	include D:\bin\dev\ml64\VS2015\include\user32.inc
	include D:\bin\dev\ml64\VS2015\include\kernel32.inc
	;include D:\bin\dev\ml64\VS2015\include\gdi32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	;includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;Custom Includes
	include include\struct64_20.inc
	include include\Mem_03.inc
	include include\Call_02.inc
	include include\Spell_09.inc

WinMain PROTO :QWORD,:QWORD,:QWORD,:QWORD
WndProc PROTO :QWORD,:QWORD,:QWORD,:QWORD

.data
;Class Names
	szWndClass db "clsSDI64",0
;Window Captions
	szAppTitle db "64-bit SDI Application assembled with MASM",0
;Info Messages
	szHello db 'Hello,World!',0
;Prompt Messages
	szExit db "Close this Application?",0
;Debug Messages
	szAppHandle db "Application Handle: 0000.0000.0000.0000h",0
	szWndHandle db "Main Window Handle: 0000.0000.0000.0000h",0	
	szStackPointer db "rsp: 0000.0000.0000.0000h",0
;Error Messages
	szErrFrameHandle db "Failed to get the Main Window Handle",0
	szErrWinMain db "Error in WinMain",0

.data?
;Window Handles
	hWndMain dq ?
;Structures
	wc WNDCLASSEX64 <>
	msg MSG64 <>

.code
;======================================================================
WinMain proc hInst:QWORD, hPrevInst:QWORD, CmdLine:QWORD, CmdShow:QWORD
;======================================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp ;<-- ;sub rsp,8
	;mov rbp,rsp ;<--
;Align the Stack by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
mov rax,rsp
Spell64rax 0,szAppTitle,szStackPointer

	Call1 GetModuleHandleA,0
	mov hInst,rax
cmp rax,0
je errWinMain
Spell64rax 0,szAppTitle,szAppHandle

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
	mov wc.cbSize,50h ;dword ptr sizeof WNDCLASSEX64
	mov wc.style,4003h ;CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
	m64addr wc.lpfnWndProc,WndProc
	mov wc.cbClsExtra,0
	mov wc.cbWndExtra,0
	m64m64 wc.hInstance,hInst
;Load Icon
	Call2 LoadIconA,0,7F03h ;hIcon = IDI_EXCLAMATION = 32515 = 7F03h
	mov wc.hIcon,rax
;Load Cursor
	Call2 LoadCursorA,0,7F89h ;hCursor = IDC_HAND = 32649 =7F89h
	mov wc.hCursor,rax
;Fill up the rest of WNDCLASSEX64
	mov wc.hbrBackground,1
	mov wc.lpszMenuName,0
	m64addr wc.lpszClassName,szWndClass
	mov wc.hIconSm,0
;Now call the Function
	Call1 RegisterClassEx,offset wc
cmp rax,0
je errWinMain

;Create the Main Window
	xor rcx,rcx ;dwExStyle
	lea rdx,szWndClass
	lea r8,szAppTitle
	mov r9,0CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW = 00CF.0000h
	mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+28h],rax ;y = ÑW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+40h],0 ;hWndParent 
	mov qword ptr [rsp+48h],0 ;hMenu
	m64m64 qword ptr [rsp+50h],hInst
	mov qword ptr [rsp+58h],0 ;lpParam 
	call CreateWindowExA
;Store the Handle
	mov hWndMain,rax
cmp rax,0
je errWndHandle
Spell64rax 0,szAppTitle,szWndHandle

;Show and Update the Main Window
	Call2 ShowWindow,hWndMain,1 ;nCmdShow = SW_SHOWNORMAL = 1
	Call1 UpdateWindow,hWndMain

;Enter the Loop
MsgLoop: ;Critical time, don't use macros
	lea rcx,msg ;lpMsg
	xor rdx,rdx ;hWnd
	xor r8,r8 ;wMsgFilterMin
	xor r9,r9 ;wMsgFilterMax
	call GetMessageA
	cmp rax,0
	je CleanUp
	lea rcx,msg
	call TranslateMessage
	lea rcx,msg ;Re-Load is necessary
	call DispatchMessageA
jmp MsgLoop

;Error Alarms
errWndHandle:
	lea rdx,szErrFrameHandle ;lpText
	jmp errWinMainAlarm
errWinMain:
	lea rdx,szErrWinMain ;lpText
	;jmp errWinMainAlarm
errWinMainAlarm:
	;MB_OK + MB_ICONERROR = 0 + 10h = 10h
	Call4 MessageBoxA,0,rdx,offset szAppTitle,10h

CleanUp:
mov rax,rsp
Spell64rax 0,szAppTitle,szStackPointer
	Call1 ExitProcess,0
WinMain endp

;===========================================================
WndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store Values retrieved by DispatchMessageA:
	mov hWnd,rcx
	mov uMsg,rdx
	mov wParam,r8
	mov lParam,r9

;Distributing with respect to uMsg
	cmp rdx,1 ;WM_CREATE = 0x0001
		je wmCreate
	cmp rdx,6 ;WM_ACTIVATE = 0x0006
		je wmActivate
	cmp rdx,202h ;WM_LBUTTONUP = 0x0202
		je wmLButtonUp
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmDestroy
	jmp defWndProc

wmCreate:
	mov rax,rsp
	Spell64rax hWnd,szAppTitle,szStackPointer
	jmp finWndProc
wmActivate:
	nop
	jmp finWndProc
wmLButtonUp:
	mov rax,rsp
	Spell64rax hWnd,szAppTitle,szStackPointer
	jmp finWndProc
wmDestroy:
	Call1 PostQuitMessage,0
	xor rax,rax
	jmp finWndProc
defWndProc:
	Call4 DefWindowProc,hWnd,uMsg,wParam,lParam
finWndProc:
;Assembler will add this epilogue automatically:
	;leave 
	ret
WndProc endp
end