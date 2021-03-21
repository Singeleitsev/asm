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
	include CalcFract_005gut.inc

.const
;Window Properties
	szWndClass db "clsSDI64",0
	szAppTitle db "Cryptography Next Generation APIs",0
;Gasket Vertices
	x1 dq 0
	y1 dq 0
	x2 dq 100h
	y2 dq 0
	x3 dq 200h
	y3 dq 0
	x4 dq 200h
	y4 dq 100h
	x5 dq 200h
	y5 dq 200h
	x6 dq 100h
	y6 dq 200h
	x7 dq 0
	y7 dq 200h
	x8 dq 0
	y8 dq 100h

.data
;Window Handles
	hWndMain dq 0
;Device Context and Drawing Handles
	hDC dq 0
	memDC dq ?
;Cryptographic Handles and Buffer
	hProv dq 0 ;Stock Provider
	nRand dd 0 ;Generate Random DWORD
;Properties
	Color dq 0FFFFFFh ;White by Default
;Loop Counter
	i dd 0FFFFh ;65535 Points
;Debug Messages
	szText db "Generated Random Number: 0000.0000.0000.0000h",0

.data?
;System Metrics
	x_max dq ?
	y_max dq ?
;Current Point
	x dq ?
	y dq ?
;Structures
	wc WNDCLASSEX64 <?>
	msg MSG64 <?>
	ps PAINTSTRUCT64 <?>

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
	;Get Screen Size (pixels)
		Call1 GetSystemMetrics,0 ;SM_CXSCREEN = 0
		mov x_max,rax ;Width
		Call1 GetSystemMetrics,1 ;SM_CYSCREEN = 1
		mov y_max,rax ;Height
	;Get Device Context
		Call1 GetDC,hWnd
		mov hdc,rax
	;Get Compatible Device Context
		Call1 CreateCompatibleDC,hdc ;hdc is Local
		mov memDC,rax ;memDC is Global
	;Get the Handle to the Compatible Bitmap (DDB)
		Call3 CreateCompatibleBitmap,hdc,x_max,y_max
		mov hbit,rax
	;Select an Object into the specified Device Context (DC)
		Call2 SelectObject,memDC,hbit
	;Get the Gray Brush
		Call1 GetStockObject,2 ;GRAY_BRUSH
		mov hbrush,rax
	;Select an Object into the specified Device Context (DC)
		Call2 SelectObject,memDC,hbrush
	;Fill the Virtual Window with Gray Color
		mov rcx,memDC ;handle to device context
		xor rdx,rdx ;x-coord. of upper-left corner of rect. to be filled
		xor r8,r8 ;y-coord. of upper-left corner of rect. to be filled
		mov r9,x_max ;width of rectangle to be filled
		m64m64 qword ptr [rsp+20h],y_max ;height of rectangle to be filled
		mov qword ptr [rsp+28h],0F00021h ;raster operation code = dest = pattern = PATCOPY
		call PatBlt
	;Release Device Context
		Call2 ReleaseDC,hWnd,hdc
	jmp finWndProc

wmPaint:
	;Get Graphic Context
		Call2 BeginPaint,hWnd,offset ps
		mov hdc,rax
	;Get Cryptographic Context
		Call5 CryptAcquireContext,offset hProv,0,0,1,0 ;PROV_RSA_FULL = 1

	NewPoint:
		;Generate Random Number
			Call3 CryptGenRandom,hProv,4,offset nRand ;dwLen = 4
		;Load Initial Coordinates
			mov rcx,x
			mov rdx,y
		;Select Vertex
			mov eax,nRand
			cmp eax,10000000h ;(Max Positive Integer)/8
				jl Shift1
			cmp eax,20000000h ;2*(Max Positive Integer)/8
				jl Shift2
			cmp eax,30000000h ;3*(Max Positive Integer)/8
				jl Shift3
			cmp eax,40000000h ;4*(Max Positive Integer)/8
				jl Shift4
			cmp eax,50000000h ;5*(Max Positive Integer)/8
				jl Shift5
			cmp eax,60000000h ;6*(Max Positive Integer)/8
				jl Shift6
			cmp eax,70000000h ;7*(Max Positive Integer)/8
				jl Shift7
			cmp eax,7FFFFFFFh ;Max Positive Integer
				jle Shift8
			jmp NewPoint ;All Values with 31nd bit set to 1 are Negative
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
			Call4 SetPixel, memDC,x,y,Color
	;Check for Loop
		dec i
		cmp i,0
			ja NewPoint ;Loop

	;Release Cryptographic Context
		Call2 CryptReleaseContext,hProv,0
	;Transfer Virtual Bitmap to Real Window
		mov rcx,hdc ;handle to destination device context
		xor rdx,rdx ;x-coordinate of destination rectangle's upper-left corner
		xor r8,r8 ;y-coordinate of destination rectangle's upper-left corner
		mov r9,x_max ;width of destination rectangle
		m64m64 qword ptr [rsp+20h],y_max ;height of destination rectangle
		m64m64 qword ptr [rsp+28h],memDC ;handle to source device context
		mov qword ptr [rsp+30h],0 ;x-coord of source rectangle's upper-left corner
		mov qword ptr [rsp+38h],0 ;y-coord of source rectangle's upper-left corner
		mov qword ptr [rsp+40h],0CC0020h ;raster op. code = dest = source = SRCCOPY
		call BitBlt
	;Release Graphic Context
		Call2 EndPaint, hdc,offset ps
	jmp finWndProc
wmDestroy:
	;Delete Virtual Window
		mov rcx,memDC
		call DeleteDC
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