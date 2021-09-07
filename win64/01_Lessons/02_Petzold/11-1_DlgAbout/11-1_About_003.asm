option casemap:none
;Standard Includes and Libraries
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	include D:\bin\dev\ml64\include\gdi32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;Custom Includes
	include include\struct64_20.inc
	include include\Mem_03.inc
	include include\Call_02.inc
	include include\Spell_09.inc

WinMain PROTO :QWORD,:QWORD,:QWORD,:QWORD
WndProc PROTO :QWORD,:QWORD,:QWORD,:QWORD

.const
;Dialog Names
	IDM_ABOUT equ 1

.data
;Class Names
	szWndClass db "clsSDI64",0
;Window Captions
	szAppName db "About1",0
	szAppTitle db "About Box Demo Program",0
	szDlgTitle db "AboutBox",0
	
;Debug Messages
	szStackPointer db "rsp: 0000.0000.0000.0000h",0
;Error Messages
	szErrFrameHandle db "Failed to get the Main Window Handle",0
	szErrWinMain db "Error in WinMain",0

.data?
;Handles
	hInst dq ?
	hWnd dq ?
;Structures
	wndclass WNDCLASSEX64 <?>
	msg MSG64 <?>

.code
;=================================================================================
WinMain proc hInstance:QWORD, hPrevInstance:QWORD, szCmdLine:QWORD, iCmdShow:QWORD
;=================================================================================
;Align the Stack by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Get Application Handle
	Call1 GetModuleHandleA,0
	mov hInstance,rax
	cmp rax,0
	je errWinMain
;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
	mov wndclass.cbSize,50h ;dword ptr sizeof WNDCLASSEX64
	mov wndclass.style,3h ;CS_HREDRAW + CS_VREDRAW
	m64addr wndclass.lpfnWndProc,WndProc
	mov wndclass.cbClsExtra,0
	mov wndclass.cbWndExtra,0
	m64m64 wndclass.hInstance,hInstance
;Load Icon
	mov rcx,hInstance
	lea rdx,szAppName
	call LoadIconA
	mov wndclass.hIcon,rax
;Load Cursor
	Call2 LoadCursorA,0,7F00h ;hCursor = IDC_ARROW = 32512 =7F00h
	mov wndclass.hCursor,rax
;Load Brush
	Call1 GetStockObject,0 ;WHITE_BRUSH
	mov wndclass.hbrBackground,rax
;Fill up the rest of WNDCLASSEX64
	lea rax,szAppName
	mov wndclass.lpszMenuName,rax
	mov wndclass.lpszClassName,rax
	mov wndclass.hIconSm,0
;Now call the Function
	Call1 RegisterClassEx,offset wndclass
	cmp rax,0
	je errWinMain

;Create the Main Window
	xor rcx,rcx ;dwExStyle
	lea rdx,szAppName
	lea r8,szAppTitle
	mov r9,0CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW = 00CF.0000h
	mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+28h],rax ;y = ÑW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+40h],0 ;hWndParent 
	mov qword ptr [rsp+48h],0 ;hMenu
	m64m64 qword ptr [rsp+50h],hInstance
	mov qword ptr [rsp+58h],0 ;lpParam 
	call CreateWindowExA
;Store the Handle
	mov hWnd,rax
	cmp rax,0
	je errWndHandle

;Show and Update the Main Window
	Call2 ShowWindow,hWnd,1 ;nCmdShow = SW_SHOWNORMAL = 1
	Call1 UpdateWindow,hWnd

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
	Call1 ExitProcess,msg.wParam
WinMain endp

;===========================================================
WndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store Values retrieved by DispatchMessageA:
	mov hwnd,rcx
	mov iMsg,rdx
	mov wParam,r8
	mov lParam,r9
;Distributing with respect to uMsg
	cmp rdx,1 ;WM_CREATE = 0x0001
		je WndCreate
	cmp rdx,111h ;WM_COMMAND = 0x0111
		je WndCommand
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je WndDestroy
	jmp WndDef

WndCreate:
	nop
	jmp WndReturn0

WndCommand:
	cmp r8,IDM_ABOUT
		jmp WndAbout
	jmp WndReturn0

	WndAbout:
		mov rcx,hInst
		lea rdx,szDlgTitle
		mov r8,hwnd
		lea r9,DlgProc
		mov qword ptr [rsp+20h],0
		call DialogBoxParamA
		jmp WndReturn0

WndDestroy:
	Call1 PostQuitMessage,0
	xor rax,rax
	jmp WndReturn0

WndDef:
	Call4 DefWindowProc,hwnd,iMsg,wParam,lParam
	ret
WndReturn0:
	xor rax,rax
	ret
WndProc endp

;===========================================================
DlgProc proc hDlg:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store Values retrieved by DispatchMessageA:
	mov hDlg,rcx
	mov iMsg,rdx
	mov wParam,r8
	mov lParam,r9
;Distributing with respect to uMsg
	cmp rdx,110h ;WM_INITDIALOG = 0x0110
		je DlgReturn1
	cmp rdx,111h ;WM_COMMAND = 0x0111
		je DlgCommand
	jmp DlgReturn0

DlgInitDialog:
	jmp DlgReturn1

DlgCommand:
	cmp r8,1 ;IDOK = 1
		jmp DlgOK
	cmp r8,2 ;IDCANCEL = 2
		jmp DlgCancel
	jmp DlgReturn0

	DlgOK:
		Call2 EndDialog,hDlg,0
		jmp DlgReturn1

	DlgCancel:
		Call2 EndDialog,hDlg,0
		jmp DlgReturn1

DlgReturn1:
	mov rax,1
	ret
DlgReturn0:
	xor rax,rax
	ret
DlgProc endp
end