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
include include\NumericConst.asm
include 04_Object\TesseractConst.asm

szTitle db 'Tesseract',0
szClass db 'MASMOPENGL64',0

;Debug Messages
szStart db 'Start',0
szEnd db 'End',0
szWinMain db 'WinMain',0
szWndProc db 'WndProc',0
szCreateGLWindow db 'CreateGLWindow',0
szInitGL db 'InitGL',0
szReSizeGLScene db 'ReSizeGLScene',0
szDrawGLScene db 'DrawGLScene',0
szKillGLWindow db 'KillGLWindow',0

;WinMain
szWinMainErr db 'Error in WinMain',0

;CreateGLWindow
szErrRegisterClass db 'Failed To Register The Window Class',0
szErrCreateWindow db 'Window Creation Error',0
szErrAdjustWindow db 'Window Adjustion Error',0
szErrGetDC db 'Failed to Create A GL Device Context',0
szErrChoosePixelFormat db 'Failed to Find A Suitable PixelFormat',0
szErrSetPixelFormat db 'Failed to Set The PixelFormat',0
szErrCreateContext db 'Failed to Create A GL Rendering Context',0
szErrMakeCurrent db 'Failed to Activate The GL Rendering Context',0
szErrReSizeGLScene db 'Failed to ReSize The GL Scene',0
szErrInitGL db 'Initialization Failed',0

;KillGLWindow
szErrReMakeCurrent db 'Release Of DC And RC Failed',0
szErrDeleteContext db 'Release Rendering Context Failed',0
szErrReleaseDC db 'Release Device Context Failed',0
szErrDestroyWindow db 'Could Not Release hWnd',0
szErrUnregisterClass db 'Could Not Unregister Class',0

.data
g_hInst dq 0
g_hWnd dq 0
g_hDC dq 0
g_hRC dq 0
g_PixelFormat dq 0

wc WNDCLASSEX64 <>
msg MSG64 <>
rc RECT64 <>
pfd PIXELFORMATDESCRIPTOR64 <>

;WindowSize
nWidth dd 640
nHeight dd 480

;Array Used For The Keyboard Routine
keys db 256 dup (0)
;Bool Variable To Exit Loop Set To FALSE By Default
fWinMainDone db 0
;Window Active Flag Set To TRUE By Default
fWinMainActive db 1

;Counters
i0 dw 0
i1 dw 0
;i2 dw 0
;i3 dw 0

;Affected Vertices

;Back Buffer
;is used to compute 4D-Vertices
;affected by 4D-Rotation
v4D dd 64 dup (0) ;4 Coordinates + 16 Vertices

;Front Buffer
;is used to compute 3D-Vertices
;projected from 4D-Space
v3D dd 64 dup (0) ;4 Coordinates + 16 Vertices

;3D Scale Factors
xTrans dd 0
yTrans dd 0
zTrans dd 0

;Camera Speed
dL_Cam dd 0.05

;3D Rotation Angles
a_R3_YZ dd 0
a_R3_XZ dd 0
a_R3_XY dd 0

;3D Rotation Deltas
da_R3_YZ dd 0.1
da_R3_XZ dd 0.1
da_R3_XY dd 0.1

;4D Rotation Angles
a_R4_ZW dd 0
a_R4_YW dd 0
a_R4_YZ dd 0
a_R4_XW dd 0
a_R4_XZ dd 0
a_R4_XY dd 0

;4D Rotation Deltas
da_R4_ZW dd 0.1
da_R4_YW dd 0.1
da_R4_YZ dd 0.1
da_R4_XW dd 0.1
da_R4_XZ dd 0.1
da_R4_XY dd 0.1

;Spell Patterns
sz_hInst db 'hInst: 0000.0000.0000.0000h',0
sz_lParam db 'lParam: 0000.0000.0000.0000h',0
sz_wParam db 'wParam: 0000.0000.0000.0000h',0
sz_hWnd db 'hWnd: 0000.0000.0000.0000h',0
szGetDC db 'hDC: 0000.0000.0000.0000h',0
szGetRC db 'hRC: 0000.0000.0000.0000h',0

.data?
;Temporary Variables
;buf32_0 dd ?
;buf64_0 dq ?
x0 dd ?
y0 dd ?
z0 dd ?
w0 dd ?
cosA dd ?
sinA dd ?

.code

include 01_WinMain\0000_WinMain.asm
include 02_WndProc\0000_WndProc.asm
include 03_Scene\CreateGLWindow.asm
include 03_Scene\InitGL.asm
include 03_Scene\ReSizeGLScene.asm
include 03_Scene\InitCamera.asm
include 03_Scene\DrawGLScene.asm
include 03_Scene\KillGLWindow.asm
include 04_Object\Rot4D_Proc.asm
include 05_Misc\Spell.asm

end

