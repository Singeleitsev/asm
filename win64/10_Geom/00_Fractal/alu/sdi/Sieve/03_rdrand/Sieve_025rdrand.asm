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
	szAppTitle db "Sierpinski Sieve built with RDRAND instruction",0

.data
;Window Handles
	hWndMain dq 0
;Triangle Vertices
	x0 dq ? ;w/2 = 3C0h
	y0 dq 0
	x1 dq 0
	y1 dq ? ;h = 438h
	x2 dq ? ;w = 780h
	y2 dq ? ;h = 438h
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
	mov qword ptr [rsp+28h],rax ;y = �W_USEDEFAULT = 8000.0000h
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
		shr edx,1 ;Width/2
			mov x0,rdx
	;Calculate Height
		xor rcx,rcx
		xor rdx,rdx
			mov ecx,rect.top
			mov edx,rect.bottom
		sub rdx,rcx ;Height
			mov y1,rdx
			mov y2,rdx

	mov i,0FFFFFh
	NewPoint:
		;Generate Random Number
			rdrand r10
		;Change Color
			mov Color,r10
		;Select Vertex
			lea r8,x0 ;r8 = x0
			lea r9,y0 ;r9 = y0
			cmp r10d,0D5555555h ;(Min Negative Integer)/3
				jle Draw
			add r8,10h ;r8 = x1
			add r9,10h ;r9 = y1
			cmp r10d,02AAAAAAAh ;(Max Positive Integer)/3
				jle Draw
			add r8,10h ;r8 = x2
			add r9,10h ;r9 = y2
			;cmp r10d,07FFFFFFFh ;Max Positive Integer
				;jle Draw
		Draw:
			;x = (x + x_A)/2
				mov rax,x
				add rax,[r8]	;x = x + x_A
				shr rax,1	;x = x/2
				mov x,rax	;Store x
			;y = (y + y_A)/2
				mov rax,y
				add rax,[r9]	;y = y + y_A
				shr rax,1	;y = y/2
				mov y,rax	;Store y
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