;/*--------------------------------------------------------
;HELLOWIN.C -- Displays "Hello, Windows 95!" in client area
;(c) Charles Petzold, 1996
;--------------------------------------------------------*/

format PE64 GUI 5.0
entry Start

include 'win64a.inc'

section '.text' code readable executable

Start:
    sub rsp, 8 ;Make stack dqword aligned

        invoke  GetModuleHandle, 0
        mov     [hInstance],rax

WinMain:
    ;wndclass.cbSize = sizeof(wndclass);
        mov [wndclass.cbSize], 50h
    ;wndclass.style = CS_HREDRAW | CS_VREDRAW;
        mov [wndclass.style], 3
    ;wndclass.lpfnWndProc = WndProc;
        mov [wndclass.lpfnWndProc], WndProc
    ;wndclass.cbClsExtra = 0;
        mov [wndclass.cbClsExtra], 0
    ;wndclass.cbWndExtra = 0;
        mov [wndclass.cbWndExtra], 0
    ;wndclass.hInstance = hInstance;
        ;mov rax, [hInstance] ;this value is already in rax
        mov [wndclass.hInstance], rax
    ;wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
        invoke LoadIcon, 0, 7F00h ;IDI_APPLICATION = 32512 = 7F00h
        mov [wndclass.hIcon], rax
        mov [wndclass.hIconSm], rax
    ;wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);
        invoke LoadCursor, 0, 7F00h ;IDC_ARROW = 32512 = 7F00h
        mov [wndclass.hCursor], rax
    ;wndclass.hbrBackground =(HBRUSH) GetStockObject(WHITE_BRUSH);
        invoke GetStockObject, WHITE_BRUSH
        mov [wndclass.hbrBackground], rax
    ;wndclass.lpszMenuName = NULL;
        mov [wndclass.lpszMenuName], 0 ;No Menu
    ;wndclass.lpszClassName = szAppName;
        mov [wndclass.lpszClassName], szAppName
    ;wndclass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
        ;invoke LoadIcon, 0, 7F00h ;IDI_APPLICATION = 32512 = 7F00h
        ;mov [wndclass.hIconSm], rax
    ;RegisterClassEx(&wndclass);
        invoke RegisterClassEx, wndclass

;hwnd = CreateWindow(
invoke  CreateWindowEx,\ ;instead of old CreateWindow
        0,\ ;Additional Parameter for CreateWindowEx
        szAppName,\ ;window class name
        szTitle,\ ;"The Hello Program", // window caption
        WS_OVERLAPPEDWINDOW,\ ; window style
        CW_USEDEFAULT,\ ;initial x position
        CW_USEDEFAULT,\ ;initial y position
        CW_USEDEFAULT,\ ;initial x size
        CW_USEDEFAULT,\ ;initial y size
        NULL,\ ;parent window handle
        NULL,\ ;window menu handle
        [hInstance],\ ;program instance handle
        NULL
    ;); // creation parameters
        mov [hwnd], rax

    ;ShowWindow(hwnd, iCmdShow);
        invoke ShowWindow, [hwnd], 1 ;iCmdShow = SW_SHOWNORMAL = 1
    ;UpdateWindow(hwnd);
        invoke UpdateWindow, [hwnd]

;while(GetMessage(&msg, NULL, 0, 0))
;{
    ;TranslateMessage(&msg);
    ;DispatchMessage(&msg);
;}
;return msg.wParam;
;}
MsgLoop:
        invoke  GetMessage,msg,NULL,0,0
        cmp     rax, 0
        je      Quit
        invoke  TranslateMessage, msg
        invoke  DispatchMessage, msg
        jmp     MsgLoop
Quit:
        invoke  ExitProcess,[msg.wParam]



;LRESULT CALLBACK WndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
proc WndProc uses rax rbx rcx rdx r8 r9 rsi rdi, hwnd,iMsg,wParam,lParam

;Store Parameters sent by DispatchMessage
    mov [hwnd],rcx
    mov [iMsg],rdx
    mov [wParam],r8
    mov [lParam],r9

;switch(iMsg)
    cmp rdx, WM_CREATE
        je case_WM_CREATE
    cmp rdx, WM_PAINT
        je case_WM_PAINT
    cmp rdx, WM_DESTROY
        je case_WM_DESTROY
    jmp defWndProc
;{
case_WM_CREATE:
    ;PlaySound("hellowin.wav", NULL, SND_FILENAME | SND_ASYNC);
        invoke PlaySound, szFileCreate, 0, 0
    jmp finWndProc
case_WM_PAINT:
    ;hdc = BeginPaint(hwnd, &ps);
        invoke BeginPaint, [hwnd], ps
        mov [hdc], rax
    ;GetClientRect(hwnd, &rect);
        invoke GetClientRect, [hwnd], rect
    ;DrawText(hdc, "Hello, Windows 95!", -1, &rect, DT_SINGLELINE | DT_CENTER | DT_VCENTER);
        invoke DrawText, [hdc], szHello, -1, rect, DT_SINGLELINE or DT_CENTER or DT_VCENTER
    ;EndPaint(hwnd, &ps);
        invoke EndPaint, [hwnd], ps
    jmp finWndProc
case_WM_DESTROY:
    ;PostQuitMessage(0);
    invoke PostQuitMessage, 0
    ;return 0;
    jmp finWndProc
;}
defWndProc:
    ;return DefWindowProc(hwnd, iMsg, wParam, lParam);
    invoke DefWindowProc, [hwnd], [iMsg], [wParam], [lParam]
;}
finWndProc:
   ret
endp

section '.data' data readable writeable
;Text Strings
    szAppName db 'HelloWin',0
    szTitle db 'The Hello Program',0
    szHello db 'Hello, 64-bit World!',0
    szFileCreate db 'C:\Windows\Media\tada.wav',0
;Handles
    hInstance dq ?
    hwnd dq ?
    hdc dq ?
;Structures
    wndclass WNDCLASSEX
    msg MSG
    ps PAINTSTRUCT
    rect RECT

section '.idata' import data readable writeable

    library kernel32,'KERNEL32.DLL',\
            user32,'USER32.DLL',\
            gdi32, 'GDI32.DLL',\
            winmm, 'WINMM.DLL'

    include 'api\kernel32.inc'
    include 'api\user32.inc'
    include 'api\gdi32.inc'

    import winmm,PlaySound,'PlaySound'