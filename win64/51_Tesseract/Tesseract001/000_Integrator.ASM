option casemap:none
;Standard Libraries
	includelib F:\bin\dev\ml64\VS2019\lib\user32.lib
	includelib F:\bin\dev\ml64\VS2019\lib\kernel32.lib
	;includelib F:\bin\dev\ml64\VS2019\lib\gdi32.lib
;OpenGL includes
	includelib F:\bin\dev\ml64\VS2019\lib\Opengl32.lib
;Custom Includes
	include include\API64.inc
	include include\OpenGL64.inc
	include include\struct64.inc
	include include\Mem.inc
	include include\Call.inc
	include include\Spell.inc

.const
;Initial Coordinates (the "A" Group of Points)
;Coordinates are Stored in blocks 32*8=256 bits each
;To be loaded in YMM register and procecced at once
;x-Coordinate of Points 0 to 7
	xA0 dd -1.0f,  1.0f,  1.0f, -1.0f, -1.0f,  1.0f,  1.0f, -1.0f
;x-Coordinate of Points 8 to 15
	xA1 dd -1.0f,  1.0f,  1.0f, -1.0f, -1.0f,  1.0f,  1.0f, -1.0f
;y-Coordinate of Points 0 to 7
	yA0 dd -1.0f, -1.0f,  1.0f,  1.0f, -1.0f, -1.0f,  1.0f,  1.0f
;y-Coordinate of Points 8 to 15
	yA1 dd -1.0f, -1.0f,  1.0f,  1.0f, -1.0f, -1.0f,  1.0f,  1.0f
;z-Coordinate of Points 0 to 7
	zA0 dd -1.0f, -1.0f, -1.0f, -1.0f,  1.0f,  1.0f,  1.0f,  1.0f
;z-Coordinate of Points 8 to 15
	zA1 dd -1.0f, -1.0f, -1.0f, -1.0f,  1.0f,  1.0f,  1.0f,  1.0f
;t-Coordinate of Points 0 to 7
	tA0 dd -1.0f, -1.0f, -1.0f, -1.0f, -1.0f, -1.0f, -1.0f, -1.0f
;t-Coordinate of Points 8 to 15
	tA1 dd  1.0f,  1.0f,  1.0f,  1.0f,  1.0f,  1.0f,  1.0f,  1.0f

;Menu Equates
	;include include\Menu.inc
;Class Names
	szWndClass db "clsTesseract",0
;Window Captions
	szAppTitle db "Tesseract",0
;Info Messages
	szHello db 'Hello,World!',0
;Prompt Messages
	szExit db "Close this Application?",0
;Error Messages
	szErrFrameHandle db "Failed to get the Main Window Handle",0
	szErrWinMain db "Error in WinMain",0

.data
;Window Handles
	hWndMain dq 0
;Structures
	wc WNDCLASSEX64 <>
	msg MSG64 <>
;Debug Messages
	szAppHandle db "Application Handle: 0000.0000.0000.0000h",0
	szWndHandle db "Main Window Handle: 0000.0000.0000.0000h",0	
	szStackPointer db "rsp: 0000.0000.0000.0000h",0

.data?
;Temporarily Empty

.code

include 010_WinMain.ASM

include 020_WndProc.ASM

end