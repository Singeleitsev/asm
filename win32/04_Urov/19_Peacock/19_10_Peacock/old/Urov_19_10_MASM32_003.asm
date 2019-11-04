;prg20_1.asm
;Пример приложения для Win32 с использованием меню, 
;окон диалогов, решением проблемы перерисовки содержимого окна,
;демонстрации некоторых принципов работы с графикой и 
;примером использования сопроцессора
	.486
;STDCALL - передача параметров в стиле С (справа налево),
	.model flat,STDCALL	;модель памяти flat,
	option casemap:none

;Standard Includes and Libs
	include D:\masm32\include\windows.inc
	include D:\masm32\include\kernel32.inc
	include D:\masm32\include\user32.inc
	include D:\masm32\include\gdi32.inc
	include D:\masm32\include\winmm.inc
	includelib D:\masm32\lib\kernel32.lib
	includelib D:\masm32\lib\user32.lib
	includelib D:\masm32\lib\gdi32.lib
	includelib D:\masm32\lib\winmm.lib
;Custom Includes
	include include\struct32_01.inc
;Urov Includes
	include	show_eax.inc
	include	Prg20_1.inc

.data
	X_start dd 0,0	
	X_end dd 0,0	
	Y_start dd 0,0	
	Y_end dd 0,0	
	hwnd dd 0
	hInst dd 0
	memdc dd 0 ;!!!это глобальная переменная
	maxX dd 0 ;!!!это глобальная переменная
	maxY dd 0 ;!!!это глобальная переменная
	;lpVersionInformation OSVERSIONINFO <?>
	wcl WNDCLASSEX <?>
	message MSG <?>
	ps PAINTSTRUCT <?>
	lpRect RECT <?>
	pt POINT <?>
	szClassName db 'Приложение Win32',0
	szTitleName db 'Приложение Win32 на ассемблере',0
	MesWindow db 'Привет! Ну, как вам процесс разработки приложения на ассемблере?'
	MesWindowLen = $-MesWindow
;звуковые файлы
	playFileCreate db 'create.wav',0
	playFilePaint db 'paint.wav',0
	playFileDestroy db 'destroy.wav',0
;имена ресурсов:
	lpmenu db "MYMENU",0
	lpdlg1 db "IDD_DIALOG1",0
	lpdlg2 db "IDD_DIALOG2",0
	lpdlg3 db "AboutBox",0
;переменные для макроса show_eax
	eedx dd 0
	eecx dd 0,0
	template db '0123456789ABCDEF'
	MesMsgBox db 'Отладка (содержимое eax):',0
;определение констант для фигуры "Павлин"
	x1 dd 1
	x2 dd 0
	y2 dd 0
	i30 dw 30
	i90 dw 90
	i100 dw 100
	i120 dw 120
	icenter dd 100
	icycl dd 319
;определение констант для фигуры "Кружева"
;N - число вершин правильного многоугольника,
;его можно менять - попробуйте!!!
	N equ 18
	Xc equ 160
	Yc equ 100
	masX dd N dup (0)
	masY dd N dup (0)
	i_N dw N
	R dw 99
	DTT dd 0
	t dd 0
	i dd 0
	j dd 0
	i2 dw 2
	
sim4_to_EAXbin	macro	sim4:req
	local m1
	push eax
	push ebx
	push ecx
	mov ebx,1
	mov eax,sim4
	bswap eax
	mov sim4,0
	push eax
	mov ecx,4
m1:	and eax,0fh
	imul eax,ebx
	imul ebx,10
	add sim4,eax
	pop eax
	shr eax,8
	push eax
	loop m1
	pop eax
 	pop ecx
	pop ebx
	pop eax
	endm
