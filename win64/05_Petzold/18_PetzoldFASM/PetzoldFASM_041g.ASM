format PE64 GUI 6.0
entry Start

include 'win64a.inc'

;MDIDEMO.H header file
;(c) Charles Petzold, 1996
    INIT_MENU_POS = 0 ;Position of SubMenu in MenuInit = 0
    HELLO_MENU_POS = 2 ;Position of SubMenu in MenuHello = 2
    RECT_MENU_POS = 1 ;Position of SubMenu in MenuRect = 1
;File
    IDM_NEWHELLO = 10
    IDM_NEWRECT = 11
    IDM_CLOSE = 12
    IDM_EXIT = 13
;Color
    IDM_BLACK = 20
    IDM_RED = 21
    IDM_GREEN = 22
    IDM_BLUE = 23
    IDM_WHITE = 24
;Window
    IDM_TILE = 30
    IDM_CASCADE = 31
    IDM_ARRANGE = 32
    IDM_CLOSEALL = 33
;Help
    IDM_ABOUT = 40
;First Child
    IDM_FIRSTCHILD = 100

section '.data' data readable writeable
;MDIDEMO.C -- Multiple Document Interface Demonstration
;(c) Charles Petzold, 1996

;Structure for storing data unique to each Hello child window
    struct HELLODATA
        iColor dd ? ;Two DWORDS are QWORD
        clrText dd ? ;QWORD is easier for x64
    ends
;Structure for storing data unique to each Rect child window
    struct RECTDATA
        cxClient dd ?
        cyClient dd ?
    ends
;global variables
;Class Names
    szFrameClass db "MDIFrame",0
    szClientClass db "MDICLIENT",0 ;Pre-defined by System
    szHelloClass db "MDIHelloChild",0
    szRectClass db "MDIRectChild",0
;Window Captions
    szFrameTitle db "MDI Frame",0
    szHelloTitle db "MDI Hello Child",0
    szRectTitle db "MDI Rect Child",0
;Window Handles
    hInstance dq ?
    hInst equ hInstance ;To keep Petzold's Variables
    hwndFrame dq ?
    hwndClient dq ?
    hwndChild dq ?
    hwndRect dq ?
    hwndHello dq ?
;Menu Handles
    hMenu dq ?
    hMenuInit dq ?
    hMenuInitWindow dq ?
    hMenuHello dq ?
    hMenuHelloWindow dq ?
    hMenuRect dq ?
    hMenuRectWindow dq ?
    ;hAccel dq ?
;Device Context and Drawing Handles
    hdc dq ?
    hBrush dq ?
;Structure handles
    lpHelloData dq ?
    lpRectData dq ?
;Structures
    wndclass WNDCLASSEX
    msg MSG
    mdicreate MDICREATESTRUCT
    clientcreate CLIENTCREATESTRUCT
    ps PAINTSTRUCT
    rect RECT
    HelloData HELLODATA
    RectData RECTDATA
;Rect Properties
    xLeft dd ?
    xRight dd ?
    yTop dd ?
    yBottom dd ?
    ;nRed db ?
    ;nGreen db ?
    ;nBlue db ?

;Normal Info Messages
    szHello db "Hello, World!",0
    szAbout db 'Ч. Петзолд. Программирование для Windows® 95',0Ah,0Dh,\
    'Глава 18 Многооконный интерфейс',0
;Prompt Messages
    szClose db "Close this Child Window?",0
    szExit db "Close this Application?",0
;Debug Messages
    szSpellRegister db "rax: 0000.0000.0000.0000h",0
;Error Messages
    szMainErr db "Error in WinMain",0
    szFrameErr db "Error in FrameWndProc",0
    ;szHelloErr db "Error in HelloWndProc",0
    ;szRectErr db "Error in RectWndProc",0

;***************************************
section '.text' code readable executable

Start:

    sub rsp, 8 ;Make stack dqword aligned

    invoke GetModuleHandle,0
    mov [hInstance], rax
    call WinMain
    invoke ExitProcess, [msg.wParam]


;==============================================================================================
;int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
;==============================================================================================
proc WinMain uses rbx rsi rdi, hInst:QWORD, hPrevInst:QWORD, CmdLine:QWORD, CmdShow:DWORD

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
    ;wndclass.cbSize = sizeof(wndclass);
        mov [wndclass.cbSize], 50h
    ;wndclass.style = CS_HREDRAW | CS_VREDRAW;
        mov [wndclass.style], 3
    ;wndclass.lpfnWndProc = FrameWndProc;
        mov rax, FrameWndProc
        mov [wndclass.lpfnWndProc], rax
    ;wndclass.cbClsExtra = 0;
        mov [wndclass.cbClsExtra], 0
    ;wndclass.cbWndExtra = 0;
        mov [wndclass.cbWndExtra], 0
    ;wndclass.hInstance = hInstance;
        mov rax, [hInstance]
        mov [wndclass.hInstance], rax
    ;wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
        invoke LoadIcon, 0, 7F00h
        mov [wndclass.hIcon], rax
    ;wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);
        invoke LoadCursor, 0, 7F00h
        mov [wndclass.hCursor], rax
    ;wndclass.hbrBackground =(HBRUSH)(COLOR_APPWORKSPACE + 1);
        mov [wndclass.hbrBackground], 0Dh
    ;wndclass.lpszMenuName = NULL;
        mov [wndclass.lpszMenuName], 0
    ;wndclass.lpszClassName = szFrameClass;
        mov rax, szFrameClass
        mov [wndclass.lpszClassName], rax
    ;wndclass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
        invoke LoadIcon, 0, 7F00h
        mov [wndclass.hIconSm], rax
    invoke RegisterClassEx, wndclass
        test rax,rax
        jz errWinMain
