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
include include\struct64.inc

.const
szTitle db 'OpenGL example',0
szClass db 'MASMOPENGL64',0

include include\NumericConst.inc

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

aYZ dd 0.1
aXZ dd 0.1
aXY dd 0.1

aCam dq 4046800000000000h ;GLdouble aspect = 45.0

xCam dq 4014000000000000h ;GLdouble eyeX = 5.0
yCam dq 4014000000000000h ;GLdouble eyeY = 5.0
zCam dq 4014000000000000h ;GLdouble eyeZ = 5.0

xAim dq 0 ;GLdouble centerX = 0.0
yAim dq 0 ;GLdouble centerY = 0.0
zAim dq 0 ;GLdouble centerZ = 0.0

.data?
;Temporarily Empty

.code

include 01_WinMain\0000_WinMain.asm
include 02_WndProc\0000_WndProc.asm
include 03_Scene\CreateGLWindow.asm
include 03_Scene\DrawGLScene.asm
include 03_Scene\CameraMove.asm

end

