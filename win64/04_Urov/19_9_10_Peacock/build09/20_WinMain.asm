WinMain:

;Инициализируем поля структуры WndClassEx
	mov wcl.cbSize,50h ;размер структуры WNDCLASSEX в wcl.cbSize
	mov wcl.style,3 ;CS_HREDRAW+CS_VREDRAW
;Адрес оконной процедуры
	m64addr wcl.lpfnWndProc,WindowProc
;Дополнительное место не используем
	mov wcl.cbClsExtra,0
	mov wcl.cbWndExtra,0
;Дескриптор приложения в поле hInstance структуры wcl
	m64m64 wcl.hInstance,hInst
;Готовим вызов HICON LoadIcon (HINSTANCE hInstance,LPCTSTR lpIconName)
	Call2 LoadIconA,0,7F00h ;IDI_APPLICATION
	mov wcl.hIcon,rax ;дескриптор иконки в поле hIcon структуры wcl
;Готовим вызов HCURSOR LoadCursorA (HINSTANCE hInstance,LPCTSTR lpCursorName)
	Call2 LoadCursorA,0,7F00h ;IDC_ARROW
	mov wcl.hCursor,rax ;дескриптор курсора в поле hCursor структуры wcl
;Определим цвет фона окна - белый (WHITE_BRUSH)
;Готовим вызов HGDIOBJ GetStockObject(int fnObject) ;type of stock object
	Call1 GetStockObject,0 ;WHITE_BRUSH = 0
	mov wcl.hbrBackground,rax
;Подключаем меню
	m64addr wcl.lpszMenuName,lpmenu
;Имя класса окна
	m64addr wcl.lpszClassName,szClassName
	mov wcl.hIconSm,0
;Регистрируем класс окна - готовим вызов RegisterClassExA (&wndclass)
	Call1 RegisterClassExA,offset wcl
	test rax,rax ;проверить на успех регистрации класса окна
	jz errWinMain	;неудача

;Создаем окно:
;Готовим вызов HWND CreateWindowExA(
	sub rsp,60h
;DWORD dwExStyle, // extended window style
	xor rcx,rcx
;LPCTSTR lpClassName, // pointer to registered class name
	lea rdx,szClassName
;LPCTSTR lpWindowName, // pointer to window name
	lea r8,szTitleName
;DWORD dwStyle, // window style
	mov r9,0CF0000h ;WS_OVERLAPPEDWINDOW
;int x, // horizontal position of window
	mov rax,80000000h ;CW_USEDEFAULT
	mov qword ptr [rsp+20h],rax
;int y, // vertical position of window
	mov qword ptr [rsp+28h],rax
;int nWidth, // window width
	mov qword ptr [rsp+30h],rax
;int nHeight, // window height
	mov qword ptr [rsp+38h],rax
;HWND hWndParent, // handle to parent or owner window
	mov qword ptr [rsp+40h],0
;HMENU hMenu, // handle to menu or child-window identifier
	mov qword ptr [rsp+48h],0
;HANDLE hInstance, // handle to application instance
	m64m64 qword ptr [rsp+50h],hInst
;LPVOID lpParam) // pointer to window-creation data
	mov qword ptr [rsp+58h],0
	call CreateWindowExA
	add rsp,60h
	mov hwnd,rax ;hwnd - дескриптор окна

;показать окно:
;готовим вызов BOOL ShowWindow(
;	HWND hWnd,     // handle to window
;	int nCmdShow)  // show state of window
	Call2 ShowWindow,hwnd,1 ;SW_SHOWNORMAL
;перерисовываем содержимое окна
;готовим вызов BOOL UpdateWindow(
;	HWND hWnd)   // handle of window
	Call1 UpdateWindow,hwnd

cycl_msg:
;запускаем цикл сообщений:
	sub rsp,20h
;готовим вызов BOOL GetMessageA(
;LPMSG lpMsg, // address of structure with message
	lea rcx,message
;HWND hWnd, // handle of window
	xor rdx,rdx
;UINT wMsgFilterMin, // first message
	xor r8,r8
;UINT wMsgFilterMax) // last message
	xor r9,r9
	call GetMessageA
	add rsp,20h
	cmp ax,0
	je endWinMain
;трансляция ввода с клавиатуры
	sub rsp,20h
	lea rcx,message
	call TranslateMessage
	;add rsp,20h
;отправим сообщение оконной процедуре
	;sub rsp,20h
	lea rcx,message
	call DispatchMessageA
	add rsp,20h
jmp cycl_msg

errWinMain:

;выход из приложения
endWinMain:
;готовим вызов VOID ExitProcess(UINT uExitCode)   // exit code for all threads
	Call1 ExitProcess,0