;Register the Hello Child Window Class
;ReFill the WNDCLASSEX structure
    ;wndclass.cbSize = sizeof(wndclass);
        ;Already done
    ;wndclass.style = CS_HREDRAW | CS_VREDRAW;
        ;Already done
    ;wndclass.lpfnWndProc = HelloWndProc;
        mov rax, HelloWndProc
        mov [wndclass.lpfnWndProc], rax
    ;mov [wndclass.cbClsExtra], 0;
        ;Already done
    ;wndclass.cbWndExtra = sizeof(HANDLE);
        mov [wndclass.cbWndExtra], 8
    ;wndclass.hInstance = hInstance;
        ;Already done
    ;wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
        ;Already done
    ;wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);
        ;Already done
    ;wndclass.hbrBackground =(HBRUSH) GetStockObject(WHITE_BRUSH);
        invoke GetStockObject, 0
        mov [wndclass.hbrBackground], rax
    ;wndclass.lpszMenuName = NULL;
        ;Already done
    ;wndclass.lpszClassName = szHelloClass;
        mov rax, szHelloClass
        mov [wndclass.lpszClassName], rax
    ;wndclass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
        ;Already done
    invoke RegisterClassEx, wndclass
        test rax,rax
        jz errWinMain
;Register the Rect Child Window Class
;ReFill the WNDCLASSEX structure
    ;wndclass.cbSize = sizeof(wndclass);
        ;Already done
    ;wndclass.style = CS_HREDRAW | CS_VREDRAW;
        ;Already done
    ;wndclass.lpfnWndProc = RectWndProc;
        mov rax, RectWndProc
        mov [wndclass.lpfnWndProc], rax
    ;wndclass.cbClsExtra = 0;
        ;Already done
    ;wndclass.cbWndExtra = sizeof(HANDLE);
        ;Already done
    ;wndclass.hInstance = hInstance;
        ;Already done
    ;wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
        ;Already done
    ;wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);
        ;Already done
    ;wndclass.hbrBackground =(HBRUSH) GetStockObject(WHITE_BRUSH);
        ;Already done
    ;wndclass.lpszMenuName = NULL;
        ;Already done
    ;wndclass.lpszClassName = szRectClass;
        mov rax, szRectClass
        mov [wndclass.lpszClassName], rax
    ;wndclass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
        ;Already done
    invoke RegisterClassEx, wndclass

;Obtain handles to three possible menus & submenus
    ;hMenuInit = LoadMenu(hInst, "MdiMenuInit");
        invoke LoadMenu, [hInst], 50 ;lpMenuName = MdiMenuInit = 50
        mov [hMenuInit], rax
    ;hMenuHello = LoadMenu(hInst, "MdiMenuHello");
        invoke LoadMenu, [hInst], 51 ;lpMenuName = MdiMenuHello = 51
        mov [hMenuHello], rax
    ;hMenuRect = LoadMenu(hInst, "MdiMenuRect");
        invoke LoadMenu, [hInst], 52 ;lpMenuName = MdiMenuRect = 52
        mov [hMenuRect], rax
    ;hMenuInitWindow = GetSubMenu(hMenuInit, INIT_MENU_POS);
        invoke GetSubMenu, [hMenuInit], INIT_MENU_POS ;Position of SubMenu in MenuInit = 0
        mov [hMenuInitWindow], rax
    ;hMenuHelloWindow = GetSubMenu(hMenuHello, HELLO_MENU_POS);
        invoke GetSubMenu, [hMenuHello], HELLO_MENU_POS ;Position of SubMenu in MenuHello = 2
        mov [hMenuHelloWindow], rax
    ;hMenuRectWindow = GetSubMenu(hMenuRect, RECT_MENU_POS);
        invoke GetSubMenu, [hMenuRect], RECT_MENU_POS ;Position of SubMenu in MenuRect = 1
        mov [hMenuRectWindow], rax

; Load accelerator table
    ;hAccel = LoadAccelerators(hInst, "MdiAccel");
        ;invoke LoadAccelerators, [hInst], IDR_ACCEL
        ;mov [hAccel], rax

;Create the Frame Window
invoke CreateWindowEx, 0, szFrameClass, szFrameTitle,\
       WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN,\
       CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,\
       NULL, [hMenuInit], [hInstance], NULL
    mov [hwndFrame], rax

;hwndClient = GetWindow(hwndFrame, GW_CHILD);
    invoke GetWindow, [hwndFrame], GW_CHILD
    mov [hwndClient], rax

;ShowWindow(hwndFrame, iCmdShow);
    invoke ShowWindow, [hwndFrame], 1 ;nCmdShow = SW_SHOWNORMAL = 1
;UpdateWindow(hwndFrame);
    invoke UpdateWindow, [hwndFrame]

;Enter the modified Message loop
MsgLoop:
    invoke GetMessage, msg, 0, 0, 0
    cmp rax, 0
        je CleanUp
    invoke TranslateMDISysAccel, [hwndClient], msg
    cmp rax, 0
        jne MsgLoop
    ;invoke TranslateAccelerator, [hwndFrame], [hAccel], msg
    ;cmp rax, 0
        ;jne MsgLoop
    invoke TranslateMessage, msg
    invoke DispatchMessage, msg
