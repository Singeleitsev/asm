;������ ���������� ��� Win32 � �������������� ����
.386
locals	;��������� ���������� ��������� ����� � ���������
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
include windowA.inc	;���������� ���� � ���������� ������� �������� � �������� Win32
 include	menu.inc		;���������� ���� � ������������ ���� �����. ����
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	GetModuleHandleA:PROC
extrn	GetVersionExA:PROC
extrn	GetCommandLineA:PROC
extrn	GetEnvironmentStringsA:PROC
extrn	GetEnvironmentStringsA:PROC
extrn	GetStartupInfoA:PROC
extrn	LoadIconA:PROC
extrn	LoadCursorA:PROC
extrn	GetStockObject:PROC
extrn	RegisterClassExA:PROC
extrn	CreateWindowExA:PROC
extrn	ShowWindow:PROC
extrn	UpdateWindow:PROC
extrn	GetMessageA:PROC
extrn	TranslateMessage:PROC
extrn	DispatchMessageA:PROC
extrn	ExitProcess:PROC
extrn	PostQuitMessage:PROC
extrn	DefWindowProcA:PROC
extrn	PlaySoundA:PROC
extrn	ReleaseDC:PROC
extrn	TextOutA:PROC
extrn	GetDC:PROC
extrn	BeginPaint:PROC
extrn	EndPaint:PROC
extrn	MessageBoxA:PROC
extrn	DrawTextA:PROC
extrn	GetClientRect:PROC
;���������� ������� ������� �������� ������� �� ��������� ������� ���� 
public	WindowProc

.data
hwnd	dd	0
hInst	dd	0
;lpVersionInformation	OSVERSIONINFO	<?>
wcl	WNDCLASSEX	<?>
message	MSG	<?>
ps	PAINTSTRUCT	<?>
lpRect	RECT	<?>
szClassName	db	'���������� Win32',0
szTitleName	db	'��������� ���������� Win32 �� ����������',0
MesWindow	db	'������! ��, ��� ��� ������� ���������� ���������� �� ����������?'
MesWindowLen	=	$-MesWindow
playFileCreate	db	'create.wav',0
playFilePaint	db	'paint.wav',0
playFileDestroy	db	'destroy.wav',0

