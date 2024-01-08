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
szTitle db 'OpenGL example',0
szClass db 'MASMOPENGL64',0

;dbl_TENTH dq 3fb99999a0000000h
;dbl_45 dq 4046800000000000h
;dbl_100 dq 4059000000000000h

flt_TENTH dd 3dcccccdh
flt_45 dd 42340000h
flt_100 dd 42c80000h

.data
g_hInst dq 0
g_hWnd dq 0
hdc dq 0
hrc dq 0

wc WNDCLASSEX64 <>
msg MSG64 <>
rc RECT64 <>
pfd PIXELFORMATDESCRIPTOR64 <>

fWinMainActive db 1
keys db 256 dup (0)

aYZ dd 0.3
aXZ dd 0.4
aXY dd 0.5

aTri dd 0.0
daTri dd 0.2

.data?
;Temporarily Empty

.code

include 01_WinMain\0000_WinMain.asm
include 02_WndProc\0000_WndProc.asm
include 03_Scene\DrawGLScene.asm
include 03_Scene\CreateGLWindow.asm

end