jmp MsgLoop

errWinMain:
    invoke  MessageBox, 0, szMainErr, szFrameTitle, 10h ;MB_ICONERROR+MB_OK

;Clean up by deleting unattached menus
CleanUp:
    invoke DestroyMenu, [hMenuHello]
    invoke DestroyMenu, [hMenuRect]

;return msg.wParam;
EndAll:
    ret
endp    ;WinMain

;=================================================================================
;LRESULT CALLBACK FrameWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;=================================================================================
proc FrameWndProc uses rbx rsi rdi, hwnd:QWORD, iMsg:QWORD, wParam:QWORD, lParam:QWORD
;static HWND hwndClient;
;CLIENTCREATESTRUCT clientcreate;
;HWND hwndChild;
;MDICREATESTRUCT mdicreate;

;Store Values retrieved by DispatchMessageA
    mov [hwnd], rcx
    mov [iMsg], rdx
    mov [wParam], r8
    mov [lParam], r9

;switch(iMsg)
    cmp rdx, WM_CREATE ;0x0001
        je wmFrameCreate
    cmp rdx, WM_COMMAND ;0x0111
        je wmFrameCommand
    cmp rdx, WM_QUERYENDSESSION
        ;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
        je wmFrameEndSession
    cmp rdx, WM_CLOSE ;0x0010
        je wmFrameClose
    cmp rdx, WM_DESTROY ;0x0002
        je wmFrameDestroy
    jmp defFrameWndProc

wmFrameCreate: ;Create the Client Window
    ;clientcreate.hWindowMenu = hMenuInitWindow;
        mov rax, [hMenuInitWindow]
        mov [clientcreate.hWindowMenu], rax
    ;clientcreate.idFirstChild = IDM_FIRSTCHILD;
        mov [clientcreate.idFirstChild], IDM_FIRSTCHILD
    ;hwndClient = CreateWindow("MDICLIENT", NULL,
        ;WS_CHILD | WS_CLIPCHILDREN | WS_VISIBLE,
        ;0, 0, 0, 0, hwnd,(HMENU) 1, hInst, (LPSTR) &clientcreate);
    invoke CreateWindowEx, 0, szClientClass, 0,\
           WS_CHILD or WS_CLIPCHILDREN or WS_VISIBLE, 0, 0, 0, 0,\
           [hwnd], 1, [hInst], clientcreate ;Why (HMENU) 1?
    mov [hwndClient], rax
    jmp finFrameWndProc

