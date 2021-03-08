option casemap:none
;Standard Libraries
	includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
;OpenGL
	;includelib D:\bin\dev\asm\ml64\VS2019\lib\GlU32.Lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.Lib

;Custom Includes
	include inc\API64.inc
	include inc\Call.inc
	include inc\Custom.inc
	include inc\Mem.inc
	include inc\OpenGL64.inc
	include inc\Spell.inc
	include inc\struct64.inc

WinMain PROTO :QWORD,:QWORD,:QWORD,:QWORD
WndProc PROTO :QWORD,:QWORD,:QWORD,:QWORD

.const
;Class Names
	szWndClass db "clsSDI64",0
;Window Captions
	szAppTitle db "OpenGL Fractal assembled with 64-bit MASM",0
;Info Messages
	szHello db 'Hello, Fractal World!',0
;Prompt Messages
	szExit db "Close this Application?",0
;Error Messages
	szErrFrameHandle db "Failed to get the Main Window Handle",0
	szErrWinMain db "Error in WinMain",0
;Instruction Set Messages
	szErrFMA db 'FMA instructions are not supported',10,13, 'Trying to use AVX',0
	szErrAVX db 'AVX instructions are not supported',10,13, 'Passing to SSE algorithm',0
	szErrRDRAND db 'RDRAND instruction is not supported',10,13, 'Passing to slow API algorithm',0
;Numeric Constants
	two dd 2.0
	half dd 0.5
	broadcastHalf dd 0.5,0.5,0.5,0.5
	mask32bit dd 0FFFFFFFFh,0,0,0, 0,0,0,0
;Attractor Vertices
	A CustomPoint <0.0, 0.5, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0>
	B CustomPoint <-0.5, -0.5, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0>
	C CustomPoint <0.5, -0.5, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0>
	D CustomPoint <0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 0.0>

.data
;Window Handles
	hWndMain dq 0
;Structures
	wc WNDCLASSEX64 <>
	msg MSG64 <>
	rc RECT64 <>
	pfd PIXELFORMATDESCRIPTOR64 <>
;Device Context (DC) for the Client Area
	hdc dq 0
;OpenGL Rendering Context
	hrc dq 0
;Timer
	clock dd 0
;Iteration Counter
	i dq 0
;Rotation Angle
	aXY dd 0.6
	aYZ dd 0.5
	aXZ dd 0.4
;Point to be Drawn
	P CustomPoint <0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0>
;Instruction Set Mode Pointer (FMA, AVX, SSE, x87)
	lpMode dq 0
;Randomizer Mode Pointer
	lpRand dq 0
;Debug Messages
	szAppHandle db "Application Handle: 0000.0000.0000.0000h",0
	szWndHandle db "Main Window Handle: 0000.0000.0000.0000h",0	
	szStackPointer db "rsp: 0000.0000.0000.0000h",0
	szRAX db "RAX: 0000.0000.0000.0000h",0

.data?
;Temporarily Empty

.code

include 00_WinMain\00_WinMain.ASM

include 01_WndProc\00_WndProc.ASM

end