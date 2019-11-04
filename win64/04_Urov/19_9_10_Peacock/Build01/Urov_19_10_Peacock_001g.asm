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
	include include\Spell_09.inc
	include include\Mem_03.inc
	include include\Call_02.inc
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
;Peacock Constants
	x1 dq 1
	x2 dq 0
	y2 dq 0
	i30 dw 30
	i90 dw 90
	i100 dw 100
	i120 dw 120
	icenter dq 100
	icycl dq 319
;Laces Constants
	N equ 18 ;N is number of Vertices
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
;закоментированные ниже функции можно при необходимости раскоментировать, но 
;они не являются обязательными в данной программе
;вызов BOOL GetVersionEx(LPOSVERSIONINFO lpVersionInformation)   // pointer to version information ;structure
;	Call1 GetVersionExA,offset lpVersionInformation
;далее можно вставить код для анализа информации о версии Windows (Приложение 11)
;вызов LPTSTR GetCommandLine(VOID) - получить указатель на командную строку
;	call GetCommandLineA	
;в регистре eax адрес (проверить и вставить код)
;вызов LPVOID GetEnvironmentStrings (VOID) - получить указатель на блок с переменными ;окружения
;	call GetEnvironmentStringsA	
;в регистре eax адрес (проверить и вставить код)
;вызов VOID GetStartupInfo(LPSTARTUPINFO lpStartupInfo) ;указатель на структуру STARTUPINFO
;	Call1 GetStartupInfoA,offset lpStartupInfo
;(проверить и вставить код)
;вызов HMODULE GetModuleHandleA (LPCTSTR lpModuleName)
;lpModuleName address of module name to return handle 
	Call1 GetModuleHandleA,0 ;получить значение базового адреса 
	mov hInst,rax ;по которому загружен модуль.
;далее hInst будет использоваться в качестве дескриптора данного приложения
;конец стартового кода

WinMain:
;определить класс окна ATOM RegisterClassEx(CONST WNDCLASSEX *lpWndClassEx),
;где *lpWndClassEx - адрес структуры WndClassEx
;для начала инициализируем поля структуры WndClassEx
	mov wcl.cbSize,50h ;qword ptr sizeof WNDCLASSEX32 ;размер структуры
	mov wcl.style, 3 ;CS_HREDRAW+CS_VREDRAW
;адрес оконной процедуры
	m64addr wcl.lpfnWndProc,WindowProc
;дополнительное место не используем
	mov wcl.cbClsExtra,0
	mov wcl.cbWndExtra,0
;дескриптор приложения в поле hInstance структуры wcl
	m64m64 wcl.hInstance,hInst
;готовим вызов HICON LoadIcon (HINSTANCE hInstance,LPCTSTR lpIconName)
	Call2 LoadIconA,0,7F00h ;IDI_APPLICATION
	mov wcl.hIcon,rax ;дескриптор иконки в поле hIcon структуры wcl
;готовим вызов HCURSOR LoadCursorA (HINSTANCE hInstance,LPCTSTR lpCursorName)
	Call2 LoadCursorA,0,7F00h ;IDC_ARROW
	mov wcl.hCursor,rax ;дескриптор курсора в поле hCursor структуры wcl
;определим цвет фона окна - белый
;готовим вызов HGDIOBJ GetStockObject(int fnObject) ;type of stock object
	Call1 GetStockObject,0 ;WHITE_BRUSH = 0
	mov wcl.hbrBackground,rax
;подключаем меню
	mov wcl.lpszMenuName,MYMENU
;имя класса окна
	m64addr wcl.lpszClassName,szClassName
	mov wcl.hIconSm,0
;регистрируем класс окна - готовим вызов RegisterClassExA (&wndclass)
	Call1 RegisterClassExA,offset wcl
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
	m64m64 qword ptr [rsp+50h],hInst ;hInstance
	mov qword ptr [rsp+58h],0 ;lpParam
	call CreateWindowExA
	mov hwnd,rax ;hwnd - дескриптор окна

;показать окно:
	Call2 ShowWindow,hwnd,1 ;SW_SHOWNORMAL
;перерисовываем содержимое окна
	Call1 UpdateWindow,hwnd

;запускаем цикл сообщений:
cycl_msg:
;время критично, макросы не используем
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

end_cycl_msg:

;выход из приложения
	Call1 ExitProcess,0
start endp



;-------------------WindowProc-----------------------------------------------
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
	Call1 GetSystemMetrics,0 ;SM_CXSCREEN = 0
	mov maxX,rax
	Call1 GetSystemMetrics,1 ;SM_CYSCREEN = 1
	mov maxY,rax