wmFrameCommand:
    ;switch(wParam)
        cmp r8, IDM_NEWHELLO
            je idmFrameNewHello
        cmp r8, IDM_NEWRECT
            je idmFrameNewRect
        cmp r8, IDM_CLOSE
            je idmFrameClose
        cmp r8, IDM_EXIT
            je idmFrameExit
        cmp r8, IDM_TILE
            je idmFrameTile
        cmp r8, IDM_CASCADE
            je idmFrameCascade
        cmp r8, IDM_ARRANGE
            je idmFrameArrange
        cmp r8, IDM_CLOSEALL
            je idmFrameCloseAll
        cmp r8, IDM_ABOUT
            je idmFrameAbout
        jmp defFrameCmd
    idmFrameNewHello:
        ;Create a Hello Child Window
        ;Initialize the MDICREATESTRUCT
            ;mdicreate.szClass = szHelloClass;
                mov rax, szHelloClass
                mov [mdicreate.szClass], rax
            ;mdicreate.szTitle = "Hello";
                mov rax, szHelloTitle
                mov [mdicreate.szTitle], rax
            ;mdicreate.hOwner = hInst;
                mov rax, [hInst]
                mov [mdicreate.hOwner], rax
            ;mdicreate.x = CW_USEDEFAULT;
                mov [mdicreate.x], CW_USEDEFAULT
            ;mdicreate.y = CW_USEDEFAULT;
                mov [mdicreate.y], CW_USEDEFAULT
            ;mdicreate.cx = CW_USEDEFAULT;
                mov [mdicreate.cx], CW_USEDEFAULT
            ;mdicreate.cy = CW_USEDEFAULT;
                mov [mdicreate.cy], CW_USEDEFAULT
            ;mdicreate.style = 0;
                mov [mdicreate.style], 0
            ;mdicreate.lParam = 0;
                mov [mdicreate.lParam], 0
            invoke SendMessage, [hwndClient], WM_MDICREATE, 0, mdicreate
            mov [hwndChild], rax
            jmp finFrameWndProc
    idmFrameNewRect:
        ;Create a Rect Child Window
            ;mdicreate.szClass = szRectClass;
                mov rax, szRectClass
                mov [mdicreate.szClass], rax
            ;mdicreate.szTitle = "Rectangles";
                mov rax, szRectTitle
                mov [mdicreate.szTitle], rax
            ;mdicreate.hOwner = hInst;
                mov rax, [hInst]
                mov [mdicreate.hOwner], rax
            ;mdicreate.x = CW_USEDEFAULT;
                mov [mdicreate.x], CW_USEDEFAULT
            ;mdicreate.y = CW_USEDEFAULT;
                mov [mdicreate.y], CW_USEDEFAULT
            ;mdicreate.cx = CW_USEDEFAULT;
                mov [mdicreate.cx], CW_USEDEFAULT
            ;mdicreate.cy = CW_USEDEFAULT;
                mov [mdicreate.cy], CW_USEDEFAULT
            ;mdicreate.style = 0;
                mov [mdicreate.style], 0
            ;mdicreate.lParam = 0;
                mov [mdicreate.lParam], 0
            invoke SendMessage, [hwndClient], WM_MDICREATE, 0, mdicreate
            mov [hwndChild], rax
            jmp finFrameWndProc
     idmFrameClose: ;Close the active window
        ;hwndChild =(HWND) SendMessage(hwndClient, WM_MDIGETACTIVE, 0, 0);
        ;if(SendMessage(hwndChild, WM_QUERYENDSESSION, 0, 0))
            ;SendMessage(hwndClient, WM_MDIDESTROY, (WPARAM) hwndChild, 0);
        ;return 0;
            invoke SendMessage, [hwndClient], WM_MDIGETACTIVE, 0, 0
            mov [hwndChild], rax
            invoke SendMessage, [hwndChild], WM_QUERYENDSESSION, 0, 0
            cmp rax, 0
                je finFrameWndProc
            invoke SendMessage, [hwndClient], WM_MDIDESTROY, [hwndChild], 0
            jmp finFrameWndProc
    idmFrameExit: ;Exit the program
        ;SendMessage(hwnd, WM_CLOSE, 0, 0);
            invoke SendMessage, [hwnd], WM_CLOSE, 0, 0
            jmp finFrameWndProc
    ; messages for arranging windows
    idmFrameTile:
        ;SendMessage(hwndClient, WM_MDITILE, 0, 0);
            invoke SendMessage, [hwndClient], WM_MDITILE, 0, 0
            jmp finFrameWndProc
    idmFrameCascade:
        ;SendMessage(hwndClient, WM_MDICASCADE, 0, 0);
            invoke SendMessage, [hwndClient], WM_MDICASCADE, 0, 0
            jmp finFrameWndProc
    idmFrameArrange:
        ;SendMessage(hwndClient, WM_MDIICONARRANGE, 0, 0);
            invoke SendMessage, [hwndClient], WM_MDIICONARRANGE, 0, 0
            jmp finFrameWndProc
    idmFrameCloseAll:
        ;EnumChildWindows(hwndClient, &CloseEnumProc, 0);
            ;mov rcx, [hwnd] ;Passing Parameters
            ;mov r9, [lParam] ;Will be passed but will not be used
            invoke EnumChildWindows, [hwndClient], CloseEnumProc, 0
            jmp finFrameWndProc
    idmFrameAbout:
            invoke MessageBox, [hwnd], szAbout, szFrameTitle, MB_ICONINFORMATION
            jmp finFrameWndProc
    defFrameCmd: ;Pass to active child...
        ;hwndChild =(HWND) SendMessage(hwndClient, WM_MDIGETACTIVE, 0, 0);
        ;if(IsWindow(hwndChild))
            ;SendMessage(hwndChild, WM_COMMAND, wParam, lParam);
        ;break; // ...and then to DefFrameProc
            invoke SendMessage, [hwndClient], WM_MDIGETACTIVE, 0, 0
            mov [hwndChild], rax
            invoke IsWindow, [hwndChild]
            cmp rax, 0
                je defFrameWndProc
            invoke SendMessage, [hwndChild], WM_COMMAND, [wParam], [lParam]
            jmp defFrameWndProc
wmFrameEndSession:
    ;jmp wmFrameClose
wmFrameClose: ;Attempt to close all children
    ;SendMessage(hwnd, WM_COMMAND, IDM_CLOSEALL, 0);
    ;if(NULL != GetWindow(hwndClient, GW_CHILD))
        ;return 0;
    ;break; // I.e., call DefFrameProc
        invoke SendMessage, [hwnd], WM_COMMAND, IDM_CLOSEALL, 0
        invoke GetWindow, [hwndClient], GW_CHILD
        cmp rax, 0
            jne finFrameWndProc
        jmp defFrameWndProc
wmFrameDestroy:
        invoke PostQuitMessage, 0
        jmp finFrameWndProc

; Pass unprocessed messages to DefFrameProc(not DefWindowProc)
defFrameWndProc:
    ;return DefFrameProc(hwnd, hwndClient, iMsg, wParam, lParam);
        invoke DefFrameProc, [hwnd], [hwndClient], [iMsg], [wParam], [lParam]
finFrameWndProc:
    ret
endp ;FrameWndProc

;=====================================================
;BOOL CALLBACK CloseEnumProc(HWND hwnd, LPARAM lParam)
;=====================================================
proc CloseEnumProc uses rbx rsi rdi, hwnd:QWORD, lParam:QWORD
    ;mov rcx, [hwndChild] ;Closes all Child Windows
    mov [hwnd], rcx
    ;mov [lParam], r9 ;not used

;if(GetWindow(hwnd, GW_OWNER)) // Check for icon title
    ;return 1;
;SendMessage(GetParent(hwnd), WM_MDIRESTORE,(WPARAM) hwnd, 0);
;if(!SendMessage(hwnd, WM_QUERYENDSESSION, 0, 0))
    ;return 1;
;SendMessage(GetParent(hwnd), WM_MDIDESTROY,(WPARAM) hwnd, 0);
;return 1;

    invoke GetWindow, [hwnd], GW_OWNER ;Check for icon title
    cmp rax, 0
        jne finCloseEnumProc

    invoke GetParent, [hwnd]
    invoke SendMessage, rax, WM_MDIRESTORE, [hwnd], 0

    invoke SendMessage, [hwnd], WM_QUERYENDSESSION, 0, 0
    cmp rax, 0
        je finCloseEnumProc

    invoke GetParent, [hwnd]
    invoke SendMessage, rax, WM_MDIDESTROY, [hwnd], 0

