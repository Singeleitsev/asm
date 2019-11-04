option casemap:none
;Standard Includes and Libraries
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	;include D:\bin\dev\ml64\include\gdi32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	;includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
;Custom Includes
	include include\struct64_20.inc
	include include\Mem_03.inc
	include include\Call_04.inc
	include include\Spell_09.inc

WinMain PROTO :QWORD,:QWORD,:QWORD,:QWORD
WndProc PROTO :QWORD,:QWORD,:QWORD,:QWORD

.const
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

include 010_WinMain_002.ASM

include 020_WndProc_003.ASM

end