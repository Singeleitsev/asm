option casemap:none

;Standard Includes and Libraries
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	include D:\bin\dev\ml64\include\gdi32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;Custom includes
	include include\struct64_20.inc
	include include\Mem_03.inc
	include include\Call_04.inc
	include include\Spell_09.inc

.const
        IDR_MAINMENU    = 100h
        IDR_CHILDMENU   = 110h
	;IDR_ACCEL	= 200h
;File
        IDM_NEW         = 1100h
        IDM_CLOSE       = 1F00h
        IDM_CLOSEALL    = 1FF0h
        IDM_EXIT        = 1FFFh
;Window
        IDM_TILEHORZ    = 0E001h
        IDM_TILEVERT    = 0E002h
        IDM_CASCADE     = 0E004h
;Help
        IDM_ABOUT       = 0F000h

        IDM_FIRSTCHILD  = 800h

;Class Names
        szFrameClass db "MdiFrame",0
        szClientClass db "MDICLIENT",0
        szChildClass db "MdiChild",0
;Window Captions
        szFrameTitle db "Win64 MDI Demo",0
        szChildTitle db "MDI Child",0
;Info Messages
	szHello db 'Hello, World!',0
	szAbout db 'Inspired by Charles Petzold, Iczelion, and Mikl___',0
;Prompt Messages
        szClose db "Close this Child Window?",0
;Error Messages
        szErrMenu db "Failed to load Menu",0
        szErrWinMain db "Error in WinMain",0

.data
;Window Handles
        hInstance dq 0
        hWndFrame dq 0
        hWndClient dq 0
        hWndChild dq 0
;Menu Handles
        hMainMenu dq 0
        hMainSubMenu dq 0
        hChildMenu dq 0
        hChildSubMenu dq 0
;Structures
        wc WNDCLASSEX64 <>
        msg MSG64 <>
        MDICreate MDICREATESTRUCT64 <>
        ClientStruct CLIENTCREATESTRUCT64 <>
;Debug Messages
        szAppHandle db "Application Handle: 0000.0000.0000.0000h",0
        szFrameHandle db "Frame Window Handle: 0000.0000.0000.0000h",0
	szLastErr db "Last Error Code: 0000.0000.0000.0000h",0

.data?
	;Temporarily Empty

.code

include 010_WinMain_002.asm

include 020_FrameWndProc_003h.asm

include 030_ChildWndProc_004h.asm

include 040_CloseEnum_001.asm

end