finCloseEnumProc:
    mov rax, 1
    ret
endp ;CloseEnumProc

;=================================================================================
;LRESULT CALLBACK HelloWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;=================================================================================
proc HelloWndProc uses rbx rsi rdi, hwnd:QWORD, iMsg:QWORD, wParam:QWORD, lParam:QWORD
;static COLORREF clrTextArray[] =
;{ RGB(0, 0, 0), RGB(255, 0, 0), RGB(0, 255, 0), RGB( 0, 0, 255), RGB(255, 255, 255) };
;static HWND hwndClient, hwndFrame;
;HDC hdc;
;HMENU hMenu;
;LPHELLODATA lpHelloData;
;PAINTSTRUCT ps;
;RECT rect;

;Store Values retrieved by DispatchMessageA:
    mov [hwnd], rcx
    mov [iMsg], rdx
    mov [wParam], r8
    mov [lParam], r9

;switch(iMsg)
    cmp rdx, WM_CREATE ;0x0001
        je wmHelloCreate
    cmp rdx, WM_COMMAND ;0x0111
        je wmHelloCommand
    cmp rdx, WM_PAINT ;0x000F
        je wmHelloPaint
    cmp rdx, WM_MDIACTIVATE ;0x0222
        je wmHelloActivate
    cmp rdx, WM_QUERYENDSESSION ;0x0011
        ;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
        je wmHelloEndSession
    cmp rdx, WM_CLOSE ;0x0010
        je wmHelloClose
    cmp rdx, WM_DESTROY ;0x0002
        je wmHelloDestroy
    jmp defHelloWndProc

;case WM_CREATE :
wmHelloCreate:
    ;Allocate memory for window private data
        ;lpHelloData =(LPHELLODATA) HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, sizeof(HELLODATA));
            invoke GetProcessHeap
            invoke HeapAlloc, rax, HEAP_ZERO_MEMORY, sizeof.HELLODATA
            mov [lpHelloData], rax
        ;lpHelloData->iColor = IDM_BLACK;
            mov [HelloData.iColor], IDM_BLACK
        ;lpHelloData->clrText = RGB(0, 0, 0);
            mov [HelloData.clrText], 0 ;Black by default
        ;SetWindowLong(hwnd, 0,(long) lpHelloData);
            invoke SetWindowLong, [hwnd], 0, [lpHelloData]
    ;Save some window handles ;Why?!
        ;hwndClient = GetParent(hwnd);
            invoke GetParent, [hwnd]
            mov [hwndClient], rax
        ;hwndFrame = GetParent(hwndClient);
            invoke GetParent, [hwndClient]
            mov [hwndFrame], rax
        jmp finHelloWndProc
wmHelloCommand:
    ;switch(wParam)
        cmp r8, IDM_BLACK
            je idmHelloBlack
        cmp r8, IDM_RED
            je idmHelloRed
        cmp r8, IDM_GREEN
            je idmHelloGreen
        cmp r8, IDM_BLUE
            je idmHelloBlue
        cmp r8, IDM_WHITE
            je idmHelloWhite
        jmp defHelloCmd
    idmHelloBlack:
        ;Change the text color
        ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
            invoke GetWindowLong, [hwnd], 0
            mov [lpHelloData], rax
        ;hMenu = GetMenu(hwndFrame);
            invoke GetMenu, [hwndFrame]
            mov [hMenu], rax
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_UNCHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_UNCHECKED ;Uncheck previous
        ;lpHelloData->iColor = wParam;
            mov [HelloData.iColor], IDM_BLACK
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_CHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_CHECKED ;Check current
        ;lpHelloData->clrText = clrTextArray[wParam - IDM_BLACK];
            mov [HelloData.clrText], 0 ;RGB(0, 0, 0)
        ;InvalidateRect(hwnd, NULL, FALSE);
            invoke InvalidateRect, [hwnd], NULL, FALSE
        jmp finHelloWndProc
    idmHelloRed: ;0FFh
        ;Change the text color
        ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
            invoke GetWindowLong, [hwnd], 0
            mov [lpHelloData], rax
        ;hMenu = GetMenu(hwndFrame);
            invoke GetMenu, [hwndFrame]
            mov [hMenu], rax
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_UNCHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_UNCHECKED ;Uncheck previous
        ;lpHelloData->iColor = wParam;
            mov [HelloData.iColor], IDM_RED
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_CHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_CHECKED ;Check current
        ;lpHelloData->clrText = clrTextArray[wParam - IDM_BLACK];
            mov [HelloData.clrText], 0FFh ;RGB(0FFh, 0, 0)
        ;InvalidateRect(hwnd, NULL, FALSE);
            invoke InvalidateRect, [hwnd], NULL, FALSE
        jmp finHelloWndProc
    idmHelloGreen: ;0FF00h
        ;Change the text color
        ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
            invoke GetWindowLong, [hwnd], 0
            mov [lpHelloData], rax
        ;hMenu = GetMenu(hwndFrame);
            invoke GetMenu, [hwndFrame]
            mov [hMenu], rax
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_UNCHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_UNCHECKED ;Uncheck previous
        ;lpHelloData->iColor = wParam;
            mov [HelloData.iColor], IDM_GREEN
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_CHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_CHECKED ;Check current
        ;lpHelloData->clrText = clrTextArray[wParam - IDM_BLACK];
            mov [HelloData.clrText], 0FF00h ;RGB(0, 0FFh, 0)
        ;InvalidateRect(hwnd, NULL, FALSE);
            invoke InvalidateRect, [hwnd], NULL, FALSE
        jmp finHelloWndProc
    idmHelloBlue: ;0FF0000h
        ;Change the text color
        ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
            invoke GetWindowLong, [hwnd], 0
            mov [lpHelloData], rax
        ;hMenu = GetMenu(hwndFrame);
            invoke GetMenu, [hwndFrame]
            mov [hMenu], rax
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_UNCHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_UNCHECKED ;Uncheck previous
        ;lpHelloData->iColor = wParam;
            mov [HelloData.iColor], IDM_BLUE
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_CHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_CHECKED ;Check current
        ;lpHelloData->clrText = clrTextArray[wParam - IDM_BLACK];
            mov [HelloData.clrText], 0FF0000h ;RGB(0, 0, 0FFh)
        ;InvalidateRect(hwnd, NULL, FALSE);
            invoke InvalidateRect, [hwnd], NULL, FALSE
        jmp finHelloWndProc
    idmHelloWhite: ;0C0C0C0h
        ;Change the text color
        ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
            invoke GetWindowLong, [hwnd], 0
            mov [lpHelloData], rax
        ;hMenu = GetMenu(hwndFrame);
            invoke GetMenu, [hwndFrame]
            mov [hMenu], rax
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_UNCHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_UNCHECKED ;Uncheck previous
        ;lpHelloData->iColor = wParam;
            mov [HelloData.iColor], IDM_WHITE
        ;CheckMenuItem(hMenu, lpHelloData->iColor, MF_CHECKED);
            invoke CheckMenuItem, [hMenu], [HelloData.iColor], MF_CHECKED ;Check current
        ;lpHelloData->clrText = clrTextArray[wParam - IDM_BLACK];
            mov [HelloData.clrText], 0C0C0C0h ;RGB(0Ch, 0Ch, 0Ch)
        ;InvalidateRect(hwnd, NULL, FALSE);
            invoke InvalidateRect, [hwnd], NULL, FALSE
        jmp finHelloWndProc
    defHelloCmd:
        nop
        jmp defHelloWndProc
