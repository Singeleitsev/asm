option casemap:none
;Standard Libraries
	includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
	includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\GlU32.Lib

;Custom Includes
	include include\API64.inc
	include include\Call.inc
	include include\Mem.inc
	include include\OpenGL64.inc
	include include\Spell.inc
	include include\struct64.inc

.const
;Temporarily Empty

.data

 _title db 'OpenGL example',0
 _class db 'MASMOPENGL64',0

 aYZ dd 0.3
 aXZ dd 0.4
 aXY dd 0.5

dbl_TENTH dq 3fb99999a0000000h
dbl_45 dq 4046800000000000h
dbl_100 dq 4059000000000000h

 wc WNDCLASSEX64 <>

 hdc dq ?
 hrc dq ?

 msg MSG64 <>
 rc RECT64 <>
 pfd PIXELFORMATDESCRIPTOR64 <>

 clock dd ?

.data?
;Temporarily Empty

.code

include 01_WinMain\0000_WinMain.asm
include 02_WndProc\0000_WndProc.asm
include 03_Scene\DrawGLScene.asm

end

