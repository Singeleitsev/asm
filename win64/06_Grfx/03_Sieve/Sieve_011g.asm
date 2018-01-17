option casemap:none

;Standard Includes and Libraries
	include D:\bin\dev\ml64\VS2015\include\user32.inc
	include D:\bin\dev\ml64\VS2015\include\kernel32.inc
	include D:\bin\dev\ml64\VS2015\include\gdi32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;ExtendedIncludes and Libraries
	include include\advapi32.inc
	includelib include\advapi32.lib
;Custom includes
	include include\struct64_20.inc
	include include\Spell_09.inc
	include include\Mem_03.inc
	include include\Call_02.inc

.const
;Window Properties
	szWndClass db "clsSDI64",0
	szAppTitle db "Cryptography Next Generation APIs",0
;Triangle Vertices
	x1 dq 780h
	y1 dq 280h
	x2 dq 0
	y2 dq 280h
	x3 dq 3C0h
	y3 dq 0
;Info Messages
	szDone db 'Calculation Completed!',0

.data
;Window Handles
	hWndMain dq 0
;Device Context and Drawing Handles
	hDC dq 0
;Cryptographic Handles and Buffer
	hProv dq 0
	Buffer dq 0
	dwLen=$-Buffer
;Properties
	Color dq 0 ;Black by Default
;Loop Counter
	i db 0FFh ;65535 Points
;Debug Messages
	szText db "Generated Random Number: 0000.0000.0000.0000h",0

.data?
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
	cmp rdx,0Fh ;WM_PAINT = 0x000F
		je wmPaint
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmDestroy
	jmp defWndProc

wmCreate:
	nop
	jmp finWndProc

wmPaint:
	mov r8,x
	mov r9,y

	;Get Cryptographic Context
		Call5 CryptAcquireContext,offset hProv,0,0,1,0 ;PROV_RSA_FULL = 1
	;Generate Random Number
		Call3 CryptGenRandom,hProv,dwLen,offset Buffer
		mov rax,Buffer
	;Show Message
		Spell64rax 0,szAppTitle,szText
	;Release Cryptographic Context
		Call2 CryptReleaseContext,hProv,0

	;Chaos Game
		cmp eax,0AAAAAAAAh ;2*0FFFFFFFFh/3
			jg Shift3
		cmp eax,55555555h ;0FFFFFFFF/3
			jg Shift2
		;jmp Shift1

	;Shift1:
		add r8,x1
		shr r8,1
		mov x,r8
		add r9,y1
		shr r9,1
		mov y,r9
		jmp Draw
	Shift2:
		add r8,x2
		shr r8,1
		mov x,r8
		add r9,y2
		shr r9,1
		mov y,r9
		jmp Draw
	Shift3:
		add r8,x3
		shr r8,1
		mov x,r8
		add r9,y3
		shr r9,1
		mov y,r9
		;jmp Draw
	Draw:
	;Get Graphic Context
		Call2 BeginPaint,hWnd,offset ps
		mov hDC,rax
	;Draw Point
		Call4 SetPixel, hDC,x,y,Color
	;Release Graphic Context
		Call2 EndPaint, hWnd,offset ps
	dec i
	cmp i,0
		jg wmPaint ;Loop
	;Show Message
		Call4 MessageBoxA,0,offset szDone,offset szAppTitle,40h
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