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
	include include\spell_09.inc
;Urov Includes
	include include\show_rax_01.inc
	include include\sim4_to_RAXbin_02g.inc

.const
;System
	IDOK equ 1
	IDCANCEL equ 2
	;DS_MODALFRAME equ 80h
	;ES_AUTOHSCROLL equ 80h
	;WS_GROUP equ 20000h
	;WS_SYSMENU equ 80000h
	;WS_DLGFRAME equ 400000h
	;WS_CAPTION equ 0C00000h	;WS_BORDER | WS_DLGFRAME
	;WS_POPUP equ 80000000h
;Menu
	MYMENU equ 100h
	IDM_DRAWTEXT equ 101h
	IDM_TEXTOUT equ 102h
	IDM_LENGTH equ 103h
	IDM_RECTANGLE equ 104h
	IDM_PEACOCK equ 105h
	IDM_LACES equ 106h
	IDM_ABOUT equ 107h
;Dialog
	IDC_EDIT1 equ 1001h
	IDC_EDIT2 equ 1002h
	IDC_EDIT3 equ 1003h
	IDC_EDIT4 equ 1004h
	;IDC_STATIC equ -1
;Sound files
	playFileCreate db 'create.wav',0
	playFilePaint db 'paint.wav',0
	playFileDestroy db 'destroy.wav',0	

.data
;Window Captions
	szClassName db 'Приложение Win64',0
	szTitleName db 'Каркасное приложение Win64 на ассемблере',0
	MesWindow db 'Привет! Ну как вам процесс разработки приложения на ассемблере?',0
	MesWindowLen = $-MesWindow-1
;Handles
	hwnd dq 0
	hInst dq 0
	memdc dq 0 ;!!!это глобальная переменная
	maxX dq 0 ;!!!это глобальная переменная
	maxY dq 0 ;!!!это глобальная переменная
;Dialog Names
	lpmenu db "MyMenu",0
	lpdlg1 db "IDD_DIALOG1",0
	lpdlg2 db "IDD_DIALOG2",0
	lpdlg3 db "AboutBox",0
;Coordinates
	X_start dq ?
	X_end dq ?
	Y_start dq ?
	Y_end dq ?
;Переменные для макроса show_eax
	eedx dq ?
	eecx dq ?
	template db '0123456789ABCDEF'
	MesMsgBox db 'Отладка (содержимое rax):',0
;Debug messages
	szRAX db "Регистр rax: 0000.0000.0000.0000h",0

.data?
;Structures
	;lpVersionInformation OSVERSIONINFO <?>
	wcl WNDCLASSEX64 <?>
	message MSG64 <?>
	ps PAINTSTRUCT64 <?>
	lpRect RECT64 <?>

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
	mov wcl.lpszMenuName,MYMENU
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

	local @@hdc:QWORD, @@hbrush:QWORD, @@hbit:QWORD

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
	cmp rdx,111h ;WM_COMMAND
		je wmcommand
	cmp rdx,1 ;WM_CREATE
		je wmcreate	
	cmp rdx,2 ;WM_DESTROY
		je wmdestroy
	jmp default

wmcreate:
;создание растрового изображения, совместимого с окном приложения
;получим размер экрана в пикселах
	xor rcx,rcx ;SM_CXSCREEN = 0
	call GetSystemMetrics
	mov maxX,rax
	mov rcx,1 ;SM_CYSCREEN = 1
	call GetSystemMetrics
	mov maxY,rax
;получить контекст устройства окна на экране
	mov rcx,@@hwnd
	call GetDC
	mov @@hdc,rax
;получить совместимый контекст устройства памяти
	mov rcx,@@hdc
	call CreateCompatibleDC
	mov memdc,rax ;!!! memdc - глобальная переменная
;получить дескриптор растрового изображения в памяти
	mov rcx,@@hdc
	mov rdx,maxX
	mov r8,maxY
	call CreateCompatibleBitmap
	mov @@hbit,rax
;выбираем растр в контекст памяти SelectObject(memdc,@@hbit)
	mov rcx,memdc
	mov rdx,@@hbit
	call SelectObject
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти
	mov rcx,2 ;GRAY_BRUSH
	call GetStockObject
	mov @@hbrush,rax
;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	mov rcx,memdc
	mov rdx,@@hbrush
	call SelectObject
