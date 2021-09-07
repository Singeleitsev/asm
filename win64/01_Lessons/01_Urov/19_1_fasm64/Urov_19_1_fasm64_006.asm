format PE64 GUI 5.0
entry start

include 'win64a.inc'

;***************************************
section '.text' code readable executable
;***************************************

start:
;начало стартового кода
    sub rsp, 8 ;Make stack dqword aligned
;вызов BOOL GetVersionEx(
;LPOSVERSIONINFO lpVersionInformation   // pointer to version information ;structure)
    invoke GetVersionExA, lpVersionInformation
;далее можно вставить код для анализа информации о версии Windows (Приложение 11)
;вызов LPTSTR GetCommandLine(VOID) - получить указатель на командную строку
    invoke GetCommandLineA
;вызов LPVOID GetEnvironmentStrings (VOID) - получить указатель на блок с переменными ;окружения
    invoke GetEnvironmentStringsA ;в регистре rax адрес (проверить и вставить код)
;вызов VOID GetStartupInfo(LPSTARTUPINFO lpStartupInfo) ;указатель на структуру ;STARTUPINFO
    invoke GetStartupInfoA, lpStartupInfo
;(проверить и вставить код)
;вызов HMODULE GetModuleHandleA (LPCTSTR lpModuleName)
;lpModuleName address of module name to return handle
    invoke GetModuleHandle,0
    mov [wcl.hInstance],rax
;далее hInst будет использоваться в качестве дескриптора данного приложения
;конец стартового кода

WinMain:
;определить класс окна ATOM RegisterClassEx(CONST WNDCLASSEX *lpWndClassEx),
;где *lpWndClassEx - адрес структуры WndClassEx
;для начала инициализируем поля структуры WndClassEx
    mov [wcl.cbSize], 50h ;размер структуры WNDCLASSEX
    mov [wcl.style], CS_HREDRAW or CS_VREDRAW
    mov [wcl.lpfnWndProc], WindowProc ;адрес оконной процедуры
    mov [wcl.cbClsExtra], 0
    mov [wcl.cbWndExtra], 0
    mov rax, [hInst]
;дескриптор приложения в поле hInstance структуры wcl
    mov [wcl.hInstance], rax
;готовим вызов HICON LoadIcon (HINSTANCE hInstance,LPCTSTR lpIconName)
    invoke  LoadIcon, 0,IDI_APPLICATION ;стандартная иконка
    mov [wcl.hIcon], rax   ;дескриптор иконки в поле hIcon структуры wcl
;готовим вызов HCURSOR LoadCursorA (HINSTANCE hInstance,LPCTSTR lpCursorName)
    invoke  LoadCursor, 0,IDC_ARROW  ;стандартный курсор - стрелка
    mov [wcl.hCursor], rax ;дескриптор курсора в поле hCursor структуры wcl
;определим цвет фона окна - белый
;готовим вызов HGDIOBJ GetStockObject(int fnObject)     ;type of stock object
    invoke GetStockObject, WHITE_BRUSH
    mov [wcl.hbrBackground], rax
    mov [wcl.lpszMenuName], 0 ;без главного меню
    mov [wcl.lpszClassName], szClassName  ;имя класса окна
    mov [wcl.hIconSm], 0
;регистрируем класс окна - готовим вызов RegisterClassExA (&wndclass)
    invoke RegisterClassExA, wcl
    test ax,ax ;проверить на успех регистрации класса окна
    jz error ;неудача
;создаем окно:
;готовим вызов HWND CreateWindowExA(
;       DWORD dwExStyle,      // extended window style
;       LPCTSTR lpClassName,  // pointer to registered class name
;       LPCTSTR lpWindowName, // pointer to window name
;       DWORD dwStyle,        // window style
;       int x,                // horizontal position of window
;       int y,                // vertical position of window
;       int nWidth,           // window width
;       int nHeight,          // window height
;       HWND hWndParent,      // handle to parent or owner window
;       HMENU hMenu,          // handle to menu or child-window identifier
;       HANDLE hInstance,     // handle to application instance
;       LPVOID lpParam        // pointer to window-creation data
;       )
    invoke CreateWindowExA, 0, szClassName, szTitleName,\
           WS_OVERLAPPEDWINDOW,\
           CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,\
           NULL, NULL, [hInst], NULL
    mov [hwnd], rax ;hwnd - дескриптор окна
;показать окно:
;готовим вызов BOOL ShowWindow(
;       HWND hWnd,     // handle to window
;       int nCmdShow   // show state of window
;       )
    invoke ShowWindow, [hwnd], 1 ;nCmdShow = SW_SHOWNORMAL = 1
;перерисовываем содержимое окна
;готовим вызов BOOL UpdateWindow(
;       HWND hWnd   // handle of window
;       )
    invoke UpdateWindow, [hwnd]
;запускаем цикл сообщений:
;готовим вызов BOOL GetMessageA(
;       LPMSG lpMsg,         // address of structure with message
;       HWND hWnd,           // handle of window
;       UINT wMsgFilterMin,  // first message
;       UINT wMsgFilterMax   // last message
;       )
cycl_msg:
    invoke  GetMessage, msg, NULL, 0, 0
    cmp     ax,0
    je      end_cycl_msg
;трансляция ввода с клавиатуры
;готовим вызов BOOL TranslateMessage(
;       CONST MSG *lpMsg   // address of structure with message
;       );
    invoke  TranslateMessage, msg
;отправим сообщение оконной процедуре
;готовим вызов LONG DispatchMessage(
;       CONST MSG *lpmsg   // pointer to structure with message
;       )
    invoke  DispatchMessage, msg
    jmp     cycl_msg

error:
    invoke  MessageBox, NULL, _error, NULL, MB_ICONERROR or MB_OK

end_cycl_msg:
;выход из приложения
;готовим вызов VOID ExitProcess(
;       UINT uExitCode   // exit code for all threads
;       )
    invoke  ExitProcess,0

;-------------------WindowProc--------------------------
proc WindowProc uses rbx rsi rdi, hwnd,mes,wparam,lparam

;Store Values retrieved by DispatchMessageA
    mov [hwnd], rcx
    mov [mes], rdx
    mov [wparam], r8
    mov [lparam], r9

;Window Messages processing
    cmp [mes],WM_DESTROY
        je wmdestroy
    cmp [mes],WM_CREATE
        je wmcreate
    cmp [mes],WM_PAINT
        je wmpaint
    jmp default

wmcreate:
;обозначим создание окна звуковым эффектом
;готовим вызов функции BOOL PlaySound(
; LPCSTR pszSound,
; HMODULE hmod,
; DWORD fdwSound
; )
    invoke PlaySound, playFileCreate, 0, 0;SND_SYNC or SND_FILENAME
    mov rax,0   ;возвращаемое значение 0
    jmp exit_wndproc

wmpaint:
    invoke PlaySound, playFilePaint, 0, 0;SND_SYNC or SND_FILENAME
;получим контекст устройства
;HDC BeginPaint( HWND hwnd, // handle to window
;LPPAINTSTRUCT lpPaint // pointer to structure for paint information);
    invoke BeginPaint, [hwnd], ps
    mov [hdc], rax
;выведем строку текста в окно BOOL TextOut(
; HDC hdc,           // handle to device context
; int nXStart,       // x-coordinate of starting position
; int nYStart,       // y-coordinate of starting position
; LPCTSTR lpString,  // pointer to string
; int cbString       // number of characters in string);
    invoke TextOutA, [hdc], 10, 100, MesWindow, MesWindowLen
;освободить контекст BOOL EndPaint(
; HWND hWnd, // handle to window
; CONST PAINTSTRUCT *lpPaint // pointer to structure for paint data);
    invoke EndPaint, [hdc], ps
    mov rax, 0 ;возвращаемое значение 0
    jmp exit_wndproc

wmdestroy:
    invoke PlaySound, playFileDestroy, 0, 0;SND_SYNC or SND_FILENAME
;послать сообщение WM_QUIT
;готовим вызов VOID PostQuitMessage(
; int nExitCode   // exit code
; )
    invoke PostQuitMessage,0
    mov rax, 0 ;возвращаемое значение 0
    jmp exit_wndproc

default:
;обработка по умолчанию
;готовим вызов LRESULT DefWindowProc(
; HWND hWnd,      // handle to window
; UINT Msg,       // message identifier
; WPARAM wParam,  // first message parameter
; LPARAM lParam   // second message parameter
; )
    invoke DefWindowProcA, [hwnd], [mes], [wparam], [lparam]
    jmp exit_wndproc

exit_wndproc:
    ret
endp ;WindowProc


;**************************************
section '.data' data readable writeable
;**************************************
    hwnd dq ?
    hInst dq ?
    hdc dq ?

    szClassName db 'Приложение Win64',0
    szTitleName db 'Каркасное приложение Win64 на ассемблере',0
    MesWindow db 'Привет! Ну как вам процесс разработки приложения на ассемблере?',0
    MesWindowLen = $-MesWindow

    playFileCreate db 'create.wav',0
    playFilePaint db 'paint.wav',0
    playFileDestroy db 'destroy.wav',0

    _error TCHAR 'Startup failed.',0

    lpVersionInformation OSVERSIONINFO
    lpStartupInfo STARTUPINFO
    wcl WNDCLASSEX
    msg MSG
    ps PAINTSTRUCT

section '.idata' import data readable writeable

    library kernel32,'KERNEL32.DLL',\
            user32,'USER32.DLL',\
            gdi32, 'GDI32.DLL',\
            winmm, 'WINMM.DLL'

    include 'api\kernel32.inc'
    include 'api\user32.inc'
    include 'api\gdi32.inc'

    import winmm,PlaySound,'PlaySound'