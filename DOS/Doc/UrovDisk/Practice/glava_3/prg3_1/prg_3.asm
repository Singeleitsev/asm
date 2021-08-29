;prg_3.asm
;������ ���������� ��� Win32 � �������������� ����, 
;���� ��������, �������� �������� ����������� ����������� ����,
;������������ ��������� ��������� ������ � �������� � 
;�������� ������������� ������������ � ������� � DLL-�����������
.486
locals	;��������� ���������� ��������� ����� (� ��������� @@) � ���������
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
include windowA.inc	;���������� ���� � ���������� ������� �������� � �������� Win32
include	prg_3.inc	;���������� ���� � ������������ ���� �����. ���� � �������
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
extrn	GetSystemMetrics:PROC
extrn	CreateCompatibleDC:PROC
extrn	CreateCompatibleBitmap:PROC
extrn	SelectObject:PROC
extrn	GetStockObject:PROC
extrn	PatBlt:PROC
extrn	BitBlt:PROC
extrn	InvalidateRect:PROC
extrn	DeleteDC:PROC
extrn	LineTo:PROC
extrn	Rectangle:PROC
extrn	MoveToEx:PROC
extrn	DialogBoxParamA:PROC
extrn	EndDialog:PROC
extrn	GetDlgItemTextA:PROC
extrn	Ellipse:PROC
;���������� ���������������� �������� (�� maket_dll.DLL)
extrn	DrawPattern_1:PROC
extrn	DrawPattern_2:PROC
;���������� ������� � ���������� ������� ���������, �������� �� ��������� ������� ���� 
public	WindowProc
public	DialogProc1
public	DialogProc2
.data
Xstart	dd	0,0	
Xend	dd	0,0	
Ystart	dd	0,0	
Yend	dd	0,0	
hwnd	dd	0
hInst	dd	0
memdc	dd	0	;!!!��� ���������� ����������
maxX	dd	0	;!!!��� ���������� ����������
maxY	dd	0	;!!!��� ���������� ����������
;lpVersionInformation	OSVERSIONINFO	<?>
wcl	WNDCLASSEX	<?>
message	MSG	<?>
ps	PAINTSTRUCT	<?>
lpRect	RECT	<?>
pt	POINT	<?>
szClassName	db	'���������� Win32',0
szTitleName	db	'���������� Win32 �� ����������',0
MesWindow	db	'������! ��, ��� ��� ������� ���������� ���������� �� ����������?'
MesWindowLen	=	$-MesWindow
;�������� �����
playFileCreate	db	'create.wav',0
playFilePaint	db	'paint.wav',0
playFileDestroy	db	'destroy.wav',0
;����� ��������:
lpmenu	db	"MYMENU",0
lpdlg1	db	"IDD_DIALOG1",0
lpdlg2	db	"IDD_DIALOG2",0
lpdlg3	db	"AboutBox",0
;���������� ��� ������� show_eax
eedx	dd	0
eecx	dd	0,0
template	db	'0123456789ABCDEF'
MesMsgBox	db	'������� (���������� eax):',0
;����������� �������� ��� ������ "������"
x1	dd	1
x2	dd	0
y2	dd	0
i30	dw	30
i90	dw	90
i100	dw	100
i120	dw	120
icenter	dd	100
icycl	dd	319
;����������� �������� ��� ������ "�������"
;N - ����� ������ ����������� ��������������,
;��� ����� ������ - ����������!!!
N	equ	18
Xc	equ	160
Yc	equ	100
masX	dd	N dup (0)
masY	dd	N dup (0)
iN	dw	N
R	dw	99
DTT	dd	0
t	dd	0
i	dd	0
j	dd	0
i2	dw	2
;����������� �������� ��� ������ "���� �� �����������"
p	dd	5	;������� �����
r	dd	60	;������ ����������
y_P	dd	140	;��������� y-���������� ������ ����������
x_P	dd	200	;��������� x-���������� ������ ����������
;�������� �����������
include	show_eax.inc	
sim4_to_EAXbin	macro	sim4:req
	local	m1
	push	eax
	push	ebx
	push	ecx
	mov	ebx,1
	mov	eax,sim4
	bswap	eax
	mov	sim4,0
	push	eax
	mov	ecx,4
