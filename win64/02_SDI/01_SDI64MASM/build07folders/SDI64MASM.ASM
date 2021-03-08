option casemap:none
;Standard Includes and Libraries
	;include D:\bin\dev\asm\ml64\VS2019\inc\user32.inc
	;include D:\bin\dev\asm\ml64\VS2019\inc\kernel32.inc
	;;include D:\bin\dev\asm\ml64\VS2019\include\gdi32.inc
	includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
	;includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
;Custom Includes
	include inc\API64.inc
	include inc\struct64.inc
	include inc\Mem.inc
	include inc\Call.inc
	include inc\Spell.inc

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

include 00_WinMain\00_WinMain.ASM

include 01_WndProc\00_WndProc.ASM

end