;Пример приложения для Win32 с использованием меню
.386
locals	;разрешает применение локальных меток в программе
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
include windowA.inc	;включаемый файл с описаниями базовых структур и констант Win32
 include	menu.inc		;включаемый файл с определением имен идент. меню
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
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
;объявление оконной функции объектом видимым за пределами данного кода 
public	WindowProc

.data
hwnd	dd	0
hInst	dd	0
;lpVersionInformation	OSVERSIONINFO	<?>
wcl	WNDCLASSEX	<?>
message	MSG	<?>
ps	PAINTSTRUCT	<?>
lpRect	RECT	<?>
szClassName	db	'Приложение Win32',0
szTitleName	db	'Каркасное приложение Win32 на ассемблере',0
MesWindow	db	'Привет! Ну, как вам процесс разработки приложения на ассемблере?'
MesWindowLen	=	$-MesWindow
playFileCreate	db	'create.wav',0
playFilePaint	db	'paint.wav',0
playFileDestroy	db	'destroy.wav',0

.code
start	proc	near
;точка входа в программу:
;начало стартового кода 
;закоментированные ниже функции можно при необходимости раскоментировать, но 
;они не являются обязательными в данной программе
;вызов BOOL GetVersionEx(
;	LPOSVERSIONINFO lpVersionInformation   // pointer to version information ;structure)
;	push	offset lpVersionInformation
;	call	GetVersionExA
;далее можно вставить код для анализа информации о версии Windows (Приложение 11)
;вызов LPTSTR GetCommandLine(VOID) - получить указатель на командную строку
;	call	GetCommandLineA	;в регистре eax адрес (проверить и вставить код)
;вызов LPVOID GetEnvironmentStrings (VOID) - получить указатель на блок с переменными ;окружения
;	call	GetEnvironmentStringsA	;в регистре eax адрес (проверить и вставить код)
;вызов VOID GetStartupInfo(LPSTARTUPINFO lpStartupInfo)	;указатель на структуру STARTUPINFO
;	push	offset lpStartupInfo
;	call	GetStartupInfoA	
;(проверить и вставить код)
;вызов HMODULE GetModuleHandleA (LPCTSTR lpModuleName)
;lpModuleName address of module name to return handle 
	push	NULL	;0->GetModuleHandle
	call	GetModuleHandleA	; получить значение базового адреса 
	mov	hInst,eax	; по которому загружен модуль.
;далее hInst будет использоваться в качестве дескриптора данного приложения
;конец стартового кода

WinMain:
;определить класс окна ATOM RegisterClassEx(CONST WNDCLASSEX *lpWndClassEx),
;			 где *lpWndClassEx - адрес структуры WndClassEx
;для начала инициализируем поля структуры WndClassEx
	mov	wcl.cbSize,type WNDCLASSEX	;размер структуры в wcl.cbSize
	mov	wcl.style, CS_HREDRAW+CS_VREDRAW
	mov	wcl.lpfnWndProc,offset WindowProc	;адрес оконной процедуры
	mov	wcl.cbClsExtra,0
	mov	wcl.cbWndExtra,0
	mov	eax,hInst
;дескриптор приложения в поле hInstance структуры wcl
	mov	wcl.hInstance,eax
;готовим вызов HICON LoadIcon (HINSTANCE hInstance,LPCTSTR lpIconName)
	push	IDI_APPLICATION		;стандартная иконка
	push	0			;NULL
	call	LoadIconA
	mov	wcl.hIcon,eax	;дескриптор иконки в поле hIcon структуры wcl
;готовим вызов HCURSOR LoadCursorA (HINSTANCE hInstance,LPCTSTR lpCursorName)
	push	IDC_ARROW	;стандартный курсор - стрелка
	push	0
	call	LoadCursorA
	mov	wcl.hCursor,eax	;дескриптор курсора в поле hCursor структуры wcl
;определим цвет фона окна - белый
;готовим вызов HGDIOBJ GetStockObject(int fnObject)	;type of stock object
	push	WHITE_BRUSH
	call	GetStockObject
	mov	wcl.hbrBackground,eax
	mov	dword	ptr wcl.lpszMenuName,MYMENU
	mov	dword ptr wcl.lpszClassName,offset szClassName	;имя класса окна
	mov	wcl.hIconSm,0
;регистрируем класс окна - готовим вызов RegisterClassExA (&wndclass)
	push	offset wcl
	call	RegisterClassExA
	test	ax,ax	;проверить на успех регистрации класса окна
	jz	end_cycl_msg	;неудача
;создаем окно:
;готовим вызов HWND CreateWindowExA(
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
	push	CW_USEDEFAULT	;высота окна
 	push	CW_USEDEFAULT	;ширина окна
	push	CW_USEDEFAULT	;координата y левого верхнего угла окна
	push	CW_USEDEFAULT	;координата x левого верхнего угла
	push	WS_OVERLAPPEDWINDOW	;стиль окна
	push	offset szTitleName	;Строка заголовка окна
	push	offset szClassName	;имя класса окна
	push	NULL
	call	CreateWindowExA
	mov	hwnd,eax	;hwnd - дескриптор окна
;показать окно:
;готовим вызов BOOL ShowWindow(
;	HWND hWnd,     // handle to window
;	int nCmdShow)  // show state of window
	push	SW_SHOWNORMAL
	push	hwnd
	call	ShowWindow
;перерисовываем содержимое окна
;готовим вызов BOOL UpdateWindow(
;	HWND hWnd)   // handle of window
	push	hwnd
	call	UpdateWindow
;запускаем цикл сообщений:
;готовим вызов BOOL GetMessageA(
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
;трансляция ввода с клавиатуры
;готовим вызов BOOL TranslateMessage(
;	CONST MSG *lpMsg   // address of structure with message);
	push	offset message
	call	TranslateMessage
;отправим сообщение оконной процедуре
;готовим вызов LONG DispatchMessage(CONST MSG *lpmsg)   // pointer to structure with message
	push	offset message
	call	DispatchMessageA
	jmp	cycl_msg
end_cycl_msg:

;выход из приложения
;готовим вызов VOID ExitProcess(UINT uExitCode)   // exit code for all threads
	push	NULL
	call	ExitProcess
start	endp

;-------------------WindowProc-----------------------------------------------
WindowProc	proc 
arg	@@hwnd:DWORD, @@mes:DWORD, @@wparam:DWORD, @@lparam:DWORD
uses ebx,edi, esi	;эти регистры обязательно должны сохраняться
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
;обозначим создание окна звуковым эффектом
;готовим вызов функции BOOL PlaySound(
;				 LPCSTR pszSound,  
;				 HMODULE hmod,     
;				 DWORD fdwSound)
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFileCreate
	call	PlaySoundA
	mov	eax,0	;возвращаемое значение 0
	jmp	exit_wndproc
wmpaint:
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFilePaint
	call	PlaySoundA
;получим контекст устройства HDC BeginPaint( HWND hwnd, // handle to window LPPAINTSTRUCT lpPaint // pointer to structure for paint information);
	push	offset	ps
	push	@@hwnd
	call	BeginPaint
	mov	@@hdc,eax
;выведем строку текста в окно BOOL TextOut(  
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
;освободить контекст BOOL EndPaint( 
;	HWND hWnd, // handle to window 
;	CONST PAINTSTRUCT *lpPaint // pointer to structure for paint data);
push	offset ps
push	@@hwnd
call	EndPaint
	mov	eax,0	;возвращаемое значение 0
	jmp	exit_wndproc
wmdestroy:
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFileDestroy
	call	PlaySoundA
;послать сообщение WM_QUIT
;готовим вызов VOID PostQuitMessage(int nExitCode)   // exit code
	push	0
	call	PostQuitMessage
	mov	eax,0	;возвращаемое значение 0
	jmp	exit_wndproc
wmcommand:
;вызов процедуры обработки сообщений от меню
;MenuProc (DWORD @@hwnd, DWORD @@wparam)
	push	@@wparam
	push	@@hwnd
	call	MenuProc
	jmp	exit_wndproc
default:
;обработка по умолчанию
;готовим вызов LRESULT DefWindowProc(
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
;обработка сообщений от меню
MenuProc	proc 	
arg	@@hwnd:DWORD, @@wparam:DWORD
uses	ebx
local	@@hdc:DWORD	
	mov	ebx,@@wparam	;в bx идентификатор меню
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
;получим контекст устройства HDC GetDC(HWND hWnd   // handle to a window);
	push	@@hwnd
	call	GetDC
	mov	@@hdc,eax
;получим размер рабочей области BOOL GetClientRect(
;  HWND hWnd,      // handle to window
;  LPRECT lpRect   // address of structure for client coordinates);
	push	offset lpRect
	push	@@hwnd
	call	GetClientRect
;выведем строку текста в окно int DrawText(
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
;освободить контекст int ReleaseDC(
;  HWND hWnd,  // handle to window
;  HDC hDC     // handle to device context);
	push	@@hdc
	push	@@hwnd
	call	ReleaseDC
	jmp	@@exit
@@idmtextout:
	push	@@hwnd
	call	GetDC	;получим контекст устройства
	mov	@@hdc,eax
;выведем строку текста в окно BOOL TextOut(  
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
	call	ReleaseDC	;освободим контекст устройства
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
@@TXT_TEXTOUT	db	'Текст выведен функцией TEXTOUT'
lenTXT_TEXTOUT=$-@@TXT_TEXTOUT	
@@TXT_DRAWTEXT	db	'Текст выведен функцией DRAWTEXT',0
MenuProc	endp
end	start