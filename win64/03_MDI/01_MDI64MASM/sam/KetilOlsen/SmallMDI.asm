
;Small MDI Window - DednDave - 8,2011

; =============================================================================================

        INCLUDE SmallMDI.inc

; =========== Initialized Data ===========

        .DATA

nChildCount   dd 1

StyleFlags = CS_HREDRAW or CS_VREDRAW
;if scrollbars are added to the frame window, use COLOR_SCROLLBAR+1 instead of (NULL_BRUSH or NULL_PEN)
wc WNDCLASSEX <SIZEOF WNDCLASSEX,StyleFlags,WndProc,0,0,?,?,?,NULL_BRUSH or NULL_PEN,IDM_MAINMENU,szFrameClass,?>

StyleFlags = MDIS_ALLCHILDSTYLES
;or WS_HSCROLL or WS_VSCROLL (to add scroll bars to child windows)
mcs MDICREATESTRUCT <szChildClass,szChildTitle,?,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,StyleFlags,0>

szFrameTitle  db 'Small MDI',0
szChildTitle  db 'Untitled',0
szFrameClass  db 'SmallFrameClass',0
szClientClass db 'MDICLIENT',0
szChildClass  db 'SmallChildClass',0

; =========== Uninitialized Data ===========

        .DATA?

lpszCmdLine   dd ?
hWin          dd ?
hClient       dd ?
hMenu         dd ?
hAccel        dd ?

; =========== Code ============================================================================

        .CODE

        OPTION  PROLOGUE:None
        OPTION  EPILOGUE:None

WndProc PROC    hWnd:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM

; =========== Frame Window Proc ===========

        mov     ecx,[esp+8]                                 ;uMsg
        push    ebp
        cmp     ecx,WM_COMMAND
        mov     ebp,esp
        jz      WProc1

        cmp     ecx,WM_DESTROY
        jz      WProcY

        cmp     ecx,WM_CREATE
        jz      WProcZ

WProc0: INVOKE  DefFrameProc,[ebp+8],hClient,[ebp+12],[ebp+16],[ebp+20]
        pop     ebp
        ret     16

; =========== WM_COMMAND ===========

WProc1: mov     eax,[ebp+16]                                ;wParam
        xor     ecx,ecx                                     ;ECX = 0
        and     eax,0FFFEFFFFh                              ;clear accelerator bit

;test any additional WM_COMMAND ID's here

        cmp     eax,IDM_FILEEXIT
        jz      WProc5

        push    ebx
        mov     edx,hClient                                 ;EDX = hClient
        cmp     eax,IDM_FILENEW                             ;EAX = WM_MDICREATE
        mov     ebx,offset mcs                              ;EBX = offset mcs
        jz      WProc2

        cmp     eax,IDM_FILEARRANGE_ICONS                   ;EAX = WM_MDIICONARRANGE
        mov     ebx,ecx                                     ;EBX = 0
        jz      WProc2

        or      ecx,MDITILE_SKIPDISABLED or MDITILE_ZORDER  ;ECX = MDITILE_SKIPDISABLED or MDITILE_ZORDER
        cmp     eax,IDM_FILEARRANGE_CASCADE                 ;EAX = WM_MDIICONARRANGE
        jz      WProc2

        sub     ecx,MDITILE_ZORDER                          ;ECX = MDITILE_SKIPDISABLED or MDITILE_VERTICAL
        cmp     eax,IDM_FILEARRANGE_TILEVERT                ;EAX = WM_MDITILE
        jz      WProc2

        cmp     eax,IDM_FILEARRANGE_TILEHORZ                ;EAX = WM_MDITILE - 1
        pop     ebx
        jnz     WProc0

        push    ebx
        inc     eax                                         ;EAX = WM_MDITILE
        xor     ebx,ebx                                     ;EBX = 0
        inc     ecx                                         ;ECX = MDITILE_SKIPDISABLED or MDITILE_HORIZONTAL

WProc2: INVOKE  SendMessage,edx,eax,ecx,ebx
        or      ebx,ebx
        jnz     WProc3

;only create new child comes here

        inc dword ptr nChildCount

WProc3: pop     ebx

WProc4: xor     eax,eax
        pop     ebp
        ret     16

WProc5: INVOKE  SendMessage,hWnd,WM_CLOSE,ecx,ecx
        jmp     WProc4

; =========== WM_DESTROY ===========

WProcY: INVOKE  PostQuitMessage,NULL
        jmp     WProc4

; =========== WM_CREATE ===========