wmHelloPaint:
    ; Paint the window
    ;hdc = BeginPaint(hwnd, &ps);
        invoke BeginPaint, [hwnd], ps
        mov [hdc], rax
    ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
        invoke GetWindowLong, [hwnd], 0
        mov [lpHelloData], rax
    ;SetTextColor(hdc, lpHelloData->clrText);
        invoke SetTextColor, [hdc], [HelloData.clrText]
    ;GetClientRect(hwnd, &rect);
        invoke GetClientRect, [hwnd], rect
    ;DrawText(hdc, "Hello, World!", -1, &rect, DT_SINGLELINE | DT_CENTER | DT_VCENTER);
        invoke DrawText, [hdc], szHello, -1, rect, DT_SINGLELINE or DT_CENTER or DT_VCENTER
    ;EndPaint(hwnd, &ps);
        invoke EndPaint, [hwnd], ps
    jmp finHelloWndProc ;return 0;
wmHelloActivate:
    ; Set the Hello menu if gaining focus
        ;if(lParam ==(LPARAM) hwnd)
            ;SendMessage(hwndClient, WM_MDISETMENU, (WPARAM) hMenuHello,(LPARAM) hMenuHelloWindow);
    ; Check or uncheck menu item
        ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
        ;CheckMenuItem(hMenuHello, lpHelloData->iColor, (lParam ==(LPARAM) hwnd) ? MF_CHECKED : MF_UNCHECKED);
    ; Set the Init menu if losing focus
        ;if(lParam !=(LPARAM) hwnd)
            ;SendMessage(hwndClient, WM_MDISETMENU,(WPARAM) hMenuInit, (LPARAM) hMenuInitWindow);
        ;DrawMenuBar(hwndFrame);
    ;mov rcx, [hwnd]
    ;mov r9, [lParam]
    cmp r9, rcx
        jne notHello
    ;Hello:
        invoke SendMessage, [hwndClient], WM_MDISETMENU, [hMenuHello], [hMenuHelloWindow]
        invoke GetWindowLong, [hwnd], 0
        mov [lpHelloData], rax
        invoke CheckMenuItem, [hMenuHello], [HelloData.iColor], MF_CHECKED
        invoke DrawMenuBar, [hwndFrame]
        jmp finHelloWndProc
    notHello:
        invoke GetWindowLong, [hwnd], 0
        mov [lpHelloData], rax
        invoke CheckMenuItem, [hMenuHello], [HelloData.iColor], MF_UNCHECKED
        invoke SendMessage, [hwndClient], WM_MDISETMENU, [hMenuInit], [hMenuInitWindow]
        invoke DrawMenuBar, [hwndFrame]
        jmp finHelloWndProc ;return 0;
wmHelloEndSession:
    ;jmp wmHelloClose
wmHelloClose:
    ;if(IDOK != MessageBox(hwnd, "OK to close window?", "Hello", MB_ICONQUESTION | MB_OKCANCEL))
        ;return 0;
    ;break; // I.e., call DefMDIChildProc
    invoke MessageBox, [hwnd], szClose, szHelloTitle, MB_ICONQUESTION or MB_OKCANCEL
    cmp rax, IDOK
        jne finHelloWndProc ;return 0;
    jmp defHelloWndProc ;I.e., call DefMDIChildProc
