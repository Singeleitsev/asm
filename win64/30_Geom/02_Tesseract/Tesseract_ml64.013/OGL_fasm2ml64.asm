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

.const
include TesseractConst.asm

.data

 _title db 'OpenGL example',0
 _class db 'MASMOPENGL64',0

 wc WNDCLASSEX64 <>

 hdc dq ?
 hrc dq ?

 msg MSG64 <>
 rc RECT64 <>
 pfd PIXELFORMATDESCRIPTOR64 <>

 clock dd ?

;Counters
i0 dd 0
i1 dd 0
i2 dd 0

;Affected Vertices

;4-Buffer
;is used to compute 4D-Vertices
;affected by 4D-Rotation
v1 dd 64 dup (0)

;3-Buffer
;is used to compute 3D-Vertices
;projected from 4D-Space
v2 dd 64 dup (0)

;Demo Rotation Angle
 aYZ dd 0.3
 aXZ dd 0.4
 aXY dd 0.5

Scale dd 1.0

.data?
;Temporarily Empty

.code

include 01_WinMain\0000_WinMain.asm
include 02_WndProc\0000_WndProc.asm

end

