format PE64 GUI 6.0
entry Start

include 'win64a.inc'
;include 'include\Spell_09_fasm.inc'

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

;MDIDEMO.C -- Multiple Document Interface Demonstration
;(c) Charles Petzold, 1996

section '.data_r' data readable
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
;Normal Info Messages
    szHello db "Hello, World!",0
    szAbout db 'Ч. Петзолд. Программирование для Windows® 95',0Ah,0Dh,\
    'Глава 18 Многооконный интерфейс',0
;Prompt Messages
    szClose db "Close this Child Window?",0
    szExit db "Close this Application?",0
;static COLORREF clrTextArray[] =
;{RGB (0, 0, 0), RGB (255, 0, 0), RGB (0, 255, 0), RGB (0, 0, 255), RGB (255, 255, 255)} ;
    clrTextArray dq 0, 0FFh, 0FF00h, 0FF0000h, 0C0C0C0h
;Error Messages
    szMainErr db "Error in WinMain",0
    szFrameErr db "Error in FrameWndProc",0
    szHelloErr db "Error in HelloWndProc",0
    szRectErr db "Error in RectWndProc",0

section '.data_rw' data readable writeable

;// global variables
;HINSTANCE hInst;
    hInst dq 0
;HMENU hMenuInit,hMenuHello,hMenuRect;
    hMenuInit dq 0
    hMenuHello dq 0
    hMenuRect dq 0
;HMENU hMenuInitWindow,hMenuHelloWindow,hMenuRectWindow;
    hMenuInitWindow dq 0
    hMenuHelloWindow dq 0
    hMenuRectWindow dq 0
;static HWND hwndClient ;
    hwndClientF dq 0
;static HWND hwndClient, hwndFrame ;
    hwndFrameH dq 0
    hwndClientH dq 0
;static HWND hwndClient, hwndFrame ;
    hwndFrameR dq 0
    hwndClientR dq 0
;For CryptGenRandom
    hProv dq 0
    pbBuffer dq 0 ;db 8 dup (0)
    dwLen = $-pbBuffer

;Structures
    wndclass WNDCLASSEX
    msg MSG
    mdicreate MDICREATESTRUCT
    clientcreate CLIENTCREATESTRUCT
    ps PAINTSTRUCT
    rect RECT

;Debug Messages
    szStackPointer db "rsp: 0000.0000.0000.0000h",0
    szHandle db "Handle: 0000.0000.0000.0000h",0
    szLastErr db "Last Error Code: 0000.0000.0000.0000h",0

;***************************************
section '.text' code readable executable

Start:

    and rsp, -16 ;Make stack dqword aligned

    invoke GetModuleHandle,0
    mov [hInst], rax
    call WinMain
    invoke ExitProcess, [msg.wParam]

;==============================================================================================
;int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
;==============================================================================================
include '10_WinMain_003.asm'

;=================================================================================
;LRESULT CALLBACK FrameWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;=================================================================================
include '20_FrameWndProc_003.asm'

;=====================================================
;BOOL CALLBACK CloseEnumProc(HWND hwnd, LPARAM lParam)
;=====================================================
include '30_CloseEnumProc_003gut.asm'

;=================================================================================
;LRESULT CALLBACK HelloWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;=================================================================================
include '40_HelloWndProc_008.asm'

;================================================================================
;LRESULT CALLBACK RectWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;================================================================================
include '50_RectWndProc_006.asm'

;**********************************************
section '.idata' import data readable writeable

    library kernel32,'KERNEL32.DLL',\
            user32,'USER32.DLL',\
            gdi32, 'GDI32.dll'

    include 'api\kernel32.inc'
    include 'api\user32.inc'
    include 'api\gdi32.inc'

;Add these strings to the file
;fasmw17316\INCLUDE\API\USER32.INC
;import user32,\
;SetWindowLongPtrA,'SetWindowLongPtrA',\
;...
;api AppendMenu,\
;SetWindowLongPtr,\

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
                'OriginalFilename','Petzold18fasm_001.EXE'