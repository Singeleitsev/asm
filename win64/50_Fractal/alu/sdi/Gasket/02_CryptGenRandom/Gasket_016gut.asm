option casemap:none

;Standard Includes and Libraries
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	include D:\bin\dev\ml64\include\gdi32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;Extended Includes and Libraries
	include D:\bin\dev\ml64\include\advapi32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\advapi32.lib
;Custom includes
	include include\struct64_20.inc
	include include\Mem_03.inc
	include include\Call_02.inc
;Functional Includes
	include CalcFract_006.inc

.const
;Window Properties
	szWndClass db "clsSDI64",0
	szAppTitle db "Cryptography Next Generation APIs",0

.data
;Window Handles
	hWndMain dq 0
;Cryptographic Handles and Buffer
	hProv dq 0 ;Stock Provider
	nRand dd 0 ;Generate Random DWORD
;Gasket Vertices
	x1 dq 0
	y1 dq 0
	x2 dq ? ;3C0h
	y2 dq 0
	x3 dq ? ;780h
	y3 dq 0
	x4 dq ? ;780h
	y4 dq ? ;21Ch
	x5 dq ? ;780h
	y5 dq ? ;438h
	x6 dq ? ;3C0h
	y6 dq ? ;438h
	x7 dq 0
	y7 dq ? ;438h
	x8 dq 0
	y8 dq ? ;21Ch
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
	;Get Cryptographic Context
		Call5 CryptAcquireContext,offset hProv,0,0,1,0 ;PROV_RSA_FULL = 1
	;Get Window Size (pixels)
		Call2 GetClientRect,hWnd,offset rect
	;Calculate Width
		xor rcx,rcx
		xor rdx,rdx
			mov ecx,rect.left
			mov edx,rect.right
		sub rdx,rcx ;Width
			mov x3,rdx
			mov x4,rdx
			mov x5,rdx
		shr edx,1 ;Width/2
			mov x2,rdx
			mov x6,rdx
	;Calculate Height
		xor rcx,rcx
		xor rdx,rdx
			mov ecx,rect.top
			mov edx,rect.bottom
		sub rdx,rcx ;Height
			mov y5,rdx
			mov y6,rdx
			mov y7,rdx
		shr edx,1 ;Height/2
			mov y4,rdx
			mov y8,rdx
	;Draw the Diagonal
		Call4 MoveToEx,hdc,x1,y1,0
		Call3 LineTo,hdc,x5,y5
		Call4 MoveToEx,hdc,x3,y3,0
		Call3 LineTo,hdc,x7,y7
		Call4 MoveToEx,hdc,x2,y2,0
		Call3 LineTo,hdc,x6,y6
		Call4 MoveToEx,hdc,x8,y8,0
		Call3 LineTo, hdc,x4,y4

	mov i,0FFFFFh
	NewPoint:
		;Generate Random Number
			Call3 CryptGenRandom,hProv,4,offset nRand ;dwLen = 4
		;Change Color
			mov eax,nRand
			mov Color,rax
		;Load Initial Coordinates
			mov rcx,x
			mov rdx,y
		;Select Vertex
			mov eax,nRand
			cmp eax,0A0000000h ;6*(Min Negative Integer)/8
				jl Shift1
			cmp eax,0C0000000h ;4*(Min Negative Integer)/8
				jl Shift2
			cmp eax,0E0000000h ;2*(Min Negative Integer)/8
				jl Shift3
			cmp eax,0FFFFFFFFh ;-1
				jle Shift4
			cmp eax,20000000h ;2*(Max Positive Integer)/8
				jl Shift5
			cmp eax,40000000h ;4*(Max Positive Integer)/8
				jl Shift6
			cmp eax,60000000h ;6*(Max Positive Integer)/8
				jl Shift7
			cmp eax,7FFFFFFFh ;Max Positive Integer
				jle Shift8
			jmp NewPoint ;If any other Values can Exist
		Shift1:
			CalcGasket x,y,x1,y1
			jmp Draw
		Shift2:
			CalcGasket x,y,x2,y2
			jmp Draw
		Shift3:
			CalcGasket x,y,x3,y3
			jmp Draw
		Shift4:
			CalcGasket x,y,x4,y4
			jmp Draw
		Shift5:
			CalcGasket x,y,x5,y5
			jmp Draw
		Shift6:
			CalcGasket x,y,x6,y6
			jmp Draw
		Shift7:
			CalcGasket x,y,x7,y7
			jmp Draw
		Shift8:
			CalcGasket x,y,x8,y8
			;jmp Draw
		Draw:
			Call4 SetPixel, hdc,x,y,Color
	;Check for Loop
		dec i
		cmp i,0
			ja NewPoint ;Loop

	;Release Cryptographic Context
		Call2 CryptReleaseContext,hProv,0
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