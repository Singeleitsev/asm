	.386
	.model flat, STDCALL

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

.data
;Handles
	hWnd dd 0
	hInst dd 0
	;hDC dd 0
;Structures
	;lpVersionInformation OSVERSIONINFO <?>
	wcl WNDCLASSEX32 <?>
	message MSG32 <?>
	ps PAINTSTRUCT32 <?>
	szClassName db 'Приложение Win32',0
	szTitleName db 'Каркасное приложение Win32 на ассемблере',0
	MesWindow db 'Привет! Ну как вам процесс разработки приложения на ассемблере?',0
	MesWindowLen = $-MesWindow-1
	playFileCreate db 'create.wav',0
	playFilePaint db 'paint.wav',0
	playFileDestroy db 'destroy.wav',0
.code
;точка входа в программу:
start proc
;начало стартового кода 
;	push offset lpVersionInformation
;	call GetVersionExA
;далее можно вставить код для анализа информации о версии Windows (Приложение 11)
;получить указатель на командную строку
;	call GetCommandLineA ;в регистре eax адрес
;(проверить и вставить код)
;получить указатель на блок с переменными окружения
;	call GetEnvironmentStringsA ;в регистре eax адрес (проверить и вставить код)
;указатель на структуру STARTUPINFO
;	push offset lpStartupInfo
;	call GetStartupInfoA	
;(проверить и вставить код)

;получить значение базового адреса, по которому загружен модуль
	push 0
	call GetModuleHandleA 
	mov hInst,eax
;далее hInst будет использоваться в качестве дескриптора данного приложения
;конец стартового кода

;-------------------WinMain-------------------
WinMain:

;определить класс окна
;для начала инициализируем поля структуры WndClassEx
	mov wcl.cbSize,dword ptr sizeof WNDCLASSEX32 ;размер структуры
	mov wcl.style, 3 ;CS_HREDRAW+CS_VREDRAW
	mov wcl.lpfnWndProc,offset WindowProc ;адрес оконной процедуры
	mov wcl.cbClsExtra,0
	mov wcl.cbWndExtra,0
	mov eax,hInst
;дескриптор приложения в поле hInstance структуры wcl
	mov wcl.hInstance,eax
;готовим вызов HICON LoadIcon (HINSTANCE hInstance,LPCTSTR lpIconName)
	push 7F00h ;IDI_APPLICATION
	push 0
	call LoadIconA
	mov wcl.hIcon,eax ;дескриптор иконки в поле hIcon структуры wcl
;готовим вызов HCURSOR LoadCursorA (HINSTANCE hInstance,LPCTSTR lpCursorName)
	push 7F00h ;IDC_ARROW
	push 0
	call LoadCursorA
	mov wcl.hCursor,eax ;дескриптор курсора в поле hCursor структуры wcl
;определим цвет фона окна - белый
;готовим вызов HGDIOBJ GetStockObject(int fnObject)	;type of stock object
	push 0 ;WHITE_BRUSH
	call GetStockObject
	mov wcl.hbrBackground,eax
	mov wcl.lpszMenuName,0 ;без главного меню
;имя класса окна
	mov eax,offset szClassName
	mov wcl.lpszClassName,eax
	mov wcl.hIconSm,0
;регистрируем класс окна - готовим вызов RegisterClassExA (&wndclass)
	push offset wcl
	call RegisterClassExA
	test ax,ax ;проверить на успех регистрации класса окна
	jz end_cycl_msg ;неудача

;создаем окно:
	push 0 ;lpParam
	push hInst ;hInstance
	push 0 ;menu
	push 0 ;parent hwnd
	push 80000000h ;CW_USEDEFAULT ;высота окна
 	push 80000000h ;CW_USEDEFAULT ;ширина окна
	push 80000000h ;CW_USEDEFAULT ;координата y левого верхнего угла
	push 80000000h ;CW_USEDEFAULT ;координата x левого верхнего угла
	push 0CF0000h ;WS_OVERLAPPEDWINDOW ;стиль окна
	push offset szTitleName ;Строка заголовка окна
	push offset szClassName ;имя класса окна
	push 0
	call CreateWindowExA
	mov hWnd,eax ;hwnd - дескриптор окна

;показать окно:
	push 1 ;SW_SHOWNORMAL
	push hWnd
	call ShowWindow
;перерисовываем содержимое окна
	push hWnd
	call UpdateWindow

;запускаем цикл сообщений:
cycl_msg:
	push 0
	push 0
	push 0
	push offset message
	call GetMessageA
	cmp ax,0
	je end_cycl_msg
;трансляция ввода с клавиатуры
	push offset message
	call TranslateMessage
;отправим сообщение оконной процедуре
	push offset message
	call DispatchMessageA
	jmp cycl_msg

;выход из приложения
end_cycl_msg:
	push 0
	call ExitProcess
start endp

;-------------------WindowProc-------------------
WindowProc proc uses ebx edi esi, @@hwnd:DWORD, @@mes:DWORD, @@wparam:DWORD, @@lparam:DWORD

	local @@hdc:DWORD

	cmp @@mes,2 ;WM_DESTROY
		je wmdestroy
	cmp @@mes,1 ;WM_CREATE
		je wmcreate
	cmp @@mes,0Fh ;WM_PAINT
		je wmpaint
	jmp default

wmcreate:
;обозначим создание окна звуковым эффектом
	push 0 ;SND_SYNC+SND_FILENAME 
	push 0
	push offset playFileCreate
	call PlaySoundA
	mov eax,0 ;возвращаемое значение 0
	jmp exit_wndproc

wmpaint:
	push 0 ;SND_SYNC+SND_FILENAME 
	push 0
	push offset playFilePaint
	call PlaySoundA
;получим контекст устройства
	push offset ps
	push @@hwnd
	call BeginPaint
	mov @@hdc,eax
;выведем строку текста в окно
	push MesWindowLen	
	push offset MesWindow
	push 0A0h
	push 0Ah
	push @@hdc
	call TextOutA
;освободить контекст
	push offset ps
	push @@hdc
	call EndPaint
	mov eax,0 ;возвращаемое значение 0
	jmp exit_wndproc

wmdestroy:
	push 0;SND_SYNC+SND_FILENAME 
	push 0
	push offset playFileDestroy
	call PlaySoundA
;послать сообщение WM_QUIT
	push 0
	call PostQuitMessage
	mov eax,0 ;возвращаемое значение 0
	jmp exit_wndproc

;обработка по умолчанию
default:
	push @@lparam
	push @@wparam
	push @@mes
	push @@hwnd
	call DefWindowProcA
	jmp exit_wndproc

exit_wndproc:
	ret
WindowProc endp
end start