;заполняем выбранной кистью виртуальное окно
	mov rcx,memdc ;handle to device context
	xor rdx,rdx ;x-coord. of upper-left corner of rect. to be filled
	xor r8,r8 ;y-coord. of upper-left corner of rect. to be filled
	mov r9,maxX ;width of rectangle to be filled
	mov rax,maxY
	mov qword ptr [rsp+20h],rax ;height of rectangle to be filled
	mov qword ptr [rsp+28h],0F00021h ;raster operation code = dest = pattern = PATCOPY
	call PatBlt
;освободим контекст устройства ReleaseDC(@@hwnd,@@hdc)
	mov rcx,@@hwnd
	mov rdx,@@hdc
	call ReleaseDC
;обозначим создание окна звуковым эффектом
	lea rcx,playFileCreate
	xor rdx,rdx
	xor r8,r8 ;SND_SYNC+SND_FILENAME = 0
	call PlaySoundA
;возвращаемое значение 0
	xor rax,rax
	jmp exit_wndproc

wmpaint:
;получим контекст устройства
	mov rcx,@@hwnd
	lea rdx,ps
	call BeginPaint
	mov @@hdc,rax
;обозначим перерисовку окна звуковым эффектом
	lea rcx,playFilePaint
	xor rdx,rdx
	xor r8,r8 ;SND_SYNC+SND_FILENAME = 0
	call PlaySoundA
;выведем строку текста в окно
	mov rcx,memdc
	mov rdx,0Ah ;10
	mov r8,64h ;100
	lea r9,MesWindow
	mov qword ptr [rsp+20h],MesWindowLen	
	call TextOutA
;вывод виртуального окна в реальное окно
	mov rcx,@@hdc ;handle to destination device context
	xor rdx,rdx ;x-coordinate of destination rectangle's upper-left corner
	xor r8,r8 ;y-coordinate of destination rectangle's upper-left corner
	mov r9,maxX ;width of destination rectangle
	mov rax,maxY 
	mov qword ptr [rsp+20h],rax ;height of destination rectangle
	mov rax,memdc
	mov qword ptr [rsp+28h],rax ;handle to source device context
	mov qword ptr [rsp+30h],0 ;x-coordinate of source rectangle's upper-left corner
	mov qword ptr [rsp+38h],0 ;y-coordinate of source rectangle's upper-left corner
	mov qword ptr [rsp+40h],0CC0020h ;raster operation code = dest = source = SRCCOPY
	call BitBlt
;освободить контекст
	mov rcx,@@hdc
	lea rdx,ps
	call EndPaint
	xor rax,rax ;возвращаемое значение 0
	jmp exit_wndproc

wmdestroy:
;удалить виртуальное окно
	mov rcx,memdc
	call DeleteDC
;обозначим завершение работы приложения звуковым эффектом
	lea rcx,playFileDestroy
	xor rdx,rdx
	xor r8,r8 ;SND_SYNC+SND_FILENAME = 0
	call PlaySoundA
;послать сообщение WM_QUIT
	xor rcx,rcx
	call PostQuitMessage
	xor rax,rax ;возвращаемое значение 0
	jmp exit_wndproc

wmcommand:
;вызов процедуры обработки сообщений от меню
	mov rcx,@@hwnd
	;mov rdx,@@mes ;not used
	mov r8,@@wparam
	;mov r9,@@lparam ;not used
	call MenuProc
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

;-------------------MenuProc----------------------
;обработка сообщений от меню
MenuProc proc @@hwnd:QWORD, @@wparam:QWORD

local @@hdc:QWORD

;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store retrieved Values:
	mov @@hwnd,rcx
	;mov @@message,rdx ;not used
	mov @@wparam,r8
	;mov @@lparam,r9 ;not used

	cmp r8,IDM_DRAWTEXT	
		je @@idmdrawtext
	cmp r8,IDM_TEXTOUT
		je @@idmtextout
	cmp r8,IDM_LENGTH
		je @@idmlength
	cmp r8,IDM_RECTANGLE
		je @@idmrectangle
	cmp r8,IDM_PEACOCK
		je @@idmpeacock
	cmp r8,IDM_LACES
		je @@idmlaces
	cmp r8,IDM_ABOUT
		je @@idmabout
	jmp @@exit

@@idmdrawtext:
;получим размер рабочей области
	mov rcx,@@hwnd
	lea rdx,lpRect
	call GetClientRect
