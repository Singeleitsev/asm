option casemap:none

;Standard Libraries
 ;includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
 ;includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
 ;includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
 ;includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib

 includelib F:\bin\dev\asm\ml64\VS2019\lib\user32.lib
 includelib F:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
 includelib F:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
 includelib F:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib

;Custom Includes
 include inc\API64.inc
 include inc\Call.inc
 include inc\Mem.inc
 include inc\OpenGL64.inc
 include inc\Spell.inc
 include inc\struct64.inc


.const
;Numeric Constants
 include inc\Const.inc
;Menu Equates
 include inc\Menu.inc
;Class Names
 szFrameClass db "MdiFrame",0
 szChNPPClass db "MdiChNPPChild",0
 szRBMKClass db "MdiRBMKChild",0
 szClientClass db "MDICLIENT",0 ;Pre-Defined by System
;Window Captions
 szFrameTitle db "MDI Demonstration",0
 szChNPPTitle db "ChNPP - Chernobyl Nuclear Power Plant",0
 szRBMKTitle db "RBMK - High-Power Channel-Type Reactor",0
;Prompt Messages
 szClose db "OK to close window?",0
;Error Messages
 szErrFrameHandle db "Failed to get the Frame Window Handle",0
 szErrChildHandle db "Failed to get the Child Window Handle",0
 szHeapAlloc db "Failed to allocate memory in Heap",0
 szHeapFree db "Failed to free memory from Heap",0


.data
 include inc\RBMKvars.inc

;Global Variables
 g_hInst dq 0

 g_hMenuInit dq 0
 g_hMenuChNPP dq 0
 g_hMenuRBMK dq 0

 g_hMenuWindowInit dq 0
 g_hMenuWindowChNPP dq 0
 g_hMenuWindowRBMK dq 0

;Static Variables
 s_hwndClientFrame dq 0 ;Frame

 s_hwndFrameChNPP dq 0 ;ChNPP
 s_hwndClientChNPP dq 0

 s_hwndFrameRBMK dq 0 ;RBMK
 s_hwndClientRBMK dq 0

;static COLORREF clrTextArray[] = 
;{RGB (0, 0, 0), RGB (255, 0, 0), RGB (0, 255, 0), RGB (0, 0, 255), RGB (255, 255, 255)} ;
 s_clrTextArray dq 0, 0FFh, 0FF00h, 0FF0000h, 0C0C0C0h

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
 include 03_ChNPPWndProc\00_ChNPP.asm
;RectWndProc
 include 04_RBMKWndProc\00_RBMK.asm
;CloseEnumProc
 include 05_CloseEnumProc\00_CloseEnum.asm

end