;получить контекст устройства окна на экране
	Call1 GetDC,@@hwnd
	mov @@hdc,rax
;получить совместимый контекст устройства памяти 
	Call1 CreateCompatibleDC,@@hdc
	mov memdc,rax ;!!! memdc - глобальная переменная
;получить дескриптор растрового изображения в памяти
	Call3 CreateCompatibleBitmap,@@hdc,maxX,maxY
	mov @@hbit,rax
;выбираем растр в контекст памяти
	Call2 SelectObject,memdc,@@hbit
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти
	Call1 GetStockObject,2 ;GRAY_BRUSH = 2
	mov @@hbrush,rax
;выбираем кисть в контекст памяти
	Call2	SelectObject,memdc,@@hbrush
;заполняем выбранной кистью виртуальное окно
	mov rcx,memdc ;handle to device context
	xor rdx,rdx ;x-coord. of upper-left corner of rect. to be filled
	xor r8,r8 ;y-coord. of upper-left corner of rect. to be filled
	mov r9,maxX ;width of rectangle to be filled
	m64m64 qword ptr [rsp+20h],maxY ;height of rectangle to be filled
	mov qword ptr [rsp+28h],0F00021h ;raster operation code = dest = pattern = PATCOPY
	call PatBlt
;освободим контекст устройства ReleaseDC(@@hwnd,@@hdc)
	Call2	ReleaseDC,@@hwnd,@@hdc
;обозначим создание окна звуковым эффектом
	Call3 PlaySoundA,offset playFileCreate,0,0 ;SND_SYNC+SND_FILENAME = 0
;возвращаем значение 0
	mov	rax,0	
	jmp	exit_wndproc

wmpaint:
;получим контекст устройства
	Call2 BeginPaint,@@hwnd,offset ps
	mov @@hdc,rax
;обозначим перерисовку окна звуковым эффектом
	Call3 PlaySoundA,offset playFilePaint,0,0 ;SND_SYNC+SND_FILENAME = 0
;выведем строку текста в окно
	Call5 TextOutA,memdc,0Ah,12Ch,offset MesWindow,MesWindowLen
;вывод виртуального окна в реальное окно
	mov rcx,@@hdc ;handle to destination device context
	xor rdx,rdx ;x-coordinate of destination rectangle's upper-left corner
	xor r8,r8 ;y-coordinate of destination rectangle's upper-left corner
	mov r9,maxX ;width of destination rectangle
	m64m64 qword ptr [rsp+20h],maxY ;height of destination rectangle
	m64m64 qword ptr [rsp+28h],memdc ;handle to source device context
	mov qword ptr [rsp+30h],0 ;x-coordinate of source rectangle's upper-left corner
	mov qword ptr [rsp+38h],0 ;y-coordinate of source rectangle's upper-left corner
	mov qword ptr [rsp+40h],0CC0020h ;raster operation code = dest = source = SRCCOPY
	call BitBlt