WProcZ: push    ebx
        mov     ebx,[ebp+8]                                 ;hWnd
        cmp     ebx,hWin
        jz      WProc3

        mov     hWin,ebx
        INVOKE  GetMenu,ebx
        mov     hMenu,eax
        INVOKE  GetSubMenu,eax,0
        xchg    eax,ebx

; ----------- Create client window -----------

        push    IDW_FIRSTCHILD
        xor     edx,edx
        push    ebx
        mov     ecx,CW_USEDEFAULT
        mov     ebx,wc.hInstance

        INVOKE  CreateWindowEx,edx,offset szClientClass,edx,
                WS_CHILD or WS_VISIBLE or WS_CLIPCHILDREN,
                ecx,ecx,ecx,ecx,eax,edx,ebx,esp

        pop     edx
        pop     ecx
        mov     hClient,eax

; ----------- Load keyboard accelerators -----------

        INVOKE  LoadAccelerators,ebx,IDA_ACC
        mov     hAccel,eax
        jmp     WProc3

WndProc ENDP

        OPTION  PROLOGUE:PrologueDef
        OPTION  EPILOGUE:EpilogueDef

; =============================================================================================

        OPTION  PROLOGUE:None
        OPTION  EPILOGUE:None

ChildProc PROC    hWnd:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD

; =========== Child Window Proc ===========

        cmp dword ptr [esp+8],WM_CLOSE
        jnz     CProc0

        dec dword ptr nChildCount

CProc0: JMP     DefMDIChildProc

ChildProc ENDP

        OPTION  PROLOGUE:PrologueDef
        OPTION  EPILOGUE:EpilogueDef

; =============================================================================================

WinMain PROC

; =========== Main Proc ===========

; =========== Initialize globals ===========

        xor     edi,edi                                     ;EDI = 0
        push    edi
        push    sizeof INITCOMMONCONTROLSEX
        INVOKE  InitCommonControlsEx,esp
        INVOKE  GetCommandLine
        mov     lpszCmdLine,eax

; =========== Register frame window class ===========

        mov     esi,offset wc                               ;ESI = offset wc
        INVOKE  GetModuleHandle,edi
        mov     [esi].WNDCLASSEX.hInstance,eax
        mov     mcs.hOwner,eax
        xchg    eax,ebx                                     ;EBX = wc.hInstance
        INVOKE  LoadCursor,edi,IDC_ARROW
        mov     [esi].WNDCLASSEX.hCursor,eax
        INVOKE  LoadIcon,ebx,IDI_ICON
        mov     [esi].WNDCLASSEX.hIcon,eax
        mov     [esi].WNDCLASSEX.hIconSm,eax
        INVOKE  RegisterClassEx,esi

; =========== Register child window class ===========

        INVOKE  CreateSolidBrush,0FFFFFFh                   ;white bg
        mov     [esi].WNDCLASSEX.lpfnWndProc,ChildProc
        push    32
        pop     [esi].WNDCLASSEX.cbWndExtra
        mov     [esi].WNDCLASSEX.hbrBackground,eax
        mov     [esi].WNDCLASSEX.lpszClassName,offset szChildClass
        INVOKE  RegisterClassEx,esi

; =========== Create frame window ===========

StyleFlags = WS_OVERLAPPEDWINDOW or WS_VISIBLE or WS_CLIPCHILDREN
;or WS_HSCROLL or WS_VSCROLL (to add scroll bars to frame window)
;if scrollbars are added to the frame window, refer to the wc structure notes

        INVOKE  CreateWindowEx,edi,offset szFrameClass,offset szFrameTitle,
                StyleFlags,CW_USEDEFAULT,SW_SHOWNORMAL,600,440,edi,edi,ebx,edi

        xchg    eax,ebx                                     ;EBX = hWin
        mov     esi,hClient                                 ;ESI = hClient
        INVOKE  UpdateWindow,ebx
        INVOKE  SendMessage,esi,WM_MDICREATE,edi,offset mcs

; =========== Message loop ===========

        pushad
        mov     ebp,esp                                     ;EBP = offset msg
        jmp short mLoop1

mLoop0: INVOKE  TranslateMDISysAccel,esi,ebp
        or      eax,eax
        jnz     mLoop1

        INVOKE  TranslateAccelerator,ebx,hAccel,ebp
        or      eax,eax
        jnz     mLoop1
   
        INVOKE  TranslateMessage,ebp
        INVOKE  DispatchMessage,ebp

mLoop1: INVOKE  GetMessage,ebp,edi,edi,edi
        inc     eax                                         ;exit only
        shr     eax,1                                       ;if 0 or -1
        jnz     mLoop0

        pop     eax                                         ;ExitProcess:uExitCode = wParam
        JMP     ExitProcess

WinMain ENDP

; =============================================================================================

        END     WinMain

