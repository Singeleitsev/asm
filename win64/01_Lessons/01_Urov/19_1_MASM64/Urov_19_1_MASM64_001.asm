	option casemap:none
;Standard Includes and Libs
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	include D:\bin\dev\ml64\include\gdi32.inc
	include D:\bin\dev\ml64\include\winmm.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\winmm.lib
;Custom Includes
	include include\struct64_20.inc

.data
;Handles
	hwnd dq 0
	hInst dq 0
	;hdc dq 0
	;lpVersionInformation OSVERSIONINFO <?>
;Structures
	wcl WNDCLASSEX64 <?>
	message MSG64 <?>
	ps PAINTSTRUCT64 <?>
;Captions
	szClassName db 'Приложение Win64',0
	szTitleName db 'Каркасное приложение Win64 на ассемблере',0
	MesWindow db 'Привет! Ну как вам процесс разработки приложения на ассемблере?',0
	MesWindowLen = $-MesWindow-1
;Sound files
	playFileCreate db 'create.wav',0
	playFilePaint db 'paint.wav',0
	playFileDestroy db 'destroy.wav',0

.code
;точка входа в программу:
start proc

;Align the Stack by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;начало стартового кода 
;	lea rcx,lpVersionInformation
;	call GetVersionExA
;далее можно вставить код для анализа информации о версии Windows (Приложение 11)
;получить указатель на командную строку
;	call GetCommandLineA ;в регистре rax адрес
;(проверить и вставить код)
;получить указатель на блок с переменными окружения
;	call GetEnvironmentStringsA ;в регистре rax адрес (проверить и вставить код)
;указатель на структуру STARTUPINFO
;	lea rcx,lpStartupInfo
;	call GetStartupInfoA	
;(проверить и вставить код)

;получить значение базового адреса, по которому загружен модуль
	xor rcx,rcx
	call GetModuleHandleA
	mov hInst,rax
;далее hInst будет использоваться в качестве дескриптора данного приложения
;конец стартового кода

WinMain:

;определить класс окна
;для начала инициализируем поля структуры WndClassEx
	mov wcl.cbSize,50h ;qword ptr sizeof WNDCLASSEX32 ;размер структуры
	mov wcl.style, 3 ;CS_HREDRAW+CS_VREDRAW
;адрес оконной процедуры
	lea rax,WindowProc
	mov wcl.lpfnWndProc,rax
	mov wcl.cbClsExtra,0
	mov wcl.cbWndExtra,0
;дескриптор приложения в поле hInstance структуры wcl
	mov rax,hInst
	mov wcl.hInstance,rax
;готовим вызов HICON LoadIcon (HINSTANCE hInstance,LPCTSTR lpIconName)
	xor rcx,rcx
	mov rdx,7F00h ;IDI_APPLICATION
	call LoadIconA
	mov wcl.hIcon,rax ;дескриптор иконки в поле hIcon структуры wcl
;готовим вызов HCURSOR LoadCursorA (HINSTANCE hInstance,LPCTSTR lpCursorName)
	xor rcx,rcx
	mov rdx,7F00h ;IDC_ARROW
	call LoadCursorA
	mov wcl.hCursor,rax ;дескриптор курсора в поле hCursor структуры wcl
;определим цвет фона окна - белый
;готовим вызов HGDIOBJ GetStockObject(int fnObject) ;type of stock object
	xor rcx,rcx ;WHITE_BRUSH = 0
	call GetStockObject
	mov wcl.hbrBackground,rax
	mov wcl.lpszMenuName,0 ;без главного меню
;имя класса окна
	lea rax,szClassName
	mov wcl.lpszClassName,rax
	mov wcl.hIconSm,0
;регистрируем класс окна - готовим вызов RegisterClassExA (&wndclass)
	lea rcx,wcl
	call RegisterClassExA
	test ax,ax ;проверить на успех регистрации класса окна
	jz end_cycl_msg ;неудача

