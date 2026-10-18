option casemap:none
;Standard Libraries
	includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib

;Custom Includes
	include include\API64.inc
	include include\Call.inc
	include include\Mem.inc
	include include\OpenGL64.inc
	include include\Spell.inc
	include include\struct64.inc

CustomPoint STRUCT
 x dd 0.0f ;00h
 y dd 0.0f ;04h
 z dd 0.0f ;08h
 t dd 0.0f ;0Ch
 r dd 0.0f ;10h
 g dd 0.0f ;14h
 b dd 0.0f ;18h
 a dd 0.0f ;1Ch
CustomPoint ENDS

.const
include NumericConst.asm
include SpongeConst.asm

.data

_title db 'OpenGL example',0
_class db 'MASMOPENGL64',0

wc WNDCLASSEX64 <>

hdc dq 0
hrc dq 0

msg MSG64 <>
rc RECT64 <>
pfd PIXELFORMATDESCRIPTOR64 <>

;Timing
tick dq 0Ah ;USER_TIMER_MINIMUM = 0Ah = 10 ms
clock dd 0

;Counters
i0 dw 0
i1 dw 0
i2 dw 0
i3 dw 0

;Camera Rotation Angles
 aYZ dd 0.11
 aXZ dd 0.12
 aXY dd 0.13

.data?
;Temporary Variables
P CustomPoint <>

.code

include 01_WinMain\0000_WinMain.asm
include 02_WndProc\0000_WndProc.asm
;include 03_SpongeProc\SpongeProc.asm

end