m1:	and	eax,0fh
	imul	eax,ebx
	imul	ebx,10
	add	sim4,eax
	pop	eax
	shr	eax,8
	push	eax
	loop	m1
	pop	eax
 	pop	ecx
	pop	ebx
	pop	eax
	endm
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
;	call	GetCommandLineA	
;� �������� eax ����� (��������� � �������� ���)
;����� LPVOID GetEnvironmentStrings (VOID) - �������� ��������� �� ���� � ����������� ;���������
;	call	GetEnvironmentStringsA	
;� �������� eax ����� (��������� � �������� ���)
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
;��������� ���� ���� ���� - ����� (WHITE_BRUSH)
;������� ����� HGDIOBJ GetStockObject(int fnObject)	;type of stock object
	push	WHITE_BRUSH
	call	GetStockObject
	mov	wcl.hbrBackground,eax
	mov	dword	ptr wcl.lpszMenuName,offset lpmenu
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
uses ebx,edi,esi,ecx	;��� �������� ����������� ������ �����������
local	@@hdc:DWORD,@@hbrush:DWORD,@@hbit:DWORD
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
;�������� ���������� �����������, ������������ � ����� ����������
;������� ������ ������ � �������� int GetSystemMetrics(
;	int nIndex)   // system metric or configuration setting to retrieve
	push	SM_CXSCREEN
	call	GetSystemMetrics
	mov	maxX,eax
	push	SM_CYSCREEN
	call	GetSystemMetrics
	mov	maxY,eax
;�������� �������� ���������� ���� �� ������ @@hdc=GetDC(@@hwnd)
	push	@@hwnd
	call	GetDC
	mov	@@hdc,eax
;�������� ����������� �������� ���������� ������ 
;memdc=CreateCompatibleDC(@@hdc)
	push	@@hdc
	call	CreateCompatibleDC
	mov	memdc,eax	;!!! memdc - ���������� ����������
;�������� ���������� ���������� ����������� � ������
; @@hbit=CreateCompatibleBitmap(@@hdc,@@maxX,@@maxY)
	push	maxY
	push	maxX
	push	@@hdc
	call	CreateCompatibleBitmap
	mov	@@hbit,eax
;�������� ����� � �������� ������ SelectObject(memdc,@@hbit)
	push	@@hbit
	push	memdc
	call	SelectObject
;�������� ��������� ���������� ������ ����� ������
;������� ���������� ����� ����� hbrush=GetStockObject(GRAY_BRUSH)
	push	GRAY_BRUSH
	call	GetStockObject
	mov	@@hbrush,eax
;�������� ����� � �������� ������ SelectObject(memdc,@@hbrush)
	push	@@hbrush
	push	memdc
	call	SelectObject
;��������� ��������� ������ ����������� ����
;BOOL PatBlt(HDC hdc,     // handle to device context
;	int nXLeft,  // x-coord. of upper-left corner of rect. to be filled
;	int nYLeft,  // y-coord. of upper-left corner of rect. to be filled
;	int nWidth,  // width of rectangle to be filled
;	int nHeight, // height of rectangle to be filled
;	DWORD dwRop)  // raster operation code
	push	PATCOPY
	push	maxY
	push	maxX
	push	NULL
	push	NULL
	push	memdc
	call	PatBlt
;��������� �������� ���������� ReleaseDC(@@hwnd,@@hdc)
	push	@@hdc
	push	@@hwnd
	call	ReleaseDC
;��������� �������� ���� �������� ��������
;������� ����� ������� BOOL PlaySound(
;				 LPCSTR pszSound,  
;				 HMODULE hmod,     
;				 DWORD fdwSound)
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFileCreate
	call	PlaySoundA
;���������� �������� 0
	mov	eax,0	
	jmp	exit_wndproc
