option casemap:none

;Standard Libraries
 includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
 includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
 includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
 includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib
;Extended Libraries for CryptGenRandom
 ;includelib D:\bin\dev\asm\ml64\VS2019\lib\advapi32.lib

;Custom Includes
 include inc\API64.inc
 include inc\Call.inc
 include inc\Mem.inc
 include inc\OpenGL64.inc
 include inc\Spell.inc
 include inc\struct64.inc

.const
;Menu Equates
 include inc\Menu.inc
;Class Names
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
;Global Variables
 g_hInst dq 0

 g_hMenuInit dq 0
 g_hMenuHello dq 0
 g_hMenuRect dq 0

 g_hMenuInitWindow dq 0
 g_hMenuHelloWindow dq 0
 g_hMenuRectWindow dq 0

;Static Variables
 s_hwndClientF dq 0 ;Frame

 s_hwndFrameH dq 0 ;Hello
 s_hwndClientH dq 0

 s_hwndFrameR dq 0 ;Rect
 s_hwndClientR dq 0

;static COLORREF clrTextArray[] = 
;{RGB (0, 0, 0), RGB (255, 0, 0), RGB (0, 255, 0), RGB (0, 0, 255), RGB (255, 255, 255)} ;
 s_clrTextArray dq 0, 0FFh, 0FF00h, 0FF0000h, 0C0C0C0h

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
 mov g_hInst,rax
;Go to Main
 Call4 WinMain,g_hInst,0,0,1
;End All
 call ExitProcess
start endp

;Procedures
 include 01_WinMain\00_WinMain.asm
;FrameWndProc
 include 02_FrameWndProc\00_Frame.asm
;HelloWndProc
 include 03_HelloWndProc\00_Hello.asm
;RectWndProc
 include 04_RectWndProc\00_Rect.asm
;CloseEnumProc
 include 05_CloseEnumProc\00_CloseEnum.asm
;GetRandom64Proc
 ;include 06_RandomProc\00_GetRandom64.asm

end