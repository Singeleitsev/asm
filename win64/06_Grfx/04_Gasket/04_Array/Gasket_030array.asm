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
;Window Properties
	szWndClass db "clsSDI64",0
	szAppTitle db "Sierpinski Gasket Built with RDRAND instruction",0

.data
;Window Handles
	hWndMain dq 0
;Gasket Vertices
	A dq 10h dup (0)
;Properties
	Color dq 0FFFFFFh ;White by Default

.data?
;Current Point
	P dq ?,?
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
	mov wc.cbSize,50h ;dword ptr sizeof WNDCLASSEx54
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
LOCAL hdc:QWORD, hbrush:QWORD
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
			mov [A+20h],rdx	;x2 = w
			mov [A+30h],rdx	;x3 = w
			mov [A+40h],rdx	;x4 = w
		shr edx,1 ;Width/2
			mov [A+10h],rdx	;x1 = w/2
			mov [A+50h],rdx	;x5 = w/2
	;Calculate Height
		xor rcx,rcx
		xor rdx,rdx
			mov ecx,rect.top
			mov edx,rect.bottom
		sub rdx,rcx ;Height
			mov [A+48h],rdx	;y4 = h
			mov [A+58h],rdx	;y5 = h
			mov [A+68h],rdx	;y6 = h
		shr edx,1 ;Height/2
			mov [A+38h],rdx	;y3 = h/2
			mov [A+78h],rdx	;y7 = h/2

	;The Core
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
			lea r8,[A+0]
			add r8,r10
			lea r9,[A+8]
			add r9,r10
		;Calculate coordinates
			;x = (x + 2*x_A) / 3
				xor rdx,rdx	;Dividend
				mov rcx,3	;Divisor
				mov rax,[P+0]
				add rax,[r8]	;x = x + x_A
				add rax,[r8]	;x = x + x_A
				div ecx		;x = x/3
				mov [P+0],rax	;Store x
			;y = (y + 2*y_A) / 3
				xor rdx,rdx	;Dividend
				mov rcx,3	;Divisor
				mov rax,[P+8]
				add rax,[r9]	;y = y + y_A
				add rax,[r9]	;y = y + y_A
				div ecx		;y = y/3
				mov [P+8],rax	;Store y
		;Draw
			Call4 SetPixel, hdc,[P+0],[P+8],Color
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