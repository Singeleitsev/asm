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
include NumericConst.asm
include TesseractConst.asm

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

;Affected Vertices

;4-Buffer
;is used to compute 4D-Vertices
;affected by 4D-Rotation
v1 dd 64 dup (0)

;3-Buffer
;is used to compute 3D-Vertices
;projected from 4D-Space
v2 dd 64 dup (0)

;Camera Rotation Angles
 dA_R3_YZ dd 0.11
 dA_R3_XZ dd 0.12
 dA_R3_XY dd 0.13

;Tesseract Rotation Angles
 a_R4_ZW dd 0
 a_R4_YW dd 0
 a_R4_YZ dd 0
 a_R4_XW dd 0
 a_R4_XZ dd 0
 a_R4_XY dd 0

;Tesseract Rotation Deltas
 dA_R4_ZW dd 0.1
 dA_R4_YW dd 0.1
 dA_R4_YZ dd 0.1
 dA_R4_XW dd 0.1
 dA_R4_XZ dd 0.1
 dA_R4_XY dd 0.1

;Scale
s_3D dd 0.5
s_2D dd 0.25

.data?
;Temporary Variables
x0 dd ?
y0 dd ?
z0 dd ?
w0 dd ?
cosA dd ?
sinA dd ?

.code

include 01_WinMain\0000_WinMain.asm
include 02_WndProc\0000_WndProc.asm
include 02_WndProc\Rot4D_Proc.asm

end

