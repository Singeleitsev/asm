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

include include\NumericConst.asm
include 04_Object\CubeConst.asm

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

aYZ dd 0
aXZ dd 0
aXY dd 0.1 ;GLfloat angle

xTrans dd 0 ;GLfloat x = 0.0
yTrans dd 0 ;GLfloat y = 0.0
zTrans dd 0 ;GLfloat z = 0.0

;Camera Motion Deltas
dL_Cam dd 0.1 ;0.1 Meter
dA_Cam dd 0.5 ;0.5 Dergee

;Front Buffer
;is used to compute 3D-Vertices
;with Transformations
v3D dd 32 dup (0) ;4 Coordinates * 8 Vertices

;Counters
;i dw 2 dup (0)
i0 dw 0
i1 dw 0

.data?
;Buffers
;buf32 dd 4 dup (?)
;buf64 dd 4 dup (?)

.code

include 01_WinMain\0000_WinMain.asm
include 02_WndProc\0000_WndProc.asm
include 03_Scene\CreateGLWindow.asm
include 03_Scene\SetupWorld.asm
include 03_Scene\ReSizeGLScene.asm
include 03_Scene\InitGL.asm
include 03_Scene\DrawGLScene.asm

end

