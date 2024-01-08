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

WinMain PROTO :QWORD,:QWORD,:QWORD,:QWORD
WndProc PROTO :QWORD,:QWORD,:QWORD,:QWORD

.data
;Class Names
	szWndClass db "clsSDI64",0
;Window Captions
	szAppTitle db "64-bit CAD Scroll Engine",0
;Info Messages
	;szInfo1 db "Some Info",0
;Prompt Messages
	szExit db "Close this Application?",0
;Debug Messages
	szCoord db "lParam: 0000.0000.0000.0000h",0
	szWheelDelta db "wParam: 0000.0000.0000.0000h",0
;Error Messages
	;szErr1 db "Failed to complete some action",0

.data?
;Window Handles
	hWndMain dq ?
;Device Context and Drawing Handles
	hDC dq ?
	hBrush dq ?
;Properties
	xLeft dq ?
	yTop dq ?
	xRight dq ?
	yBottom dq ?
	Color dq ?
;Flags

;Structures
	wc WNDCLASSEX64 <>
	msg MSG64 <>
	rect RECT64 <?>
	ps PAINTSTRUCT64 <?>

.code
;======================================================================
WinMain proc hInst:QWORD, hPrevInst:QWORD, CmdLine:QWORD, CmdShow:QWORD
;======================================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp
	;mov rbp,rsp
;Align the Stack by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
;Get Application Handle
	xor rcx,rcx
	call GetModuleHandleA
	mov hInst,rax

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
	mov wc.cbSize,50h ;dword ptr sizeof WNDCLASSEX64
	mov wc.style,4003h ;CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
	m64addr wc.lpfnWndProc,WndProc
	mov wc.cbClsExtra,0
	mov wc.cbWndExtra,0
	m64m64 wc.hInstance,hInst
	Call2 LoadIcon,0,7F03h ;hIcon = IDI_EXCLAMATION = 32515 = 7F03h
	mov wc.hIcon,rax
	Call2 LoadCursorA,0,7F89h ;hCursor = IDC_HAND = 32649 =7F89h
	mov wc.hCursor,rax
	mov wc.hbrBackground,1
	mov wc.lpszMenuName,0
	m64addr wc.lpszClassName,szWndClass
	mov wc.hIconSm,0
	Call1 RegisterClassEx,offset wc

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
	m64m64 qword ptr [rsp+50h],hInst ;hInstance
	mov qword ptr [rsp+58h],0 ;lpParam 
	call CreateWindowExA
	mov hWndMain,rax

;Show and Update the Main Window
	Call2 ShowWindow,hWndMain,1 ;nCmdShow = SW_SHOWNORMAL = 1
	Call1 UpdateWindow,hWndMain

;Enter the Loop
MsgLoop:
	Call4 GetMessageA,offset msg,0,0,0
	cmp rax,0
	je CleanUp
	Call1 TranslateMessage,offset msg
	Call1 DispatchMessageA,offset msg
jmp MsgLoop

CleanUp:
	xor rcx,rcx
	call ExitProcess
WinMain endp

;===========================================================
WndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
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
	cmp rdx,0Fh ;WM_PAINT = 0x000F
		je wmPaint
	cmp rdx,201h ;WM_LBUTTONDOWN = 0x0201
		je wmLButtonDown
	cmp rdx,200h ;WM_MOUSEMOVE = 0x0200
		je wmMouseMove
	cmp rdx,202h ;WM_LBUTTONUP = 0x0202
		je wmLButtonUp
	cmp rdx,203h ;WM_LBUTTONDBLCLK = 0x0203
		je wmLButtonDblClk
	cmp rdx,205h ;WM_RBUTTONUP = 0x0205
		je wmRButtonUp
	cmp rdx,20Ah ;WM_MOUSEWHEEL = 0x020A
		je wmMouseWheel
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmDestroy
	jmp defWndProc

wmCreate:
	mov xLeft,50h
	mov yTop,50h
	mov xRight,0A0h
	mov yBottom,0A0h	
	mov Color,0E0E0E0h
	jmp finWndProc

wmActivate:
	nop
	jmp finWndProc

