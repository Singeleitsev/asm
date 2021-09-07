option casemap:none
include D:\bin\dev\ml64\VS2015\include\user32.inc
include D:\bin\dev\ml64\VS2015\include\kernel32.inc
includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib

include include\struct64_18.inc
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

	xor rcx,rcx
	call GetModuleHandleA
	mov hInst,rax
cmp rax,0
je errWinMain
Spell64rax 0,szAppTitle,szAppHandle

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
	mov wc.cbSize,50h ;dword ptr sizeof WNDCLASSEX64
	mov wc.style,4003h ;CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
	lea rax,WndProc
	mov wc.lpfnWndProc,rax
	mov wc.cbClsExtra,0
	mov wc.cbWndExtra,0
	mov rax,hInst
	mov wc.hInstance,rax
;Load Icon
	xor rcx,rcx ;Pre-defined by System
	mov rdx,7F03h ;hIcon = IDI_EXCLAMATION = 32515 = 7F03h
	call LoadIconA
	mov wc.hIcon,rax
;Load Cursor
	xor rcx,rcx ;Pre-defined by System
	mov rdx,7F89h ;hCursor = IDC_HAND = 32649 =7F89h
	call LoadCursorA
	mov wc.hCursor,rax
;Fill up the rest of WNDCLASSEX64
	mov wc.hbrBackground,1
	mov wc.lpszMenuName,0
	lea rax,szWndClass
	mov wc.lpszClassName,rax
	mov wc.hIconSm,0
;Now set the Pointer to structure and call the Function
	lea rcx,wc
	call RegisterClassEx
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
	mov rax,hInst
	mov qword ptr [rsp+50h],rax ;hInstance
	mov qword ptr [rsp+58h],0 ;lpParam 
	call CreateWindowExA
;Store the Handle
	mov hWndMain,rax
cmp rax,0
je errWndHandle
Spell64rax 0,szAppTitle,szWndHandle

;Show and Update the Main Window
	mov rcx,hWndMain
	mov rdx,1 ;nCmdShow = SW_SHOWNORMAL = 1
	call ShowWindow
	;mov rcx,hWnd ;hWnd is already in rcx
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
	lea rcx,msg
	call TranslateMessage
	;lea rcx,msg ;msg is already in rcx
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
	xor rcx,rcx ;hWnd
	;lpText is already in rdx
	lea r8,szAppTitle ;lpCaption
	mov r9,10h ;uType = MB_OK + MB_ICONERROR = 0 + 10h = 10h
	call MessageBoxA

CleanUp:
mov rax,rsp
Spell64rax 0,szAppTitle,szStackPointer
	xor rcx,rcx
	call ExitProcess
WinMain endp

;===========================================================
WndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp ;<--
	;mov rbp,rsp ;<--
;Be sure the Stack is Aligned by 10h
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
	xor rcx,rcx
	call PostQuitMessage
	xor rax,rax
	jmp finWndProc
defWndProc:
	mov rcx,hWnd
	mov rdx,uMsg
	mov r8,wParam
	mov r9,lParam
	call DefWindowProc
finWndProc:
;This Procedure has parameters hence Assembler WILL put the 'leave' instruction here
	;mov rsp,rbp
	;pop rbp
	ret
WndProc endp
end