.code
start proc
;точка входа в программу:
;начало стартового кода 
;закоментированные ниже функции можно при необходимости раскоментировать, но 
;они не являются обязательными в данной программе
;вызов BOOL GetVersionEx(LPOSVERSIONINFO lpVersionInformation)
;//pointer to version information ;structure
;	invoke GetVersionExA,offset lpVersionInformation
;далее можно вставить код для анализа информации о версии Windows (Приложение 11)
;вызов LPTSTR GetCommandLine(VOID) - получить указатель на командную строку
;	call GetCommandLineA	
;в регистре eax адрес (проверить и вставить код)
;вызов LPVOID GetEnvironmentStrings (VOID) - получить указатель на блок с переменными ;окружения
;	call	GetEnvironmentStringsA	
;в регистре eax адрес (проверить и вставить код)
;вызов VOID GetStartupInfo(LPSTARTUPINFO lpStartupInfo)	;указатель на структуру STARTUPINFO
;	invoke GetStartupInfoA, offset lpStartupInfo
;(проверить и вставить код)
;вызов HMODULE GetModuleHandleA (LPCTSTR lpModuleName)
;lpModuleName address of module name to return handle 
	invoke GetModuleHandleA,0 ; получить значение базового адреса 
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
;определим цвет фона окна - белый (WHITE_BRUSH)
;готовим вызов HGDIOBJ GetStockObject(int fnObject)	;type of stock object
	push	WHITE_BRUSH
	call	GetStockObject
	mov	wcl.hbrBackground,eax
	mov	dword	ptr wcl.lpszMenuName,offset lpmenu
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
WindowProc proc uses ebx edi esi ecx, @@hwnd:DWORD, @@mes:DWORD, @@wparam:DWORD, @@lparam:DWORD
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
;создание растрового изображения, совместимого с окном приложения
;получим размер экрана в пикселах int GetSystemMetrics(
;	int nIndex)   // system metric or configuration setting to retrieve
	push	SM_CXSCREEN
	call	GetSystemMetrics
	mov	maxX,eax
	push	SM_CYSCREEN
	call	GetSystemMetrics
	mov	maxY,eax
;получить контекст устройства окна на экране @@hdc=GetDC(@@hwnd)
	push	@@hwnd
	call	GetDC
	mov	@@hdc,eax
;получить совместимый контекст устройства памяти 
;memdc=CreateCompatibleDC(@@hdc)
	push	@@hdc
	call	CreateCompatibleDC
	mov	memdc,eax	;!!! memdc - глобальная переменная
;получить дескриптор растрового изображения в памяти
; @@hbit=CreateCompatibleBitmap(@@hdc,@@maxX,@@maxY)
	push	maxY
	push	maxX
	push	@@hdc
	call	CreateCompatibleBitmap
	mov	@@hbit,eax
;выбираем растр в контекст памяти SelectObject(memdc,@@hbit)
	push	@@hbit
	push	memdc
	call	SelectObject
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти hbrush=GetStockObject(GRAY_BRUSH)
	push	GRAY_BRUSH
	call	GetStockObject
	mov	@@hbrush,eax
;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	push	@@hbrush
	push	memdc
	call	SelectObject
;заполняем выбранной кистью виртуальное окно
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
;освободим контекст устройства ReleaseDC(@@hwnd,@@hdc)
	push	@@hdc
	push	@@hwnd
	call	ReleaseDC
;обозначим создание окна звуковым эффектом
;готовим вызов функции BOOL PlaySound(
;				 LPCSTR pszSound,  
;				 HMODULE hmod,     
;				 DWORD fdwSound)
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFileCreate
	call	PlaySoundA
;возвращаем значение 0
	mov	eax,0	
	jmp	exit_wndproc