;освободить контекст BOOL EndPaint( 
	Call2 EndPaint,@@hwnd,offset ps
	mov rax,0 ;возвращаемое значение 0
	jmp exit_wndproc

wmdestroy:
;удалить виртуальное окно
	Call1 DeleteDC,memdc
;обозначим завершение работы приложения звуковым эффектом
	Call3 PlaySoundA,offset playFileDestroy,0,0 ;SND_SYNC+SND_FILENAME = 0
;послать сообщение WM_QUIT
	Call1 PostQuitMessage,0
	mov rax,0 ;возвращаемое значение 0
	jmp exit_wndproc

wmcommand:
;вызов процедуры обработки сообщений от меню
	Call4 MenuProc,@@hwnd,@@wparam,@@hdc,@@hbrush
	jmp exit_wndproc

default:
;обработка по умолчанию
	Call4 DefWindowProcA,@@hwnd,@@mes,@@wparam,@@lparam
	jmp exit_wndproc
;... ... ...
exit_wndproc:
	ret
WindowProc	endp



;-------------------MenuProc-----------------------------------------------
;обработка сообщений от меню
MenuProc proc @@hwnd:QWORD, @@wparam:QWORD
local @@hdc:QWORD,@@hbrush:QWORD
;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax
;Store retrieved Values:
	mov @@hwnd,rcx
	mov @@wparam,rdx
	mov @@hdc,r8
	mov @@hbrush,r9
;r8 is the proper place for wParam
	mov r8,rdx
;Select Command
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
	Call2 GetClientRect,@@hwnd,offset lpRect
;выведем строку текста в окно
	mov rcx,memdc ;handle to device context
	lea rdx,@@TXT_DRAWTEXT ;pointer to string to draw
	mov r8,-1 ;string length, in characters
	lea r9,lpRect ;pointer to struct with formatting dimensions
	mov qword ptr [rsp+20h],28h ;text-drawing flags DT_SINGLELINE+DT_BOTTOM = 20h+8h
	call DrawTextA
;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,1
	jmp	@@exit

@@idmtextout:
;выведем строку текста в окно  
	mov rcx,memdc ;handle to device context
	mov rdx,0Ah ;x-coordinate of starting position
	mov r8,96h ;y-coordinate of starting position
	lea r9,@@TXT_TEXTOUT ;pointer to string
	mov qword ptr [rsp+20h],lenTXT_TEXTOUT ;number of characters in string
	call TextOutA
;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0
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
	Call4 MoveToEx,memdc,X_start,Y_start,0 ;offset pt = 0

;вывод линии
	Call3 LineTo,memdc,X_end,Y_end

;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0
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
	m64m64 qword ptr [rsp+20h],Y_end
	call Rectangle
;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0
	jmp @@exit

@@idmpeacock: ;"Павлин"
;очистим окно
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти hbrush=GetStockObject(GRAY_BRUSH)
	Call1 GetStockObject,2 ;GRAY_BRUSH = 2
	mov @@hbrush,rax
;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	Call2 SelectObject,memdc,@@hbrush
;заполняем выбранной кистью виртуальное окно
	mov rcx,memdc ;handle to device context
	xor rdx,rdx ;x-coord. of upper-left corner of rect. to be filled
	xor r8,r8 ;y-coord. of upper-left corner of rect. to be filled
	mov r9,maxX ;width of rectangle to be filled
	m64m64 qword ptr [rsp+20h],maxY ;height of rectangle to be filled
	mov qword ptr [rsp+28h],0F00021h ;raster operation code = dest = pattern = PATCOPY
	call PatBlt
;готовим цикл
	xor rcx,rcx
	mov rcx,icycl
	push rcx	
@@m1:	
	finit
;вычислим x2=120+100*sin(x1/30)
	pop rcx
	mov x1,rcx
	cmp rcx,0	
		je @@m2
	dec rcx
	push rcx
	fild x1
	fidiv i30
	fsin
	fimul i100
	fiadd i120
	fistp x2
;вычислим y2=120+100*cos(x1/30)
	fild x1
	fidiv i30
	fcos
	fimul i100
	fiadd i90
	fistp y2
;рисуем отрезок:
	Call4 MoveToEx,memdc,x1,icenter,0
	Call3 LineTo,memdc,x2,y2
;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0
	jmp @@m1
@@m2:
	jmp @@exit

@@idmlaces: ;"Кружева"
;очистим окно
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти
	Call1 GetStockObject,2 ;GRAY_BRUSH = 2
	mov @@hbrush,rax
;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	Call2 SelectObject,memdc,@@hbrush
;заполняем выбранной кистью виртуальное окно
	mov rcx,memdc ;handle to device context
	xor rdx,rdx ;x-coord. of upper-left corner of rect. to be filled
	xor r8,r8 ;y-coord. of upper-left corner of rect. to be filled
	mov r9,maxX ;width of rectangle to be filled
	m64m64 qword ptr [rsp+20h],maxY ;height of rectangle to be filled
	mov qword ptr [rsp+28h],0F00021h ;raster operation code = dest = pattern = PATCOPY
	call PatBlt
;вычислим DTT=2*Пи/N
	finit
	fldpi
	fidiv i_N
	fimul i2
	fistp DTT
	mov t,0
	mov i,0
;заполняем массивы masX и masY координатами вершин прямоугольника
@@m3:	
	mov rax,qword ptr i
	add eax,DTT
	mov t,eax
	
	fild t
	fcos	
	fimul R
	mov rsi,qword ptr i
	fistp masX[rsi*4]
	add masX[rsi*4],Xc

	fild t
	fsin	
	fimul R
	fistp masY[rsi*4]
	mov rax,qword ptr Yc
	sub eax,masY[rsi*4]
	mov masY[rsi*4],eax

	inc i
	cmp i,N
		jl @@m3
;соединим вершины многоугольника:
	mov i,0
@@m5:
	mov rax,qword ptr i
	mov j,eax
@@m4:	inc j	
;рисуем отрезок:
	mov rsi,qword ptr i
	mov rcx,memdc
	mov rdx,qword ptr masX[rsi*4]
	mov r8,qword ptr masY[rsi*4]
	xor r9,r9
	call MoveToEx

	mov rdi,qword ptr j
	mov rcx,memdc
	mov rdx,qword ptr masX[rdi*4]
	mov r8,qword ptr masY[rdi*4]
	call LineTo

	cmp j,N
		jl @@m4
	inc i
	cmp i,N
		jl @@m5
;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0	
	jmp	@@exit

@@idmabout:
;вызываем диалоговое окно 
	mov rcx,hInst
	lea rdx,lpdlg3
	mov r8,@@hwnd
	lea r9,AboutDialog
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
	jmp @@exit

;... ... ...

@@exit:
	mov	eax,0
	ret
@@TXT_TEXTOUT db 'Текст выведен функцией TEXTOUT'
lenTXT_TEXTOUT=$-@@TXT_TEXTOUT	
@@TXT_DRAWTEXT db 'Текст выведен функцией DRAWTEXT',0
MenuProc endp



;-----------------DialogProc1-----------------------------------------
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
	jmp	@@exit_true

@@idok:
;прочитаем X_start
	Call4 GetDlgItemTextA,@@hdlg,IDC_EDIT1,offset X_start,5
	Call4 MessageBoxA,@@hdlg,offset X_start,offset szTitleName,40h ;MB_ICONINFORMATION+MB_OK
	sim4_to_RAXbin X_start	
;прочитаем Y_start 
	Call4 GetDlgItemTextA,@@hdlg,IDC_EDIT2,offset Y_start,5
	Call4 MessageBoxA,@@hdlg,offset Y_start,offset szTitleName,40h ;MB_ICONINFORMATION+MB_OK
	sim4_to_RAXbin Y_start	
;прочитаем X_end
	Call4 GetDlgItemTextA,@@hdlg,IDC_EDIT3,offset X_end,5
	Call4 MessageBoxA,@@hdlg,offset X_end,offset szTitleName,40h ;MB_ICONINFORMATION+MB_OK
	sim4_to_RAXbin X_end		
;прочитаем Y_end
	Call4 GetDlgItemTextA,@@hdlg,IDC_EDIT4,offset Y_end,5
	Call4 MessageBoxA,@@hdlg,offset Y_end,offset szTitleName,40h ;MB_ICONINFORMATION+MB_OK
	sim4_to_RAXbin Y_end
;завершаем диалог		
	Call2 EndDialog,@@hdlg,0
	jmp @@exit_true
	
@@idcancel:
	Call2 EndDialog,@@hdlg,0
	jmp @@exit_true

@@exit_false:
	mov rax,0
	ret

@@exit_true:
	mov rax,1
	ret
DialogProc1 endp



;-----------------DialogProc2-----------------------------------------
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
	Call4 GetDlgItemTextA,@@hdlg,IDC_EDIT1,offset X_start,5
	Call4 MessageBoxA,@@hdlg,offset X_start,offset szTitleName,40h ;MB_ICONINFORMATION+MB_OK
	sim4_to_RAXbin X_start	
;прочитаем Y_start 
	Call4 GetDlgItemTextA,@@hdlg,IDC_EDIT2,offset Y_start,5
	Call4 MessageBoxA,@@hdlg,offset Y_start,offset szTitleName,40h ;MB_ICONINFORMATION+MB_OK
	sim4_to_RAXbin Y_start	
;прочитаем X_end
	Call4 GetDlgItemTextA,@@hdlg,IDC_EDIT3,offset X_end,5
	Call4 MessageBoxA,@@hdlg,offset X_end,offset szTitleName,40h ;MB_ICONINFORMATION+MB_OK
	sim4_to_RAXbin X_end		
;прочитаем Y_end
	Call4 GetDlgItemTextA,@@hdlg,IDC_EDIT4,offset Y_end,5
	Call4 MessageBoxA,@@hdlg,offset Y_end,offset szTitleName,40h ;MB_ICONINFORMATION+MB_OK
	sim4_to_RAXbin Y_end
;завершаем диалог		
	Call2 EndDialog,@@hdlg,0
	jmp @@exit_true
	
@@idcancel:
	Call2 EndDialog,@@hdlg,0
	jmp @@exit_true

@@exit_false:
	mov rax,0
	ret

@@exit_true:
	mov rax,1
	ret
DialogProc2 endp



;-----------------AboutDialog-----------------------------------------
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
	Call2 EndDialog,@@hdlg,0
	jmp @@exit_true

@@exit_false:
	xor rax,rax
	ret

@@exit_true:
	mov rax,1
	ret
AboutDialog endp

end