;создаем окно:
	xor rcx,rcx
	lea rdx,szClassName ;имя класса окна
	lea r8,szTitleName ;Строка заголовка окна
	mov r9,0CF0000h ;WS_OVERLAPPEDWINDOW ;стиль окна
	mov qword ptr [rsp+20h],80000000h ;CW_USEDEFAULT ;координата x левого верхнего угла
	mov qword ptr [rsp+28h],80000000h ;CW_USEDEFAULT ;координата y левого верхнего угла
	mov qword ptr [rsp+30h],80000000h ;CW_USEDEFAULT ;ширина окна
	mov qword ptr [rsp+38h],80000000h ;CW_USEDEFAULT ;высота окна	
	mov qword ptr [rsp+40h],0 ;parent hwnd
	mov qword ptr [rsp+48h],0 ;menu
	mov rax,hInst
	mov qword ptr [rsp+50h],rax ;hInstance
	mov qword ptr [rsp+58h],0 ;lpParam
	call CreateWindowExA
	mov hwnd,rax ;hwnd - дескриптор окна

;показать окно:
	mov rcx,hwnd
	mov rdx,1 ;SW_SHOWNORMAL
	call ShowWindow
;перерисовываем содержимое окна
	mov rcx,hwnd
	call UpdateWindow

;запускаем цикл сообщений:
cycl_msg:
	lea rcx,message ;lpMsg
	xor rdx,rdx ;hWnd
	xor r8,r8 ;wMsgFilterMin
	xor r9,r9 ;wMsgFilterMax
	call GetMessageA
	cmp ax,0
	je end_cycl_msg
;трансляция ввода с клавиатуры
	lea rcx,message
	call TranslateMessage
;отправим сообщение оконной процедуре
	lea rcx,message
	call DispatchMessageA
	jmp cycl_msg

;выход из приложения
end_cycl_msg:
	xor rcx,rcx
	call ExitProcess
start endp

;-------------------WindowProc-------------------
WindowProc proc uses rbx rdi rsi, @@hwnd:QWORD, @@mes:QWORD, @@wparam:QWORD, @@lparam:QWORD

	local @@hdc:QWORD

;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax


;Store Values retrieved by DispatchMessageA:
	mov @@hwnd,rcx
	mov @@mes,rdx
	mov @@wparam,r8
	mov @@lparam,r9

	cmp rdx,0Fh ;WM_PAINT
		je wmpaint
	cmp rdx,1 ;WM_CREATE
		je wmcreate	
	cmp rdx,2 ;WM_DESTROY
		je wmdestroy
	jmp default

wmcreate:
;обозначим создание окна звуковым эффектом
	lea rcx,playFileCreate
	xor rdx,rdx
	xor r8,r8 ;SND_SYNC+SND_FILENAME = 0
	call PlaySoundA
	xor rax,rax ;возвращаемое значение 0
	jmp exit_wndproc

wmpaint:
	lea rcx,playFilePaint
	xor rdx,rdx
	xor r8,r8 ;SND_SYNC+SND_FILENAME = 0
	call PlaySoundA
;получим контекст устройства
	mov rcx,@@hwnd
	lea rdx,ps
	call BeginPaint
	mov @@hdc,rax
;выведем строку текста в окно
	mov rcx,@@hdc
	mov rdx,0Ah
	mov r8,0A0h
	lea r9,MesWindow
	mov qword ptr [rsp+20h],MesWindowLen	
	call TextOutA
;освободить контекст
	mov rcx,@@hdc
	lea rdx,ps
	call EndPaint
	xor rax,rax ;возвращаемое значение 0
	jmp exit_wndproc

wmdestroy:
	lea rcx,playFileDestroy
	xor rdx,rdx
	xor r8,r8 ;SND_SYNC+SND_FILENAME = 0
	call PlaySoundA
;послать сообщение WM_QUIT
	xor rcx,rcx
	call PostQuitMessage
	xor rax,rax ;возвращаемое значение 0
	jmp exit_wndproc

;обработка по умолчанию
default:
	mov rcx,@@hwnd
	mov rdx,@@mes
	mov r8,@@wparam
	mov r9,@@lparam
	call DefWindowProcA
	jmp exit_wndproc

exit_wndproc:
	ret
WindowProc endp
end