wmHelloDestroy:
    ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
    ;HeapFree(GetProcessHeap(), 0, lpHelloData);
        invoke GetWindowLong, [hwnd], 0
        mov [lpHelloData], rax
        invoke GetProcessHeap
        invoke HeapFree, rax, 0, [lpHelloData]
    jmp finHelloWndProc
defHelloWndProc: ;Pass unprocessed message to DefMDIChildProc
    invoke DefMDIChildProc, [hwnd], [iMsg], [wParam], [lParam]
finHelloWndProc: ;return 0;
    ret
endp ;HelloWndProc

;================================================================================
;LRESULT CALLBACK RectWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;================================================================================
proc RectWndProc uses rbx rsi rdi, hwnd:QWORD, iMsg:QWORD, wParam:QWORD, lParam:QWORD
    ;static HWND hwndClient, hwndFrame;
    ;HBRUSH hBrush;
    ;HDC hdc;
    ;LPRECTDATA lpRectData;
    ;PAINTSTRUCT ps;
    ;int xLeft, xRight, yTop, yBottom;
    ;short nRed, nGreen, nBlue;
;Store Values retrieved by DispatchMessageA:
    mov [hwnd], rcx
    mov [iMsg], rdx
    mov [wParam], r8
    mov [lParam], r9

;switch(iMsg)
    cmp rdx, WM_CREATE ;0x0001
        je wmRectCreate
    cmp rdx, WM_SIZE ;0x0005
        je wmRectSize
    cmp rdx, WM_TIMER ;0x0113
        je wmRectTimer
    cmp rdx, WM_PAINT ;0x000F
        je wmRectPaint
    cmp rdx, WM_MDIACTIVATE ;0x0222
        je wmRectActivate
    cmp rdx, WM_DESTROY ;0x0002
        je wmRectDestroy
    jmp defRectWndProc

wmRectCreate:
    ;Allocate memory for window private data
        ;lpRectData =(LPRECTDATA) HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, sizeof(RECTDATA));
            invoke GetProcessHeap
            invoke HeapAlloc, rax, HEAP_ZERO_MEMORY, sizeof.RECTDATA
            mov [lpRectData], rax
        ;SetWindowLong(hwnd, 0,(long) lpRectData);
            invoke SetWindowLong, [hwnd], 0, [lpRectData]
    ;Start the timer going
        ;SetTimer(hwnd, 1, 250, NULL);
            invoke SetTimer, [hwnd], 1, 0FFh, 0
    ;Save some window handles
        ;hwndClient = GetParent(hwnd);
            invoke GetParent, [hwnd]
            mov [hwndClient], rax
        ;hwndFrame = GetParent(hwndClient);
            invoke GetParent, [hwndClient]
            mov [hwndFrame], rax
        jmp finRectWndProc ;return 0;
wmRectSize: ;If not minimized, save the window size
        ;if(wParam != SIZE_MINIMIZED)
            ;lpRectData =(LPRECTDATA) GetWindowLong(hwnd, 0);
                invoke GetWindowLong, [hwnd], 0
                mov [lpRectData], rax
            ;lpRectData->cxClient = LOWORD(lParam);
                mov rax, [lParam]
                mov [RectData.cxClient], eax
            ;lpRectData->cyClient = HIWORD(lParam);
                mov rax, [lParam]
                shr rax, 32
                mov [RectData.cyClient], eax
        jmp defRectWndProc ;break; // WM_SIZE must be processed by DefMDIChildProc
wmRectTimer: ;Display a random rectangle
    ;lpRectData =(LPRECTDATA) GetWindowLong(hwnd, 0);
        invoke GetWindowLong, [hwnd], 0
        mov [lpRectData], rax
    ;xLeft = rand() % lpRectData->cxClient;
        mov eax, [xLeft]
        inc eax
        mov [xLeft], eax
    ;xRight = rand() % lpRectData->cxClient;
        mov eax, [xLeft]
        add eax, 50
        mov [xRight], eax
    ;yTop = rand() % lpRectData->cyClient;
        mov eax, [yBottom]
        inc eax
        mov [yBottom], eax
    ;yBottom = rand() % lpRectData->cyClient;
        mov eax, [yBottom]
        add eax,50
        mov [yTop], eax
    ;nRed = rand() & 255;
        ;mov [nRed], 255
    ;nGreen = rand() & 255;
        ;mov [nGreen], 255
    ;nBlue = rand() & 255;
        ;mov [nBlue], 225
    ;hdc = GetDC(hwnd);
        invoke GetDC, [hwnd]
        mov [hdc], rax
    ;hBrush = CreateSolidBrush(RGB(nRed, nGreen, nBlue));
        invoke CreateSolidBrush, 0E0FFFFh
        mov [hBrush], rax
    ;SelectObject(hdc, hBrush);
        invoke SelectObject, [hdc], [hBrush]
    ;Rectangle(hdc, min(xLeft, xRight), min(yTop, yBottom), max(xLeft, xRight), max(yTop, yBottom));
        invoke Rectangle, [hdc], [xLeft], [yBottom], [xRight], [yTop]
    ;ReleaseDC(hwnd, hdc);
        invoke ReleaseDC, [hwnd], [hdc]
    ;DeleteObject(hBrush);
        invoke DeleteObject, [hBrush]
    jmp finRectWndProc ;return 0;
wmRectPaint: ;Clear the window
    ;InvalidateRect(hwnd, NULL, TRUE);
        invoke InvalidateRect, [hwnd], NULL, TRUE
    ;hdc = BeginPaint(hwnd, &ps);
         invoke BeginPaint, [hwnd], ps
         mov [hdc], rax
    ;EndPaint(hwnd, &ps);
         invoke EndPaint, [hwnd], ps
    jmp finRectWndProc ;return 0;

