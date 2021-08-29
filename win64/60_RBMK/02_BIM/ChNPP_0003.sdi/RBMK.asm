option casemap:none
;Standard Libraries
 ;includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
 ;includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
 ;includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
 ;includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib

 includelib F:\bin\dev\asm\ml64\VS2019\lib\user32.lib
 includelib F:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
 includelib F:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
 includelib F:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib

;Custom Includes
 include include\API64.inc
 include include\Call.inc
 include include\Mem.inc
 include include\OpenGL64.inc
 include include\Spell.inc
 include include\struct64.inc

.const
 include include\Const.inc

.data

 _title db 'RBMK',0
 _class db 'RBMK',0

;Rotation Angle
aXY dd 0.5
aYZ dd 0.5
aXZ dd 0.5

 wc WNDCLASSEX64 <>

 hdc dq 0
 hrc dq 0

 msg MSG64 <>
 rc RECT64 <>
 pfd PIXELFORMATDESCRIPTOR64 <>

 clock dd ?

 include include\RBMKvars.inc

.data?
;Temporarily Empty

.code

include 01_WinMain\00_WinMain.asm
include 02_WndProc\00_WndProc.asm

end