wmPaint:
	Call1 GetDC,hWnd
	mov hDC,rax
	Call1 CreateSolidBrush,Color
	mov hBrush,rax
	Call2 SelectObject,hDC,hBrush
	Call5 Rectangle,hDC,xLeft,yTop,xRight,yBottom
	Call2 ReleaseDC,hWnd,hDC
	Call1 DeleteObject,hBrush
	jmp finWndProc

wmLButtonDown:
	;Call1 SetCapture,hWnd
	;Call2 GetClientRect,hWnd,offset rect
	;Call1 GET_X_LPARAM,r9
		mov rax,r9
		and rax,0FFFFh
		mov xLeft,rax
	;Call1 GET_Y_LPARAM,r9
		mov rax,r9
		shr rax,16
		mov yTop,rax
	jmp ReDraw

wmMouseMove:
	mov rax,r8
	cmp al,1 ;LButton is pushed
		jne finWndProc
	;Call3 InvalidateRect,hWnd,0,1 ;Force WM_PAINT message
	;Call1 GET_X_LPARAM,r9
		mov rax,r9
		and rax,0FFFFh
		mov xRight,rax
	;Call1 GET_Y_LPARAM,r9
		mov rax,r9
		shr rax,16
		mov yBottom,rax
	Call1 GetDC,hWnd
	mov hDC,rax
	Call1 CreateSolidBrush,Color
	mov hBrush,rax
	Call2 SelectObject,hDC,hBrush
	Call5 Rectangle,hDC,xLeft,yTop,xRight,yBottom
	Call2 ReleaseDC,hWnd,hDC
	Call1 DeleteObject,hBrush
	jmp ReDraw

wmLButtonUp:
	jmp finWndProc

wmLButtonDblClk:
	jmp finWndProc

wmRButtonUp:
	;Call1 GET_X_LPARAM,r9
		mov rax,r9
		and rax,0FFFFh
		mov xLeft,rax
		add rax,50h
		mov xRight,rax
	;Call1 GET_Y_LPARAM,r9
		mov rax,r9
		shr rax,16
		mov yTop,rax
		add rax,50h
		mov yBottom,rax
	jmp ReDraw

wmMouseWheel:
	mov rax,r8
	cmp al,4 ;Shift was pushed
		je SlideHorz
	cmp al,8 ;Ctrl was pushed
		je SlideDiagLTRB
	cmp al,0Ch ;Shift+Ctrl were pushed
		je SlideDiagRTLB
	;jmp SlideVert

	SlideVert:
		and rax,0FF000000h ;The sign
		cmp rax,0
			jg GoDown
		;GoUp:
			sub yTop,10h
			sub yBottom,10h
			jmp ReDraw
		GoDown:
			add yTop,10h
			add yBottom,10h
			jmp ReDraw
	SlideHorz:
		and rax,0FF000000h ;The sign
		cmp rax,0
			jg GoLeft
		;GoRight:
			add xLeft,10h
			add xRight,10h
			jmp ReDraw
		GoLeft:
			sub xLeft,10h
			sub xRight,10h
			jmp ReDraw
	SlideDiagLTRB:
		and rax,0FF000000h ;The sign
		cmp rax,0
			jg GoRBLT
		;GoLTRB:
			add xLeft,10h
			add xRight,10h
			add yTop,10h
			add yBottom,10h
			jmp ReDraw
		GoRBLT:
			sub xLeft,10h
			sub xRight,10h
			sub yTop,10h
			sub yBottom,10h
			jmp ReDraw
	SlideDiagRTLB:
		and rax,0FF000000h ;The sign
		cmp rax,0
			jg GoLBRT
		;GoRTLB:
			sub xLeft,10h
			sub xRight,10h
			add yTop,10h
			add yBottom,10h
			jmp ReDraw
		GoLBRT:
			add xLeft,10h
			add xRight,10h
			sub yTop,10h
			sub yBottom,10h
			jmp ReDraw

wmDestroy:
	Call1 PostQuitMessage,0
	xor rax,rax
	jmp finWndProc
defWndProc:
	Call4 DefWindowProc,hWnd,uMsg,wParam,lParam
	ret
ReDraw:
	Call3 InvalidateRect,hWnd,0,1 ;Force WM_PAINT message
finWndProc:
	ret
WndProc endp
end