wmpaint:
;������� �������� ���������� HDC BeginPaint( HWND hwnd, // handle to window LPPAINTSTRUCT lpPaint // pointer to structure for paint information);
	push	offset	ps
	push	@@hwnd
	call	BeginPaint
	mov	@@hdc,eax
;��������� ����������� ���� �������� ��������
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFilePaint
	call	PlaySoundA
;������� ������ ������ � ���� BOOL TextOut(  
;	HDC hdc,           // handle to device context
;	int nXStart,       // x-coordinate of starting position
;	int nYStart,       // y-coordinate of starting position
;	LPCTSTR lpString,  // pointer to string
;	int cbString       // number of characters in string);	
	push	MesWindowLen	
	push	offset MesWindow
	push	300
	push	10
	push	memdc
	call	TextOutA
;����� ������������ ���� � �������� ����
;BOOL BitBlt(HDC hdcDest, // handle to destination device context
;	int nXDest,  // x-coordinate of destination rectangle's upper-left corner
;	int nYDest,  // y-coordinate of destination rectangle's upper-left corner
;	int nWidth,  // width of destination rectangle
;	int nHeight, // height of destination rectangle
;	HDC hdcSrc,  // handle to source device context
;	int nXSrc,   // x-coordinate of source rectangle's upper-left corner
;	int nYSrc,   // y-coordinate of source rectangle's upper-left corner
;	DWORD dwRop)  // raster operation code
	push	SRCCOPY
	push	NULL	
	push	NULL
	push	memdc
	push	maxY
	push	maxX
	push	NULL	
	push	NULL
	push	@@hdc
	call	BitBlt
;���������� �������� BOOL EndPaint( 
;	HWND hWnd, // handle to window 
;	CONST PAINTSTRUCT *lpPaint // pointer to structure for paint data);
	push	offset ps
	push	@@hwnd
	call	EndPaint
	mov	eax,0	;������������ �������� 0
	jmp	exit_wndproc
wmdestroy:
;������� ����������� ���� DeleteDC(memdc)
	push	memdc
	call	DeleteDC
;��������� ���������� ������ ���������� �������� ��������
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
	push	@@hbrush
	push	@@hdc
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
arg	@@hwnd:DWORD, @@wparam:DWORD,@@hdc:DWORD,@@hbrush:DWORD

uses	eax,ebx
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
	cmp	bx,IDM_DLL_LACES_1
	je	@@idmdlllaces_1
	cmp	bx,IDM_DLL_LACES_2
	je	@@idmdlllaces_2
	jmp	@@exit
@@idmdrawtext:
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
	push	memdc
	call	DrawTextA
;��������� ��������� WM_PAINT ��� ������ ������ �� �����
;BOOL InvalidateRect(HWND hWnd,  // handle of window with changed update region
;	CONST RECT *lpRect, address of rectangle coordinates
;	BOOL bErase) // erase-background flag
	push	1
	push	NULL
	push	@@hwnd
	call	InvalidateRect

	jmp	@@exit
@@idmtextout:
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
	push	memdc
	call	TextOutA
;��������� ��������� WM_PAINT ��� ������ ������ �� �����
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	jmp	@@exit
@@idmlength:
;�������� ���������� ���� int DialogBoxParam(HINSTANCE hInstance,  // handle to application instance
;  LPCTSTR lpTemplateName,  // identifies dialog box template
;  HWND hWndParent,      // handle to owner window
;  DLGPROC lpDialogFunc, // pointer to dialog box procedure
;  LPARAM dwInitParam)    // initialization value
	push	0
	push	offset DialogProc1
	push	@@hwnd
	push	offset lpdlg1	
	push	hInst	
	call	DialogBoxParamA
;���������� ������� ����� BOOL MoveToEx(
;  HDC hdc,          // handle to device context
;  int X,            // x-coordinate of new current position
;  int Y,            // y-coordinate of new current position
;  LPPOINT lpPoint)   // pointer to old current position
	push	NULL	;offset	pt
	push	Ystart
	push	Xstart
	push	memdc
	call	MoveToEx

;����� ����� BOOL LineTo(HDC hdc,    // device context handle
;  int nXEnd,  // x-coordinate of line's ending point
;  int nYEnd)   // y-coordinate of line's ending point
	push	Yend
	push	Xend
	push	memdc
	call	LineTo

;��������� ��������� WM_PAINT ��� ������ ������ �� �����
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	jmp	@@exit
@@idmrectangle:
;�������� ���������� ���� 
	push	0
	push	offset DialogProc2
	push	@@hwnd
	push	offset lpdlg2
	push	hInst	
	call	DialogBoxParamA
;����� �������������� BOOL Rectangle(HDC hdc,	// handle to device context
;  int nLeftRect,   // x-coord of bounding rectangle's upper-left corner
;  int nTopRect,    // y-coord of bounding rectangle's upper-left corner
;  int nRightRect,  // x-coord of bounding rectangle's lower-right corner
;  int nBottomRect);  // y-coord of bounding rectangle's lower-right corner
	push	Ystart
	pop	eax
	push	eax
	show_eax	
	push	Xstart
	pop	eax
	push	eax
	show_eax
	push	Yend
	pop	eax
	push	eax
	show_eax
	push	Xend		
	pop	eax
	push	eax
	show_eax
	push	memdc
	call	Rectangle
;��������� ��������� WM_PAINT ��� ������ ������ �� �����
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	jmp	@@exit
@@idmpeacock:	;"������"
;������� ����
;�������� ��������� ���������� ������ ����� ������
;������� ���������� ����� ����� hbrush=GetStockObject(GRAY_BRUSH)
	push	GRAY_BRUSH
	call	GetStockObject
	mov	@@hbrush,eax
;�������� ����� � �������� ������ SelectObject(memdc,@@hbrush)
	push	@@hbrush
	push	memdc
	call	SelectObject
;��������� ��������� ������ ����������� ����
;BOOL PatBlt(HDC hdc,     // handle to device context
;	int nXLeft,  // x-coord. of upper-left corner of rect. to be filled
;	int nYLeft,  // y-coord. of upper-left corner of rect. to be filled
;	int nWidth,  // width of rectangle to be filled
;	int nHeight, // height of rectangle to be filled
;	DWORD dwRop)  // raster operation code
	push	PATCOPY
	push	maxY
	push	maxX
	push	NULL
	push	NULL
	push	memdc
	call	PatBlt

	mov	ecx,icycl
	push	ecx
		
@@m1:	
	finit
;�������� x2=120+100*sin(x1/30)
	pop	ecx
	mov	x1,ecx
	cmp	ecx,0	
	je	@@m2
	dec	ecx
	push	ecx
	fild	x1
	fidiv	i30
	fsin
	fimul	i100
	fiadd	i120
	fistp	x2
;�������� y2=120+100*cos(x1/30)
	fild	x1
	fidiv	i30
	fcos
	fimul	i100
	fiadd	i90
	fistp	y2
;������ �������:
	push	NULL
	push	icenter
	push	x1
	push	memdc
	call	MoveToEx
	push	y2
	push	x2
	push	memdc
	call	LineTo
;��������� ��������� WM_PAINT ��� ������ ������ �� �����
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	jmp	@@m1
@@m2:	
	jmp	@@exit
@@idmlaces:	;"�������"
;������� ����
;�������� ��������� ���������� ������ ����� ������
;������� ���������� ����� ����� hbrush=GetStockObject(GRAY_BRUSH)
	push	GRAY_BRUSH
	call	GetStockObject
	mov	@@hbrush,eax
;�������� ����� � �������� ������ SelectObject(memdc,@@hbrush)
	push	@@hbrush
	push	memdc
	call	SelectObject
;��������� ��������� ������ ����������� ����
;BOOL PatBlt(HDC hdc,     // handle to device context
;	int nXLeft,  // x-coord. of upper-left corner of rect. to be filled
;	int nYLeft,  // y-coord. of upper-left corner of rect. to be filled
;	int nWidth,  // width of rectangle to be filled
;	int nHeight, // height of rectangle to be filled
;	DWORD dwRop)  // raster operation code
	push	PATCOPY
	push	maxY
	push	maxX
	push	NULL
	push	NULL
	push	memdc
	call	PatBlt
;�������� DTT=2*��/N
	finit
	fldpi
	fidiv	iN
	fimul	i2
	fistp	DTT
	mov	t,0
	mov	i,0
;��������� ������� masX � masY ������������ ������ ��������������
@@m3:	
	mov	eax,i
	add	eax,DTT
	mov	t,eax
	
	fild	t
	fcos	
	fimul	R
	mov	esi,i
	fistp	masX[esi*4]
	add	masX[esi*4],Xc

	fild	t
	fsin	
	fimul	R
	fistp	masY[esi*4]
	mov	eax,Yc
	sub	eax,masY[esi*4]
	mov	masY[esi*4],eax

	inc	i
	cmp	i,N
	jl	@@m3
;�������� ������� ��������������:
	mov	i,0
@@m5:
	mov	eax,i
	mov	j,eax
@@m4:	inc	j	
;������ �������:
	push	NULL
	mov	esi,i
	push	masY[esi*4]
	push	masX[esi*4]
	push	memdc
	call	MoveToEx
	mov	edi,j
	push	masY[edi*4]
	push	masX[edi*4]
	push	memdc
	call	LineTo
	cmp	j,N
	jl	@@m4
	inc	i
	cmp	i,N
	jl	@@m5
;��������� ��������� WM_PAINT ��� ������ ������ �� �����
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect	

	jmp	@@exit
@@idmdlllaces_1:
;������ ���� �� �����������. ����������� ������� ��� ��������� ��������� � DLL-����������:
;DrawPattern_1(hwnd,hdc,x,y,r,p) - ������� �� �������� � ���������� �����������;
;��� ������ ������� ����
;�������� ��������� ���������� ������ ����� ������
;������� ���������� ����� ����� hbrush=GetStockObject(GRAY_BRUSH)
	push	GRAY_BRUSH
	call	GetStockObject
	mov	@@hbrush,eax
;�������� ����� � �������� ������ SelectObject(memdc,@@hbrush)
	push	@@hbrush
	push	memdc
	call	SelectObject
;��������� ��������� ������ ����������� ����
;BOOL PatBlt(HDC hdc,     // handle to device context
;	int nXLeft,  // x-coord. of upper-left corner of rect. to be filled
;	int nYLeft,  // y-coord. of upper-left corner of rect. to be filled
;	int nWidth,  // width of rectangle to be filled
;	int nHeight, // height of rectangle to be filled
;	DWORD dwRop)  // raster operation code
	push	PATCOPY
	push	maxY
	push	maxX
	push	NULL
	push	NULL
	push	memdc
	call	PatBlt
;������ ����� ��������:
;DrawPattern_1(hwnd,hdc,x,y,r,p);
	push	p	;������� �����
	push	r	;������ ����������
	push	y_P	;y-���������� ������ ����������
	push	x_P	;x-���������� ������ ����������
	push	memdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_1
	jmp	@@exit
@@idmdlllaces_2:
;������ ���� �� �����������. ����������� ������� ��� ��������� ��������� � DLL-����������:
;DrawPattern_2(hwnd,hdc,x,y,r,p) - ������� �������� � ���������� �����������;
;��� ������ ������� ����
;�������� ��������� ���������� ������ ����� ������
;������� ���������� ����� ����� hbrush=GetStockObject(GRAY_BRUSH)
	push	GRAY_BRUSH
	call	GetStockObject
	mov	@@hbrush,eax
;�������� ����� � �������� ������ SelectObject(memdc,@@hbrush)
	push	@@hbrush
	push	memdc
	call	SelectObject
;��������� ��������� ������ ����������� ����
;BOOL PatBlt(HDC hdc,     // handle to device context
;	int nXLeft,  // x-coord. of upper-left corner of rect. to be filled
;	int nYLeft,  // y-coord. of upper-left corner of rect. to be filled
;	int nWidth,  // width of rectangle to be filled
;	int nHeight, // height of rectangle to be filled
;	DWORD dwRop)  // raster operation code
	push	PATCOPY
	push	maxY
	push	maxX
	push	NULL
	push	NULL
	push	memdc
	call	PatBlt
;������ ����� ��������:
;DrawPattern_2(hwnd,hdc,x,y,r,p);
	push	p	;������� �����
	push	r	;������ ����������
	push	y_P	;y-���������� ������ ����������
	push	x_P	;x-���������� ������ ����������
	push	memdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_2
;��������� ��������� WM_PAINT ��� ������ ����������� �� �����
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	jmp	@@exit
@@idmabout:
;�������� ���������� ���� 
	push	0
	push	offset AboutDialog
	push	@@hwnd
	push	offset lpdlg3
	push	hInst	
	call	DialogBoxParamA
	jmp	@@exit
;... ... ...
@@exit:
	mov	eax,0
	ret
@@TXT_TEXTOUT	db	'����� ������� �������� TEXTOUT'
lenTXT_TEXTOUT=$-@@TXT_TEXTOUT	
@@TXT_DRAWTEXT	db	'����� ������� �������� DRAWTEXT',0
MenuProc	endp
;-----------------DialogProc1-----------------------------------------
DialogProc1	proc 	
arg	@@hdlg:DWORD, @@message:DWORD, @@wparam:DWORD, @@lparam:DWORD
uses	eax,ebx,edi,esi
	mov	eax,@@message
	cmp	ax,WM_INITDIALOG
	je	@@wminitdialog
	cmp	ax,WM_COMMAND
	jne	@@exit_false
	mov	ebx,@@wparam	;� bx ������������� �������� ����������
	cmp	bx,IDOK	
	je	@@idok
	cmp	bx, IDCANCEL
	je	@@idcancel
	jmp	@@exit_false
@@wminitdialog:
	jmp	@@exit_true
@@idok:
;��������� Xstart UINT GetDlgItemText(  HWND hDlg,       // handle of dialog box
;  int nIDDlgItem,  // identifier of control
;  LPTSTR lpString, // address of buffer for text
;  int nMaxCount    // maximum size of string);
	push	5
	push	offset Xstart
	push	IDC_EDIT1
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Xstart
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Xstart	
;��������� Ystart 
	push	5
	push	offset Ystart
	push	IDC_EDIT2
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Ystart
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Ystart	
;��������� Xend
	push	5
	push	offset Xend
	push	IDC_EDIT3
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Xend
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Xend		
;��������� Yend
	push	5
	push	offset Yend
	push	IDC_EDIT4
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Yend
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Yend		
	push	0
	push	@@hdlg
	call	EndDialog
	jmp	@@exit_true	
@@idcancel:
	push	NULL
	push	@@hdlg
	call	EndDialog
	jmp	@@exit_true
@@exit_false:
	mov	eax,0
	ret
@@exit_true:
	mov	eax,1
	ret
DialogProc1	endp
;-----------------DialogProc2-----------------------------------------
DialogProc2	proc 	
arg	@@hdlg:DWORD, @@message:DWORD, @@wparam:DWORD, @@lparam:DWORD
uses	eax,ebx,edi,esi
	mov	eax,@@message
	cmp	ax,WM_INITDIALOG
	je	@@wminitdialog
	cmp	ax,WM_COMMAND
	jne	@@exit_false
	mov	ebx,@@wparam	;� bx ������������� �������� ����������
	cmp	bx,IDOK	
	je	@@idok
	cmp	bx, IDCANCEL
	je	@@idcancel
	jmp	@@exit_false
@@wminitdialog:
	jmp	@@exit_true
@@idok:
;��������� Xstart UINT GetDlgItemText(  HWND hDlg,       // handle of dialog box
;  int nIDDlgItem,  // identifier of control
;  LPTSTR lpString, // address of buffer for text
;  int nMaxCount    // maximum size of string);
	push	5
	push	offset Xstart
	push	IDC_EDIT1
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Xstart
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Xstart	
;��������� Ystart 
	push	5
	push	offset Ystart
	push	IDC_EDIT2
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Ystart
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Ystart
;��������� Xend
	push	5
	push	offset Xend
	push	IDC_EDIT3
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Xend
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Xend
;��������� Yend
	push	5
	push	offset Yend
	push	IDC_EDIT4
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Yend
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Yend
	push	NULL
	push	@@hdlg
	call	EndDialog
	jmp	@@exit_true	
@@idcancel:
	push	NULL
	push	@@hdlg
	call	EndDialog
	jmp	@@exit_true
@@exit_false:
	mov	eax,0
	ret
@@exit_true:
	mov	eax,1
	ret
DialogProc2	endp
;-----------------AboutDialog-----------------------------------------
AboutDialog	proc 	
arg	@@hdlg:DWORD, @@message:DWORD, @@wparam:DWORD, @@lparam:DWORD
uses	eax,ebx,edi,esi
	mov	eax,@@message
	cmp	ax,WM_INITDIALOG
	je	@@wminitdialog
	cmp	ax,WM_COMMAND
	jne	@@exit_false
	mov	ebx,@@wparam	;� bx ������������� �������� ����������
	cmp	bx,IDOK	
	je	@@idok
	jmp	@@exit_false
@@wminitdialog:
	jmp	@@exit_true
@@idok:
	push	NULL
	push	@@hdlg
	call	EndDialog
	jmp	@@exit_true
@@exit_false:
	mov	eax,0
	ret
@@exit_true:
	mov	eax,1
	ret
AboutDialog	endp
end	start