wmpaint:
;получим контекст устройства HDC BeginPaint( HWND hwnd, // handle to window LPPAINTSTRUCT lpPaint // pointer to structure for paint information);
	push	offset	ps
	push	@@hwnd
	call	BeginPaint
	mov	@@hdc,eax
;обозначим перерисовку окна звуковым эффектом
	push	SND_SYNC+SND_FILENAME 
	push	NULL
	push	offset playFilePaint
	call	PlaySoundA
;выведем строку текста в окно BOOL TextOut(  
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
;вывод виртуального окна в реальное окно
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
;освободить контекст BOOL EndPaint( 
;	HWND hWnd, // handle to window 
;	CONST PAINTSTRUCT *lpPaint // pointer to structure for paint data);
	push	offset ps
	push	@@hwnd
	call	EndPaint
	mov	eax,0	;возвращаемое значение 0
	jmp	exit_wndproc
wmdestroy:
;удалить виртуальное окно DeleteDC(memdc)
	push	memdc
	call	DeleteDC
;обозначим завершение работы приложения звуковым эффектом
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
	push	@@hbrush
	push	@@hdc
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
MenuProc proc uses eax ebx, @@hwnd:DWORD, @@wparam:DWORD,@@hdc:DWORD,@@hbrush:DWORD

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
	push	memdc
	call	DrawTextA
;генерация сообщения WM_PAINT для вывода строки на экран
;BOOL InvalidateRect(HWND hWnd,  // handle of window with changed update region
;	CONST RECT *lpRect, address of rectangle coordinates
;	BOOL bErase) // erase-background flag
	push	1
	push	NULL
	push	@@hwnd
	call	InvalidateRect

	jmp	@@exit
@@idmtextout:
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
	push	memdc
	call	TextOutA
;генерация сообщения WM_PAINT для вывода строки на экран
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	jmp	@@exit
@@idmlength:
;вызываем диалоговое окно int DialogBoxParam(HINSTANCE hInstance,  // handle to application instance
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
;установить текущую точку BOOL MoveToEx(
;  HDC hdc,          // handle to device context
;  int X,            // x-coordinate of new current position
;  int Y,            // y-coordinate of new current position
;  LPPOINT lpPoint)   // pointer to old current position
	push	NULL	;offset	pt
	push	Y_start
	push	X_start
	push	memdc
	call	MoveToEx

;вывод линии BOOL LineTo(HDC hdc,    // device context handle
;  int nXEnd,  // x-coordinate of line's ending point
;  int nYEnd)   // y-coordinate of line's ending point
	push	Y_end
	push	X_end
	push	memdc
	call	LineTo

;генерация сообщения WM_PAINT для вывода строки на экран
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	jmp	@@exit
@@idmrectangle:
;вызываем диалоговое окно 
	push	0
	push	offset DialogProc2
	push	@@hwnd
	push	offset lpdlg2
	push	hInst	
	call	DialogBoxParamA
;вывод прямоугольника BOOL Rectangle(HDC hdc,	// handle to device context
;  int nLeftRect,   // x-coord of bounding rectangle's upper-left corner
;  int nTopRect,    // y-coord of bounding rectangle's upper-left corner
;  int nRightRect,  // x-coord of bounding rectangle's lower-right corner
;  int nBottomRect);  // y-coord of bounding rectangle's lower-right corner
	push	Y_start
	pop	eax
	push	eax
	show_eax	
	push	X_start
	pop	eax
	push	eax
	show_eax
	push	Y_end
	pop	eax
	push	eax
	show_eax
	push	X_end		
	pop	eax
	push	eax
	show_eax
	push	memdc
	call	Rectangle
;генерация сообщения WM_PAINT для вывода строки на экран
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	jmp	@@exit
@@idmpeacock:	;"Павлин"
;очистим окно
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти hbrush=GetStockObject(GRAY_BRUSH)
	push	GRAY_BRUSH
	call	GetStockObject
	mov	@@hbrush,eax
;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	push	@@hbrush
	push	memdc
	call	SelectObject
;заполняем выбранной кистью виртуальное окно
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
;вычислим x2=120+100*sin(x1/30)
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
;вычислим y2=120+100*cos(x1/30)
	fild	x1
	fidiv	i30
	fcos
	fimul	i100
	fiadd	i90
	fistp	y2
;рисуем отрезок:
	push	NULL
	push	icenter
	push	x1
	push	memdc
	call	MoveToEx
	push	y2
	push	x2
	push	memdc
	call	LineTo
;генерация сообщения WM_PAINT для вывода строки на экран
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	jmp	@@m1
@@m2:	
	jmp	@@exit
@@idmlaces:	;"Кружева"
;очистим окно
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти hbrush=GetStockObject(GRAY_BRUSH)
	push	GRAY_BRUSH
	call	GetStockObject
	mov	@@hbrush,eax
;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	push	@@hbrush
	push	memdc
	call	SelectObject
;заполняем выбранной кистью виртуальное окно
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
;вычислим DTT=2*Пи/N
	finit
	fldpi
	fidiv	i_N
	fimul	i2
	fistp	DTT
	mov	t,0
	mov	i,0
;заполняем массивы masX и masY координатами вершин прямоугольника
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
;соединим вершины многоугольника:
	mov	i,0
@@m5:
	mov	eax,i
	mov	j,eax
@@m4:	inc	j	
;рисуем отрезок:
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
;генерация сообщения WM_PAINT для вывода строки на экран
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect	

	jmp	@@exit
@@idmabout:
;вызываем диалоговое окно 
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
@@TXT_TEXTOUT	db	'Текст выведен функцией TEXTOUT'
lenTXT_TEXTOUT=$-@@TXT_TEXTOUT	
@@TXT_DRAWTEXT	db	'Текст выведен функцией DRAWTEXT',0
MenuProc	endp
;-----------------DialogProc1-----------------------------------------
DialogProc1 proc uses eax ebx edi esi, @@hdlg:DWORD, @@message:DWORD, @@wparam:DWORD, @@lparam:DWORD
	mov	eax,@@message
	cmp	ax,WM_INITDIALOG
	je	@@wminitdialog
	cmp	ax,WM_COMMAND
	jne	@@exit_false
	mov	ebx,@@wparam	;в bx идентификатор элемента управления
	cmp	bx,IDOK	
	je	@@idok
	cmp	bx, IDCANCEL
	je	@@idcancel
	jmp	@@exit_false
@@wminitdialog:
	jmp	@@exit_true
@@idok:
;прочитаем X_start UINT GetDlgItemText(  HWND hDlg,       // handle of dialog box
;  int nIDDlgItem,  // identifier of control
;  LPTSTR lpString, // address of buffer for text
;  int nMaxCount    // maximum size of string);
	push	5
	push	offset X_start
	push	IDC_EDIT1
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  X_start
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	X_start	
;прочитаем Y_start 
	push	5
	push	offset Y_start
	push	IDC_EDIT2
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Y_start
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Y_start	
;прочитаем X_end
	push	5
	push	offset X_end
	push	IDC_EDIT3
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  X_end
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	X_end		
;прочитаем Y_end
	push	5
	push	offset Y_end
	push	IDC_EDIT4
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Y_end
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Y_end		
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
DialogProc2 proc uses eax ebx edi esi, @@hdlg:DWORD, @@message:DWORD, @@wparam:DWORD, @@lparam:DWORD
	mov	eax,@@message
	cmp	ax,WM_INITDIALOG
	je	@@wminitdialog
	cmp	ax,WM_COMMAND
	jne	@@exit_false
	mov	ebx,@@wparam	;в bx идентификатор элемента управления
	cmp	bx,IDOK	
	je	@@idok
	cmp	bx, IDCANCEL
	je	@@idcancel
	jmp	@@exit_false
@@wminitdialog:
	jmp	@@exit_true
@@idok:
;прочитаем X_start UINT GetDlgItemText(  HWND hDlg,       // handle of dialog box
;  int nIDDlgItem,  // identifier of control
;  LPTSTR lpString, // address of buffer for text
;  int nMaxCount    // maximum size of string);
	push	5
	push	offset X_start
	push	IDC_EDIT1
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  X_start
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	X_start	
;прочитаем Y_start 
	push	5
	push	offset Y_start
	push	IDC_EDIT2
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Y_start
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Y_start
;прочитаем X_end
	push	5
	push	offset X_end
	push	IDC_EDIT3
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  X_end
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	X_end
;прочитаем Y_end
	push	5
	push	offset Y_end
	push	IDC_EDIT4
	push	@@hdlg
	call	GetDlgItemTextA
	push	MB_ICONINFORMATION+MB_OK
	push	offset szTitleName
	push	offset  Y_end
	push	@@hdlg
	call	MessageBoxA
	sim4_to_EAXbin	Y_end
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
 AboutDialog proc uses eax ebx edi esi, @@hdlg:DWORD, @@message:DWORD, @@wparam:DWORD, @@lparam:DWORD
	mov	eax,@@message
	cmp	ax,WM_INITDIALOG
	je	@@wminitdialog
	cmp	ax,WM_COMMAND
	jne	@@exit_false
	mov	ebx,@@wparam	;в bx идентификатор элемента управления
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