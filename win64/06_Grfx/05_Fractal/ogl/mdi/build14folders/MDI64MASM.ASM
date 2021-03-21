option casemap:none

;Standard Libraries
	includelib F:\bin\dev\asm\ml64\VS2019\lib\user32.lib
	includelib F:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
	includelib F:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
	includelib F:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib
;Custom includes
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
;Numbers
	theta dd 0.6

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
;Graphic Handles
	hDC dq 0
	hRC dq 0
;Structures
        wc WNDCLASSEX64 <>
        msg MSG64 <>
        MDICreate MDICREATESTRUCT64 <>
        ClientStruct CLIENTCREATESTRUCT64 <>
	rc RECT64 <>
	pfd PIXELFORMATDESCRIPTOR64 <>
;Debug Messages
        szAppHandle db "Application Handle: 0000.0000.0000.0000h",0
        szFrameHandle db "Frame Window Handle: 0000.0000.0000.0000h",0
	szLastErr db "Last Error Code: 0000.0000.0000.0000h",0

.data?
	clock dd ?

.code

include 01_WinMain\00_WinMain.asm
include 02_FrameWndProc\000_FrameWndProc.asm
include 03_ChildWndProc\000_ChildWndProc.asm
include 04_CloseEnumProc\00_CloseEnumProc.asm

end