.code
start	proc	near
;����� ����� � ���������:
;������ ���������� ���� 
;����������������� ���� ������� ����� ��� ������������� ����������������, �� 
;��� �� �������� ������������� � ������ ���������
;����� BOOL GetVersionEx(
;	LPOSVERSIONINFO lpVersionInformation   // pointer to version information ;structure)
;	push	offset lpVersionInformation
;	call	GetVersionExA
;����� ����� �������� ��� ��� ������� ���������� � ������ Windows (���������� 11)
;����� LPTSTR GetCommandLine(VOID) - �������� ��������� �� ��������� ������
;	call	GetCommandLineA	;� �������� eax ����� (��������� � �������� ���)
;����� LPVOID GetEnvironmentStrings (VOID) - �������� ��������� �� ���� � ����������� ;���������
;	call	GetEnvironmentStringsA	;� �������� eax ����� (��������� � �������� ���)
;����� VOID GetStartupInfo(LPSTARTUPINFO lpStartupInfo)	;��������� �� ��������� STARTUPINFO
;	push	offset lpStartupInfo
;	call	GetStartupInfoA	
;(��������� � �������� ���)
;����� HMODULE GetModuleHandleA (LPCTSTR lpModuleName)
;lpModuleName address of module name to return handle 
	push	NULL	;0->GetModuleHandle
	call	GetModuleHandleA	; �������� �������� �������� ������ 
	mov	hInst,eax	; �� �������� �������� ������.
;����� hInst ����� �������������� � �������� ����������� ������� ����������
;����� ���������� ����

WinMain:
;���������� ����� ���� ATOM RegisterClassEx(CONST WNDCLASSEX *lpWndClassEx),
;			 ��� *lpWndClassEx - ����� ��������� WndClassEx
;��� ������ �������������� ���� ��������� WndClassEx
	mov	wcl.cbSize,type WNDCLASSEX	;������ ��������� � wcl.cbSize
	mov	wcl.style, CS_HREDRAW+CS_VREDRAW
	mov	wcl.lpfnWndProc,offset WindowProc	;����� ������� ���������
	mov	wcl.cbClsExtra,0
	mov	wcl.cbWndExtra,0
	mov	eax,hInst
;���������� ���������� � ���� hInstance ��������� wcl
	mov	wcl.hInstance,eax
;������� ����� HICON LoadIcon (HINSTANCE hInstance,LPCTSTR lpIconName)
	push	IDI_APPLICATION		;����������� ������
	push	0			;NULL
	call	LoadIconA
	mov	wcl.hIcon,eax	;���������� ������ � ���� hIcon ��������� wcl
;������� ����� HCURSOR LoadCursorA (HINSTANCE hInstance,LPCTSTR lpCursorName)
	push	IDC_ARROW	;����������� ������ - �������
	push	0
	call	LoadCursorA
	mov	wcl.hCursor,eax	;���������� ������� � ���� hCursor ��������� wcl
;��������� ���� ���� ���� - �����
;������� ����� HGDIOBJ GetStockObject(int fnObject)	;type of stock object
	push	WHITE_BRUSH
	call	GetStockObject
	mov	wcl.hbrBackground,eax
	mov	dword	ptr wcl.lpszMenuName,MYMENU
	mov	dword ptr wcl.lpszClassName,offset szClassName	;��� ������ ����
	mov	wcl.hIconSm,0
;������������ ����� ���� - ������� ����� RegisterClassExA (&wndclass)
	push	offset wcl
	call	RegisterClassExA
	test	ax,ax	;��������� �� ����� ����������� ������ ����
	jz	end_cycl_msg	;�������
;������� ����:
;������� ����� HWND CreateWindowExA(
;	DWORD dwExStyle,      // extended window style
;	LPCTSTR lpClassName,  // pointer to registered class name
;	LPCTSTR lpWindowName, // pointer to window name
;	DWORD dwStyle,        // window style
;	int x,                // horizontal position of window
;	int y,                // vertical position of window
;	int nWidth,           // window width
;	int nHeight,          // window height
;	HWND hWndParent,      // handle to parent or owner window
;	HMENU hMenu,          // handle to menu or child-window identifier
;	HANDLE hInstance,     // handle to application instance
;	LPVOID lpParam)       // pointer to window-creation data
	push	0	;lpParam
	push	hInst	;hInstance
	push	NULL	;menu
	push	NULL	;parent hwnd
	push	CW_USEDEFAULT	;������ ����
 	push	CW_USEDEFAULT	;������ ����
	push	CW_USEDEFAULT	;���������� y ������ �������� ���� ����
	push	CW_USEDEFAULT	;���������� x ������ �������� ����
	push	WS_OVERLAPPEDWINDOW	;����� ����
	push	offset szTitleName	;������ ��������� ����
	push	offset szClassName	;��� ������ ����
	push	NULL
	call	CreateWindowExA
	mov	hwnd,eax	;hwnd - ���������� ����
;�������� ����:
;������� ����� BOOL ShowWindow(
;	HWND hWnd,     // handle to window
;	int nCmdShow)  // show state of window
	push	SW_SHOWNORMAL
	push	hwnd
	call	ShowWindow
;�������������� ���������� ����
;������� ����� BOOL UpdateWindow(
;	HWND hWnd)   // handle of window
	push	hwnd
	call	UpdateWindow
;��������� ���� ���������:
;������� ����� BOOL GetMessageA(
;	LPMSG lpMsg,         // address of structure with message
;	HWND hWnd,           // handle of window
;	UINT wMsgFilterMin,  // first message
;	UINT wMsgFilterMax)   // last message
cycl_msg:
	push	0
	push	0
	push	NULL
	push	offset message
	call	GetMessageA
	cmp	ax,0
	je	end_cycl_msg
;���������� ����� � ����������
;������� ����� BOOL TranslateMessage(
;	CONST MSG *lpMsg   // address of structure with message);
	push	offset message
	call	TranslateMessage
;�������� ��������� ������� ���������
;������� ����� LONG DispatchMessage(CONST MSG *lpmsg)   // pointer to structure with message
	push	offset message
	call	DispatchMessageA
	jmp	cycl_msg
end_cycl_msg:

;����� �� ����������
;������� ����� VOID ExitProcess(UINT uExitCode)   // exit code for all threads
	push	NULL
	call	ExitProcess
start	endp

;-------------------WindowProc-----------------------------------------------
WindowProc	proc 
arg	@@hwnd:DWORD, @@mes:DWORD, @@wparam:DWORD, @@lparam:DWORD
uses ebx,edi, esi	;��� �������� ����������� ������ �����������
local	@@hdc:DWORD
	cmp	@@mes,WM_DESTROY
	je	wmdestroy
	cmp	@@mes,WM_CREATE
	je	wmcreate
	cmp	@@mes,WM_PAINT
	je	wmpaint
	cmp	@@mes,WM_COMMAND
 	je	wmcommand
	jmp	default
wmcreate:
;��������� �������� ���� �������� ��������
;������� ����� ������� BOOL PlaySound(
;				 LPCSTR pszSound,  
;				 HMODULE hmod,     
;				 DWORD fdwSound)
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFileCreate
	call	PlaySoundA
	mov	eax,0	;������������ �������� 0
	jmp	exit_wndproc
wmpaint:
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFilePaint
	call	PlaySoundA
;������� �������� ���������� HDC BeginPaint( HWND hwnd, // handle to window LPPAINTSTRUCT lpPaint // pointer to structure for paint information);
	push	offset	ps
	push	@@hwnd
	call	BeginPaint
	mov	@@hdc,eax
;������� ������ ������ � ���� BOOL TextOut(  
;	HDC hdc,           // handle to device context
;	int nXStart,       // x-coordinate of starting position
;	int nYStart,       // y-coordinate of starting position
;	LPCTSTR lpString,  // pointer to string
;	int cbString       // number of characters in string);	
	push	MesWindowLen	
	push	offset MesWindow
	push	100
	push	10
	push	@@hdc
	call	TextOutA
;���������� �������� BOOL EndPaint( 
;	HWND hWnd, // handle to window 
;	CONST PAINTSTRUCT *lpPaint // pointer to structure for paint data);
push	offset ps
push	@@hwnd
call	EndPaint
	mov	eax,0	;������������ �������� 0
	jmp	exit_wndproc
wmdestroy:
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFileDestroy
	call	PlaySoundA
;������� ��������� WM_QUIT
;������� ����� VOID PostQuitMessage(int nExitCode)   // exit code
	push	0
	call	PostQuitMessage
	mov	eax,0	;������������ �������� 0
	jmp	exit_wndproc
wmcommand:
;����� ��������� ��������� ��������� �� ����
;MenuProc (DWORD @@hwnd, DWORD @@wparam)
	push	@@wparam
	push	@@hwnd
	call	MenuProc
	jmp	exit_wndproc
default:
;��������� �� ���������
;������� ����� LRESULT DefWindowProc(
;	HWND hWnd,      // handle to window
;	UINT Msg,       // message identifier
;	WPARAM wParam,  // first message parameter
;	LPARAM lParam)  // second message parameter
	push	@@lparam
	push	@@wparam
	push	@@mes
	push	@@hwnd
	call	DefWindowProcA
	jmp exit_wndproc
;... ... ...
exit_wndproc:
	ret
WindowProc	endp
;-------------------MenuProc-----------------------------------------------
;��������� ��������� �� ����
MenuProc	proc 	
arg	@@hwnd:DWORD, @@wparam:DWORD
uses	ebx
local	@@hdc:DWORD	
	mov	ebx,@@wparam	;� bx ������������� ����
	cmp	bx,IDM_DRAWTEXT	
	je	@@idmdrawtext
	cmp	bx, IDM_TEXTOUT	
	je	@@idmtextout
	cmp	bx, IDM_LENGTH
	je	@@idmlength
	cmp	bx, IDM_RECTANGLE
	je	@@idmrectangle
	cmp	bx, IDM_PEACOCK
	je	@@idmpeacock
	cmp	bx, IDM_LACES
	je	@@idmlaces
	cmp	bx, IDM_ABOUT
	je	@@idmabout
	jmp	@@exit
@@idmdrawtext:
;������� �������� ���������� HDC GetDC(HWND hWnd   // handle to a window);
	push	@@hwnd
	call	GetDC
	mov	@@hdc,eax
;������� ������ ������� ������� BOOL GetClientRect(
;  HWND hWnd,      // handle to window
;  LPRECT lpRect   // address of structure for client coordinates);
	push	offset lpRect
	push	@@hwnd
	call	GetClientRect
;������� ������ ������ � ���� int DrawText(
;  HDC hDC,          // handle to device context
;  LPCTSTR lpString, // pointer to string to draw
;  int nCount,       // string length, in characters
;  LPRECT lpRect,    // pointer to struct with formatting dimensions
;  UINT uFormat      // text-drawing flags);
	push	DT_SINGLELINE+DT_BOTTOM
	push	offset lpRect
	push	-1
	push	offset @@TXT_DRAWTEXT
	push	@@hdc
	call	DrawTextA
;���������� �������� int ReleaseDC(
;  HWND hWnd,  // handle to window
;  HDC hDC     // handle to device context);
	push	@@hdc
	push	@@hwnd
	call	ReleaseDC
	jmp	@@exit
@@idmtextout:
	push	@@hwnd
	call	GetDC	;������� �������� ����������
	mov	@@hdc,eax
;������� ������ ������ � ���� BOOL TextOut(  
;	HDC hdc,           // handle to device context
;	int nXStart,       // x-coordinate of starting position
;	int nYStart,       // y-coordinate of starting position
;	LPCTSTR lpString,  // pointer to string
;	int cbString       // number of characters in string);	
	push	lenTXT_TEXTOUT
	push	offset @@TXT_TEXTOUT	
	push	150
	push	10
	push	@@hdc
	call	TextOutA
	push	@@hdc
	push	@@hwnd
	call	ReleaseDC	;��������� �������� ����������
	jmp	@@exit
@@idmlength:
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  @@TXT_LENGTH
	push	@@hwnd
	call	MessageBoxA
	jmp	@@exit
@@idmrectangle:
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  @@TXT_RECTANGLE
	push	@@hwnd
	call	MessageBoxA
	jmp	@@exit
@@idmpeacock:
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  @@TXT_PEACOCK
	push	@@hwnd
	call	MessageBoxA
	jmp	@@exit
@@idmlaces:
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  @@TXT_LACES
	push	@@hwnd
	call	MessageBoxA
	jmp	@@exit
@@idmabout:
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  @@TXT_ABOUT
	push	@@hwnd
	call	MessageBoxA
	jmp	@@exit
;... ... ...
@@exit:
	mov	eax,0
	ret
@@TXT_ABOUT		db	'IDM_ABOUT',0	
@@TXT_LACES	db	'IDM_LACES',0
 @@TXT_PEACOCK	db	'IDM_PEACOCK',0
@@TXT_RECTANGLE	db	'IDM_RECTANGLE',0
@@TXT_LENGTH	db	'IDM_LENGTH',0
@@TXT_TEXTOUT	db	'����� ������� �������� TEXTOUT'
lenTXT_TEXTOUT=$-@@TXT_TEXTOUT	
@@TXT_DRAWTEXT	db	'����� ������� �������� DRAWTEXT',0
MenuProc	endp
end	start