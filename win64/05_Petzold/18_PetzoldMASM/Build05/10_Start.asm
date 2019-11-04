;--------------------------------------------------------
; MDIDEMO.C -- Multiple Document Interface Demonstration
;               (c) Charles Petzold, 1996
;--------------------------------------------------------

option casemap:none

;Standard Includes and Libraries
        include D:\bin\dev\ml64\include\user32.inc
        include D:\bin\dev\ml64\include\kernel32.inc
        include D:\bin\dev\ml64\include\gdi32.inc
        includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
        includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
        includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;Extended Includes and Libraries for CryptGenRandom
        ;include D:\bin\dev\ml64\include\advapi32.inc
        ;includelib D:\bin\dev\ml64\VS2017\lib\advapi32.lib
;For 64-bit addresses
        SetWindowLongPtrA PROTO :QWORD,:QWORD,:QWORD
        SetWindowLongPtr equ <SetWindowLongPtrA>
        GetWindowLongPtrA PROTO :QWORD,:QWORD,:QWORD
        GetWindowLongPtr equ <GetWindowLongPtrA>

;Custom Includes
        include include\struct64_20.inc
        include include\Mem_03.inc
        include include\Call_04.inc
        include include\Spell_09.inc
;Special Includes
        ;include include\Petzold18Struct64_01.inc

.const
;mdidemoH header file
;(c) Charles Petzold,1996
        INIT_MENU_POS equ 0 ;Position of SubMenu in MenuInit = 0
        HELLO_MENU_POS equ 2 ;Position of SubMenu in MenuHello = 2
        RECT_MENU_POS equ 1 ;Position of SubMenu in MenuRect = 1
;File
        IDM_NEWHELLO equ 10
        IDM_NEWRECT equ 11
        IDM_CLOSE equ 12
        IDM_EXIT equ 13
;Color
        IDM_BLACK equ 20
        IDM_RED equ 21
        IDM_GREEN equ 22
        IDM_BLUE equ 23
        IDM_WHITE equ 24
;Window
        IDM_TILE equ 30
        IDM_CASCADE equ 31
        IDM_ARRANGE equ 32
        IDM_CLOSEALL equ 33
;Help
        IDM_ABOUT equ 40
;First Child
        IDM_FIRSTCHILD equ 100
;Added during translation into MASM
        MdiMenuInit equ 50
        MdiMenuHello equ 51
        MdiMenuRect equ 52
        MdiAccel equ 60
;Classes
        szFrameClass db "MdiFrame",0
        szHelloClass db "MdiHelloChild",0
        szRectClass db "MdiRectChild",0
        szClientClass db "MDICLIENT",0 ;Pre-Defined by System
;Window Captions
        szFrameTitle db "MDI Demonstration",0
        szHelloTitle db "Hello",0
        szRectTitle db "Rectangles",0
;Prompt Messages
        szClose db "OK to close window?",0
;Error Messages
        szErrFrameHandle db "Failed to get the Frame Window Handle",0
        szErrChildHandle db "Failed to get the Child Window Handle",0
        szHeapAlloc db "Failed to allocate memory in Heap",0
        szHeapFree db "Failed to free memory from Heap",0

.data
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
;static COLORREF clrTextArray[] = 
;{RGB (0, 0, 0), RGB (255, 0, 0), RGB (0, 255, 0), RGB (0, 0, 255), RGB (255, 255, 255)} ;
        clrTextArray dq 0, 0FFh, 0FF00h, 0FF0000h, 0C0C0C0h
;For CryptGenRandom
        ;hProv dq 0
        ;pbBuffer dq 0 ;db 8 dup (0)
        ;dwLen = $-pbBuffer
;Debug Messages
        szHeapAddress db "Heap Allocated at: 0000.0000.0000.0000h",0
        szGetWindow db "Got Window Handle: 0000.0000.0000.0000h",0
        szLastErr db "Last Error Code: 0000.0000.0000.0000h",0

;.data?
        ;lpGlobalData dq ?

.code
start proc
;Align the Stack by 10h
        and rsp,-16
;Get Application Handle
        Call1 GetModuleHandleA,0
        mov hInst,rax
;Go to Main
        Call4 WinMain,hInst,0,0,1
;End All
        call ExitProcess
start endp

;Procedures
        include 20_WinMain.asm
;FrameWndProc
        include 30_Frame.asm
;CloseEnumProc
        include 40_CloseEnum.asm
;HelloWndProc
        include 50_Hello.asm
;RectWndProc
        include 60_Rect.asm
;GetRandom64Proc
        ;include 70_GetRandom64.asm
end