;выведем строку текста в окно
	mov rcx,memdc
	lea rdx,@@TXT_DRAWTEXT
	mov r8,-1
	lea r9,lpRect
	mov qword ptr [rsp+20h],28h ;DT_SINGLELINE+DT_BOTTOM = 20h+8h
	call DrawTextA
;генерация сообщения WM_PAINT для вывода строки на экран
	mov rcx,@@hwnd
	xor rdx,rdx
	mov r8,1
	call InvalidateRect
	jmp @@exit

@@idmtextout:
;выведем строку текста в окно
	mov rcx,memdc
	mov rdx,0Ah ;10
	mov r8,96h ;150
	lea r9,@@TXT_TEXTOUT
	mov qword ptr [rsp+20h],lenTXT_TEXTOUT
	call TextOutA
;генерация сообщения WM_PAINT для вывода строки на экран
	mov rcx,@@hwnd
	xor rdx,rdx
	xor r8,r8
	call InvalidateRect
	jmp @@exit

@@idmlength:
;вызываем диалоговое окно
	mov rcx,hInst
	lea rdx,lpdlg1
	mov r8,@@hwnd
	lea r9,DialogProc1
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
;установить текущую точку
	mov rcx,memdc
	mov rdx,X_start
	mov r8,Y_start
	xor r9,r9
	call MoveToEx
;вывод линии
	mov rcx,memdc
	mov rdx,X_end
	mov r8,Y_end
	call LineTo
;генерация сообщения WM_PAINT для вывода строки на экран
	mov rcx,@@hwnd
	xor rdx,rdx
	xor r8,r8
	call InvalidateRect
	jmp @@exit

@@idmrectangle:
;вызываем диалоговое окно
	mov rcx,hInst
	lea rdx,lpdlg2
	mov r8,@@hwnd
	lea r9,DialogProc2
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
;отображение координат
	mov rax,X_start
	show_rax
	mov rax,Y_start
	show_rax
	mov rax,X_end
	show_rax
	mov rax,Y_end
	show_rax
;вывод прямоугольника
	mov rcx,memdc
	mov rdx,X_start
	mov r8,Y_start
	mov r9,X_end
	mov rax,Y_end	
	mov qword ptr [rsp+20h],rax
	call Rectangle
;генерация сообщения WM_PAINT для вывода строки на экран
	mov rcx,@@hwnd
	xor rdx,rdx
	xor r8,r8
	call InvalidateRect	
	jmp @@exit

@@idmpeacock:
	mov rcx,@@hwnd
	lea rdx,@@TXT_PEACOCK
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	jmp @@exit

@@idmlaces:
	mov rcx,@@hwnd
	lea rdx,@@TXT_LACES
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	jmp @@exit

@@idmabout:
;вызываем диалоговое окно
	mov rcx,hInst
	lea rdx,lpdlg3
	mov r8,@@hwnd
	lea r9,AboutDialog
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
	jmp @@exit

@@exit:
	mov eax,0
	ret

@@TXT_DRAWTEXT db 'Текст выведен функцией DRAWTEXT',0
@@TXT_TEXTOUT db 'Текст выведен функцией TEXTOUT'
lenTXT_TEXTOUT=$-@@TXT_TEXTOUT
@@TXT_LENGTH db 'IDM_LENGTH',0
@@TXT_RECTANGLE db 'IDM_RECTANGLE',0
@@TXT_PEACOCK db 'IDM_PEACOCK',0
@@TXT_LACES db 'IDM_LACES',0
@@TXT_ABOUT db 'IDM_ABOUT',0	

MenuProc endp

;-------------------DialogProc1----------------------
DialogProc1 proc uses rax rbx rdi rsi, @@hdlg:QWORD, @@message:QWORD, @@wparam:QWORD, @@lparam:QWORD

;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store retrieved Values:
	mov @@hdlg,rcx
	mov @@message,rdx
	mov @@wparam,r8
	mov @@lparam,r9

	cmp rdx,110h ;WM_INITDIALOG
		je @@wminitdialog
	cmp rdx,111h ;WM_COMMAND
		jne @@exit_false
	cmp r8,IDOK
		je @@idok
	cmp r8,IDCANCEL
		je @@idcancel
	jmp @@exit_false

@@wminitdialog:
	jmp @@exit_true

