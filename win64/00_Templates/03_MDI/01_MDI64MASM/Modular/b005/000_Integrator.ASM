option casemap:none

;Standard Libraries
	includelib D:\bin\dev\ml64\VS2019\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2019\lib\kernel32.lib
	includelib D:\bin\dev\ml64\VS2019\lib\gdi32.lib
;Custom includes
	include include\API64.inc
	include include\struct64.inc
	include include\Mem.inc
	include include\Call.inc
	include include\Spell.inc

.const
;Menu Equates
        include include\Menu.inc
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

include 010_WinMain.asm

include 020_FrameWndProc.asm

include 030_ChildWndProc.asm

include 040_CloseEnum.asm

end
