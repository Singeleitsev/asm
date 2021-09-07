format PE64 GUI 5.0
entry start

include 'win64a.inc'

;***************************************
section '.text' code readable executable
;***************************************

start:
;������ ���������� ����
    sub rsp, 8 ;Make stack dqword aligned
;����� BOOL GetVersionEx(
;LPOSVERSIONINFO lpVersionInformation   // pointer to version information ;structure)
    invoke GetVersionExA, lpVersionInformation
;����� ����� �������� ��� ��� ������� ���������� � ������ Windows (���������� 11)
;����� LPTSTR GetCommandLine(VOID) - �������� ��������� �� ��������� ������
    invoke GetCommandLineA
;����� LPVOID GetEnvironmentStrings (VOID) - �������� ��������� �� ���� � ����������� ;���������
    invoke GetEnvironmentStringsA ;� �������� rax ����� (��������� � �������� ���)
;����� VOID GetStartupInfo(LPSTARTUPINFO lpStartupInfo) ;��������� �� ��������� ;STARTUPINFO
    invoke GetStartupInfoA, lpStartupInfo
;(��������� � �������� ���)
;����� HMODULE GetModuleHandleA (LPCTSTR lpModuleName)
;lpModuleName address of module name to return handle
    invoke GetModuleHandle,0
    mov [wcl.hInstance],rax
;����� hInst ����� �������������� � �������� ����������� ������� ����������
;����� ���������� ����

WinMain:
;���������� ����� ���� ATOM RegisterClassEx(CONST WNDCLASSEX *lpWndClassEx),
;��� *lpWndClassEx - ����� ��������� WndClassEx
;��� ������ �������������� ���� ��������� WndClassEx
    mov [wcl.cbSize], 50h ;������ ��������� WNDCLASSEX
    mov [wcl.style], CS_HREDRAW or CS_VREDRAW
    mov [wcl.lpfnWndProc], WindowProc ;����� ������� ���������
    mov [wcl.cbClsExtra], 0
    mov [wcl.cbWndExtra], 0
    mov rax, [hInst]
;���������� ���������� � ���� hInstance ��������� wcl
    mov [wcl.hInstance], rax
;������� ����� HICON LoadIcon (HINSTANCE hInstance,LPCTSTR lpIconName)
    invoke  LoadIcon, 0,IDI_APPLICATION ;����������� ������
    mov [wcl.hIcon], rax   ;���������� ������ � ���� hIcon ��������� wcl
;������� ����� HCURSOR LoadCursorA (HINSTANCE hInstance,LPCTSTR lpCursorName)
    invoke  LoadCursor, 0,IDC_ARROW  ;����������� ������ - �������
    mov [wcl.hCursor], rax ;���������� ������� � ���� hCursor ��������� wcl
;��������� ���� ���� ���� - �����
;������� ����� HGDIOBJ GetStockObject(int fnObject)     ;type of stock object
    invoke GetStockObject, WHITE_BRUSH
    mov [wcl.hbrBackground], rax
    mov [wcl.lpszMenuName], 0 ;��� �������� ����
    mov [wcl.lpszClassName], szClassName  ;��� ������ ����
    mov [wcl.hIconSm], 0
;������������ ����� ���� - ������� ����� RegisterClassExA (&wndclass)
    invoke RegisterClassExA, wcl
    test ax,ax ;��������� �� ����� ����������� ������ ����
    jz error ;�������
;������� ����:
;������� ����� HWND CreateWindowExA(
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
    mov [hwnd], rax ;hwnd - ���������� ����
;�������� ����:
;������� ����� BOOL ShowWindow(
;       HWND hWnd,     // handle to window
;       int nCmdShow   // show state of window
;       )
    invoke ShowWindow, [hwnd], 1 ;nCmdShow = SW_SHOWNORMAL = 1
;�������������� ���������� ����
;������� ����� BOOL UpdateWindow(
;       HWND hWnd   // handle of window
;       )
    invoke UpdateWindow, [hwnd]
;��������� ���� ���������:
;������� ����� BOOL GetMessageA(
;       LPMSG lpMsg,         // address of structure with message
;       HWND hWnd,           // handle of window
;       UINT wMsgFilterMin,  // first message
;       UINT wMsgFilterMax   // last message
;       )
cycl_msg:
    invoke  GetMessage, msg, NULL, 0, 0
    cmp     ax,0
    je      end_cycl_msg
;���������� ����� � ����������
;������� ����� BOOL TranslateMessage(
;       CONST MSG *lpMsg   // address of structure with message
;       );
    invoke  TranslateMessage, msg
;�������� ��������� ������� ���������
;������� ����� LONG DispatchMessage(
;       CONST MSG *lpmsg   // pointer to structure with message
;       )
    invoke  DispatchMessage, msg
    jmp     cycl_msg

error:
    invoke  MessageBox, NULL, _error, NULL, MB_ICONERROR or MB_OK

end_cycl_msg:
;����� �� ����������
;������� ����� VOID ExitProcess(
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
;��������� �������� ���� �������� ��������
;������� ����� ������� BOOL PlaySound(
; LPCSTR pszSound,
; HMODULE hmod,
; DWORD fdwSound
; )
    invoke PlaySound, playFileCreate, 0, 0;SND_SYNC or SND_FILENAME
    mov rax,0   ;������������ �������� 0
    jmp exit_wndproc

wmpaint:
    invoke PlaySound, playFilePaint, 0, 0;SND_SYNC or SND_FILENAME
;������� �������� ����������
;HDC BeginPaint( HWND hwnd, // handle to window
;LPPAINTSTRUCT lpPaint // pointer to structure for paint information);
    invoke BeginPaint, [hwnd], ps
    mov [hdc], rax
;������� ������ ������ � ���� BOOL TextOut(
; HDC hdc,           // handle to device context
; int nXStart,       // x-coordinate of starting position
; int nYStart,       // y-coordinate of starting position
; LPCTSTR lpString,  // pointer to string
; int cbString       // number of characters in string);
    invoke TextOutA, [hdc], 10, 100, MesWindow, MesWindowLen
;���������� �������� BOOL EndPaint(
; HWND hWnd, // handle to window
; CONST PAINTSTRUCT *lpPaint // pointer to structure for paint data);
    invoke EndPaint, [hdc], ps
    mov rax, 0 ;������������ �������� 0
    jmp exit_wndproc

wmdestroy:
    invoke PlaySound, playFileDestroy, 0, 0;SND_SYNC or SND_FILENAME
;������� ��������� WM_QUIT
;������� ����� VOID PostQuitMessage(
; int nExitCode   // exit code
; )
    invoke PostQuitMessage,0
    mov rax, 0 ;������������ �������� 0
    jmp exit_wndproc

default:
;��������� �� ���������
;������� ����� LRESULT DefWindowProc(
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

    szClassName db '���������� Win64',0
    szTitleName db '��������� ���������� Win64 �� ����������',0
    MesWindow db '������! �� ��� ��� ������� ���������� ���������� �� ����������?',0
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