@@idok:
;прочитаем X_start
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT1
	lea r8,X_start
	mov r9,5
	call GetDlgItemTextA
	mov rcx,@@hdlg
	lea rdx,X_start
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	sim4_to_RAXbin X_start
;прочитаем Y_start
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT2
	lea r8,Y_start
	mov r9,5
	call GetDlgItemTextA
	mov rcx,@@hdlg
	lea rdx,Y_start
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	sim4_to_RAXbin Y_start
;прочитаем X_end
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT3
	lea r8,X_end
	mov r9,5
	call GetDlgItemTextA
	mov rcx,@@hdlg
	lea rdx,X_end
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	sim4_to_RAXbin X_end
;прочитаем Y_end
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT4
	lea r8,Y_end
	mov r9,5
	call GetDlgItemTextA
	mov rcx,@@hdlg
	lea rdx,Y_end
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	sim4_to_RAXbin Y_end
;завершаем диалог
	mov rcx,@@hdlg
	xor rdx,rdx
	call EndDialog
	jmp @@exit_true

@@idcancel:
	mov rcx,@@hdlg
	xor rdx,rdx
	call EndDialog
	jmp @@exit_true

@@exit_false:
	xor rax,rax
	ret
@@exit_true:
	mov rax,1
	ret
DialogProc1 endp

;-------------------DialogProc2----------------------
DialogProc2 proc uses rax rbx rdi rsi, @@hdlg:QWORD, @@message:QWORD, @@wparam:QWORD, @@lparam:QWORD

;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store retrieved Values:
	mov @@hdlg,rcx
	mov @@message,rdx
	mov @@wparam,r8
	mov @@lparam,r9

	cmp rdx,110h ;WM_INITDIALOG
		je @@wminitdialog
	cmp rdx,111h ;WM_COMMAND
		jne @@exit_false
	cmp r8,IDOK
		je @@idok
	cmp r8,IDCANCEL
		je @@idcancel
	jmp @@exit_false

@@wminitdialog:
	jmp @@exit_true

@@idok:
;прочитаем X_start
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT1
	lea r8,X_start
	mov r9,5
	call GetDlgItemTextA
	mov rcx,@@hdlg
	lea rdx,X_start
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
mov rax,X_start
Spell64rax 0,szTitleName,szRAX
	sim4_to_RAXbin X_start
;прочитаем Y_start
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT2
	lea r8,Y_start
	mov r9,5
	call GetDlgItemTextA
	mov rcx,@@hdlg
	lea rdx,Y_start
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
mov rax,Y_start
Spell64rax 0,szTitleName,szRAX
	sim4_to_RAXbin Y_start
;прочитаем X_end
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT3
	lea r8,X_end
	mov r9,5
	call GetDlgItemTextA
	mov rcx,@@hdlg
	lea rdx,X_end
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
mov rax,X_end
Spell64rax 0,szTitleName,szRAX
	sim4_to_RAXbin X_end
;прочитаем Y_end
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT4
	lea r8,Y_end
	mov r9,5
	call GetDlgItemTextA
	mov rcx,@@hdlg
	lea rdx,Y_end
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
mov rax,Y_end
Spell64rax 0,szTitleName,szRAX
	sim4_to_RAXbin Y_end
;завершаем диалог
	mov rcx,@@hdlg
	xor rdx,rdx
	call EndDialog
	jmp @@exit_true

@@idcancel:
	mov rcx,@@hdlg
	xor rdx,rdx
	call EndDialog
	jmp @@exit_true

@@exit_false:
	xor rax,rax
	ret
@@exit_true:
	mov rax,1
	ret
DialogProc2 endp

;-------------------AboutDialog----------------------
AboutDialog proc uses rax rbx rdi rsi, @@hdlg:QWORD, @@message:QWORD, @@wparam:QWORD, @@lparam:QWORD

;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store retrieved Values:
	mov @@hdlg,rcx
	mov @@message,rdx
	mov @@wparam,r8
	mov @@lparam,r9

	cmp rdx,110h ;WM_INITDIALOG
		je @@wminitdialog
	cmp rdx,111h ;WM_COMMAND
		jne @@exit_false
	cmp r8,IDOK
		je @@idok
	jmp @@exit_false

@@wminitdialog:
	jmp @@exit_true

@@idok:
	mov rcx,@@hdlg
	xor rdx,rdx
	call EndDialog
	jmp @@exit_true

@@exit_false:
	xor rax,rax
	ret
@@exit_true:
	mov rax,1
	ret
AboutDialog endp

end