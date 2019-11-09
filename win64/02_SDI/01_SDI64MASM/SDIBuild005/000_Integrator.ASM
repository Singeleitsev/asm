option casemap:none
;Standard Libraries
	includelib D:\bin\dev\ml64\VS2019\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2019\lib\kernel32.lib
	;includelib D:\bin\dev\ml64\VS2019\lib\gdi32.lib
;Custom Includes
	include include\API64.inc
	include include\struct64.inc
	include include\Mem.inc
	include include\Call.inc
	include include\Spell.inc

.const
;Menu Equates
	;include include\Menu.inc
;Class Names
	szWndClass db "clsSDI64",0
;Window Captions
	szAppTitle db "64-bit SDI Application assembled with MASM",0
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