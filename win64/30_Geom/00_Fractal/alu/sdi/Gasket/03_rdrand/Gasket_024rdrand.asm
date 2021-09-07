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

.const
;Window Properties
	szWndClass db "clsSDI64",0
	szAppTitle db "Sierpinski Gasket Built with RDRAND instruction",0

.data
;Window Handles
	hWndMain dq 0
;Gasket Vertices
	x0 dq 0
	y0 dq 0
	x1 dq ? ;w/2 = 3C0h
	y1 dq 0
	x2 dq ? ;w = 780h
	y2 dq 0
	x3 dq ? ;w = 780h
	y3 dq ? ;h/2 = 21Ch
	x4 dq ? ;w = 780h
	y4 dq ? ;h = 438h
	x5 dq ? ;w/2 = 3C0h
	y5 dq ? ;h = 438h
	x6 dq 0
	y6 dq ? ;h = 438h
	x7 dq 0
	y7 dq ? ;h/2 = 21Ch
;Properties
	Color dq 0FFFFFFh ;White by Default

.data?
;Current Point
	x dq ?
	y dq ?
;Loop Counter
	i dd ?
;Structures
	wc WNDCLASSEX64 <?>
	msg MSG64 <?>
	ps PAINTSTRUCT64 <?>
	rect RECT64 <?>

.code
;======================================================================
WinMain proc hInst:QWORD, hPrevInst:QWORD, CmdLine:QWORD, CmdShow:QWORD
;======================================================================
;Align the Stack by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
;Get Application Handle
	Call1 GetModuleHandleA,0
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
	;Call2 ShowWindow,hWndMain,3 ;nCmdShow = SW_SHOWMAXIMIZED = 3
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
	Call1 ExitProcess,0
WinMain endp

;=============================================================================
WndProc proc uses rbx rdi rsi, hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;=============================================================================
LOCAL hdc:QWORD, hbrush:QWORD, hbit:QWORD
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
	cmp rdx,0Fh ;WM_PAINT = 0x000F
		je wmPaint
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmDestroy
	jmp defWndProc

wmCreate:
	nop
	jmp finWndProc

wmPaint:
	;Get Graphic Context
		Call2 BeginPaint,hWnd,offset ps
		mov hdc,rax
	;Get Window Size (pixels)
		Call2 GetClientRect,hWnd,offset rect
	;Calculate Width
		xor rcx,rcx
		xor rdx,rdx
			mov ecx,rect.left
			mov edx,rect.right
		sub rdx,rcx ;Width
			mov x2,rdx
			mov x3,rdx
			mov x4,rdx
		shr edx,1 ;Width/2
			mov x1,rdx
			mov x5,rdx
	;Calculate Height
		xor rcx,rcx
		xor rdx,rdx
			mov ecx,rect.top
			mov edx,rect.bottom
		sub rdx,rcx ;Height
			mov y4,rdx
			mov y5,rdx
			mov y6,rdx
		shr edx,1 ;Height/2
			mov y3,rdx
			mov y7,rdx

	mov i,0FFFFFh ;1 Million Points
	NewPoint:
		;Generate Random Number
			rdrand r10
		;Change Color
			mov Color,r10
		;Select Vertex
			;Probability spreads between 8 vertices.
			;3 bits are enough to encode 8 vertices.
			;Only 3 bits of 64 must remain after 'AND' operation
			;3 bits are 111b = 7h.
			;Probability must be converted into address
			;Variables for x and y coordinates are declared as QWORD
			;So we shift 111b left by 4 bits, 1110000b = 70h
			and r10,70h ;1110000b
			lea r8,x0
			add r8,r10
			lea r9,y0
			add r9,r10
		;Calculate coordinates
			;x = (x + 2*x_A) / 3
				xor rdx,rdx	;Dividend
				mov rcx,3	;Divisor
				mov rax,x
				add rax,[r8]	;x = x + x_A
				add rax,[r8]	;x = x + x_A
				div ecx		;x = x/3
				mov x,rax	;Store x
			;y = (y + 2*y_A) / 3
				xor rdx,rdx	;Dividend
				mov rcx,3	;Divisor
				mov rax,y
				add rax,[r9]	;y = y + y_A
				add rax,[r9]	;y = y + y_A
				div ecx		;y = y/3
				mov y,rax	;Store y
		;Draw
			Call4 SetPixel, hdc,x,y,Color
	;Check for Loop
		dec i
		cmp i,0
			ja NewPoint ;Loop

	;Release Graphic Context
		Call2 EndPaint, hdc,offset ps
	jmp finWndProc
wmDestroy:
	Call1 PostQuitMessage,0
	xor rax,rax
	jmp finWndProc
defWndProc:
	Call4 DefWindowProc,hWnd,uMsg,wParam,lParam
	ret
finWndProc:
	ret
WndProc endp
end