wmRectActivate: ;Set the appropriate menu
    ;if(lParam ==(LPARAM) hwnd)
        ;SendMessage(hwndClient, WM_MDISETMENU,(WPARAM) hMenuRect,(LPARAM) hMenuRectWindow);
    ;else
        ;SendMessage(hwndClient, WM_MDISETMENU,(WPARAM) hMenuInit,(LPARAM) hMenuInitWindow);
        ;DrawMenuBar(hwndFrame);
    cmp r9, rcx
        jne notRect
    ;Rect:
        invoke SendMessage, [hwndClient], WM_MDISETMENU, [hMenuRect], [hMenuRectWindow]
        invoke DrawMenuBar, [hwndFrame]
        jmp finRectWndProc
    notRect:
        invoke SendMessage, [hwndClient], WM_MDISETMENU, [hMenuInit], [hMenuInitWindow]
        invoke DrawMenuBar, [hwndFrame]
        jmp finRectWndProc ;return 0    ;

wmRectDestroy:
    ;lpRectData =(LPRECTDATA) GetWindowLong(hwnd, 0);
        invoke GetWindowLong, [hwnd], 0
        mov [lpRectData], rax
    ;HeapFree(GetProcessHeap(), 0, lpRectData);
        invoke GetProcessHeap
        invoke HeapFree, rax, 0, [lpRectData]
    ;KillTimer(hwnd, 1);
        invoke KillTimer, [hwnd], 1
    jmp finRectWndProc ;return 0;

; Pass unprocessed message to DefMDIChildProc
defRectWndProc:
    invoke DefMDIChildProc, [hwnd], [iMsg], [wParam], [lParam]
finRectWndProc: ;return 0;
    ret
endp ;HelloWndProc

;**********************************************
section '.idata' import data readable writeable

    library kernel32,'KERNEL32.DLL',\
            user32,'USER32.DLL',\
            gdi32, 'GDI32.dll'

    include 'api\kernel32.inc'
    include 'api\user32.inc'
    include 'api\gdi32.inc'

section '.rsrc' resource data readable

    ;resource directory

    directory RT_MENU,menus,\
              RT_VERSION,versions

    ;resource subdirectories

    resource menus,\
             50,LANG_ENGLISH+SUBLANG_DEFAULT,MdiMenuInit,\
             51,LANG_ENGLISH+SUBLANG_DEFAULT,MdiMenuHello,\
             52,LANG_ENGLISH+SUBLANG_DEFAULT,MdiMenuRect

    menu MdiMenuInit
         menuitem '&File',0,MFR_POPUP
                  menuitem 'New &Hello',IDM_NEWHELLO
                  menuitem 'New &Rectangles',IDM_NEWRECT
                  menuseparator
                  menuitem 'E&xit',IDM_EXIT,MFR_END
         menuitem '&Help',0,MFR_POPUP + MFR_END
                  menuitem '&About...',IDM_ABOUT,MFR_END

    menu MdiMenuHello
         menuitem '&File',0,MFR_POPUP
                  menuitem 'New &Hello',IDM_NEWHELLO
                  menuitem 'New &Rectangles',IDM_NEWRECT
                  menuitem '&Close',IDM_CLOSE
                  menuseparator
                  menuitem 'E&xit',IDM_EXIT,MFR_END
         menuitem '&Color',0,MFR_POPUP
                  menuitem '&Black',IDM_BLACK
                  menuitem '&Red',IDM_RED
                  menuitem '&Green',IDM_GREEN
                  menuitem 'B&lue',IDM_BLUE
                  menuitem '&White',IDM_WHITE,MFR_END
         menuitem '&Window',0,MFR_POPUP
                  menuitem '&Tile',IDM_TILE
                  menuitem '&Cascade',IDM_CASCADE
                  menuitem 'Arrange &Icons',IDM_ARRANGE
                  menuitem 'Close &All',IDM_CLOSEALL,MFR_END
         menuitem '&Help',0,MFR_POPUP + MFR_END
                  menuitem '&About...',IDM_ABOUT,MFR_END

    menu MdiMenuRect
         menuitem '&File',0,MFR_POPUP
                  menuitem 'New &Hello',IDM_NEWHELLO
                  menuitem 'New &Rectangles',IDM_NEWRECT
                  menuitem '&Close',IDM_CLOSE
                  menuseparator
                  menuitem 'E&xit',IDM_EXIT,MFR_END
         menuitem '&Window',0,MFR_POPUP
                  menuitem '&Tile',IDM_TILE
                  menuitem '&Cascade',IDM_CASCADE
                  menuitem 'Arrange &Icons',IDM_ARRANGE
                  menuitem 'Close &All',IDM_CLOSEALL,MFR_END
         menuitem '&Help',0,MFR_POPUP + MFR_END
                  menuitem '&About...',IDM_ABOUT,MFR_END

    resource versions,\
             1,LANG_NEUTRAL,version

    versioninfo version,0,VFT_APP,0,LANG_ENGLISH+SUBLANG_DEFAULT,0,\
                'FileDescription','FASM win64 MDI Interface Demo',\
                'LegalCopyright','Dedicated to Charles Petzold',\
                'FileVersion','0.01',\
                'ProductVersion','0.01',\
                'OriginalFilename','MDI_Petzold_000.EXE'