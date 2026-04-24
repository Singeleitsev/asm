option casemap:none
option prologue: none
option epilogue: none

;Standard Libraries
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\Comctl32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\GlU32.Lib

;WinMain
GetModuleHandleA PROTO :QWORD
LoadCursorA PROTO :QWORD,:QWORD
LoadIconA PROTO :QWORD,:QWORD
GetStockObject PROTO :QWORD
RegisterClassExA PROTO :QWORD
CreateWindowExA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD
ShowWindow PROTO :QWORD,:QWORD
UpdateWindow PROTO :QWORD
SetForegroundWindow PROTO :QWORD
SetFocus PROTO :QWORD
PeekMessageA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD
TranslateMessage PROTO :QWORD
DispatchMessageA PROTO :QWORD
SendMessageA PROTO :QWORD,:QWORD,:QWORD,:QWORD
ExitProcess PROTO :QWORD
GetLastError PROTO

;WndProc
SetWindowTextA PROTO :QWORD,:QWORD
MessageBoxA PROTO :QWORD,:QWORD,:QWORD,:QWORD
DefWindowProcA PROTO :QWORD,:QWORD,:QWORD,:QWORD
DestroyWindow PROTO :QWORD
PostQuitMessage PROTO :QWORD

;Menu
CreateMenu PROTO
CreatePopupMenu PROTO
SetMenu PROTO :QWORD,:QWORD
DrawMenuBar PROTO :QWORD
AppendMenuA PROTO :QWORD,:QWORD,:QWORD,:QWORD
CreateAcceleratorTableA PROTO :QWORD,:QWORD
TranslateAcceleratorA PROTO :QWORD,:QWORD,:QWORD
CheckMenuItem PROTO :QWORD,:QWORD,:QWORD
DestroyAcceleratorTable PROTO :QWORD
DestroyMenu PROTO :QWORD

;StatusBar
InitCommonControlsEx PROTO :QWORD

;GDI & Paint
GetDC PROTO :QWORD
ReleaseDC PROTO :QWORD,:QWORD
GetClientRect PROTO :QWORD,:QWORD
ChoosePixelFormat PROTO :QWORD,:QWORD
SetPixelFormat PROTO :QWORD,:QWORD,:QWORD
SwapBuffers PROTO :QWORD

;OpenGL
wglCreateContext PROTO :QWORD
wglMakeCurrent PROTO :QWORD,:QWORD
wglDeleteContext PROTO :QWORD
glDepthFunc PROTO :QWORD
glViewport PROTO :QWORD,:QWORD,:QWORD,:QWORD
glMatrixMode PROTO :QWORD
glLoadIdentity PROTO
glEnable PROTO :QWORD
glDisable PROTO :QWORD
glHint PROTO :QWORD,:QWORD
glClearColor PROTO :REAL4,:REAL4,:REAL4,:REAL4
glClear PROTO :QWORD
glBegin PROTO :QWORD
glEnd PROTO
glPushMatrix PROTO
glPopMatrix PROTO
glTranslatef PROTO :REAL4,:REAL4,:REAL4
glRotatef PROTO :REAL4,:REAL4,:REAL4,:REAL4
glScalef PROTO :REAL4,:REAL4,:REAL4
glColor3f PROTO :REAL4,:REAL4,:REAL4
glVertex3f PROTO :REAL4,:REAL4,:REAL4
gluPerspective PROTO :REAL8,:REAL8,:REAL8,:REAL8
glNormal3f PROTO :REAL4,:REAL4,:REAL4
glShadeModel PROTO :QWORD
glMaterialfv PROTO :QWORD,:QWORD,:QWORD
glLightfv PROTO :QWORD,:QWORD,:QWORD
glFlush PROTO


;System Structures
WNDCLASSEX64 STRUCT
cbSize dd ?
style dd ?
lpfnWndProc dq ?
cbClsExtra dd ?
cbWndExtra dd ?
hInstance dq ?
hIcon dq ?
hCursor dq ?
hbrBackground dq ?
lpszMenuName dq ?
lpszClassName dq ?
hIconSm dq ?
WNDCLASSEX64 ENDS

POINT2D STRUCT
x dd ?
y dd ?
POINT2D ENDS

MSG64 STRUCT
hWnd dq ?
message dd ?
wParam dq ?
lParam dq ?
time dd ?
pt POINT2D <>
MSG64 ENDS

RECT64 STRUCT
left dd ?
top dd ?
right dd ?
bottom dd ?
RECT64 ENDS

PIXELFORMATDESCRIPTOR64 STRUC
nSize dw ?
nVersion dw ?
dwFlags dd ?
iPixelType db ?
cColorBits db ?
cRedBits db ?
cRedShift db ?
cGreenBits db ?
cGreenShift db ?
cBlueBits db ?
cBlueShift db ?
cAlphaBits db ?
cAlphaShift db ?
cAccumBits db ?
cAccumRedBits db ?
cAccumGreenBits db ?
cAccumBlueBits db ?
cAccumAlphaBits db ?
cDepthBits db ?
cStencilBits db ?
cAuxBuffers db ?
iLayerType db ?
bReserved db ?
dwLayerMask dd ?
dwVisibleMask dd ?
dwDamageMask dd ?
PIXELFORMATDESCRIPTOR64 ENDS

INITCOMMONCONTROLSEX64 STRUC
dwSize dd ?
dwICC dd ?
INITCOMMONCONTROLSEX64 ENDS

ACCEL64 STRUC
fVirt dw ?
key dw ?
cmd dw ?
ACCEL64 ENDS

.const
;Numeric
include 00_ConstNumeric.asm
;Object
include 01_Layout.asm

;Mnemonics
MOUSE_MODE_NO_ACTION equ 0
MOUSE_MODE_CAMERA_ROTATION equ 1
MOUSE_MODE_CAMERA_ROLL equ 2
MOUSE_MODE_CAMERA_PAN equ 3
CAMERA_MODE_PLANAR equ 0
CAMERA_MODE_SPATIAL equ 1

;Menu ID's
IDM_APP_EXIT equ 10Fh
IDM_CAMERA_MODE_PLANAR equ 200h
IDM_CAMERA_MODE_SPATIAL equ 201h
IDM_HELP_ABOUT equ 0F01h

.data
;System Structures
wcx WNDCLASSEX64 <>
msg MSG64 <>
RectMain RECT64 <>
pfd PIXELFORMATDESCRIPTOR64 <>
icce INITCOMMONCONTROLSEX64 <>
accel ACCEL64<>

;Global Handles
ghInst dq 0
ghWnd dq 0

;Menu Handles
hMenu dq 0
hMenuFile dq 0
hMenuOptions dq 0
hMenuOptionsCamera dq 0
hMenuHelp dq 0
hAccTable dq 0

;Status Bar
hwndStatusBar dq 0
idStatusBar dq 0
;Divide Status Bar by 9 parts
xStatusParts dd 8 dup (0),-1 ;9 Variables
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 102,204,307,430,552,675,788,901 ;8 Constants
;Floating Point
f32_Absolute dd 0
bcd80_Absolute dt 0

;Flags
nCameraMode db CAMERA_MODE_SPATIAL
nMouse db MOUSE_MODE_NO_ACTION
isActive db 0 ;Prevents from drawing while the Window is not visible
isInitialPosition db 1 ;For Esc Key
isRefreshed db 0 ;Prevents from rebuilding unchanged scene

;Keyboard Buffer
key db 256 dup (0)
nKeyCode dw 0

;OpenGL
ghDC dq 0
ghRC dq 0
iPixelFormat dq 0
RectWidth dd 0 ;Integer
RectHeight dd 0 ;Integer
RectAspect dq 0 ;Float64

;Cursor Position
xScrCenter dd 200h ;1024 / 2 = 512
yScrCenter dd 150h ;768 / 2 = 384
xCurPos dd 0 ;Current Cursor Position
yCurPos dd 0
xPrevPos dd 0 ;Previous Position
yPrevPos dd 0

;Model Angle
aXY_Model dd 41a00000h ;f32_20.0
aYZ_Model dd 0 ;f32_0.0
aXZ_Model dd 0 ;f32_0.0

;Camera Angle
aYZ_Cam dd 43960000h ;Tilt = f32_300.0
aXY_Cam dd 0 ;Turn = f32_0.0
aXZ_Cam dd 0 ;Roll = f32_0.0
;Camera Position
xCam dd 0 ;f32_0.0
yCam dd 460ca000h ;f32_9000 = Move the World 9 Meters Forward = Move the Camera 9 Meters Back
zCam dd 0c58ca000h ;f32_neg4500 = Move the World 4.5 Meters Down = Move the Camera 4.5 Meters Up
;wCam dd 0 ;Dummy for SSE Operations

;Motion
dStep dd 42c80000h ;f32_100.0
dAngle dd 3F800000h ;f32_1.0
LinearSpeed dd 42c80000h ;f32_100.0
AngularSpeed dd 3F800000h ;f32_1.0
LinearBoost dd 41200000h ;f32_10.0
AngularBoost dd 41200000h ;f32_10.0
dTab dd 41f00000h ;f32_30.0

;Affine Transformations
cosA dd 0
sinA dd 0
;dummy1 dd 3F800000h ;1.0f
;dummy0 dd 0

;Camera Coordinates (Actually, World Displacement Coordinates)
dxCam dd 0
dyCam dd 0
dzCam dd 0
;dwCam dd 0 ;Dummy for SSE Operations

;Gray
;matGraySpecular dd ;0.5,0.5,0.5
;matGrayShininess dd ;10.0
matGrayAmbDiff dd 3f1eb852h,3f23d70ah,3f30a3d7h,3f800000h ;0.62,0.64,0.69,1.0
;Green
;matGreenSpecular As RGBA
;matGreenShininess As Single
matGreenAmbDiff dd 3e19999ah,3f400000h,3e19999ah,3f800000h ;0.15,0.75,0.15,1.0
;Yellow
;matYellowSpecular As RGBA
;matYellowShininess As Single
matYellowAmbDiff dd 3f59999ah,3f59999ah,3e19999ah,3f800000h ;0.85,0.85,0.15,1.0
;Red
;matRedSpecular As RGBA
;matRedShininess As Single
matRedAmbDiff dd 3f59999ah,3e19999ah,3e19999ah,3f800000h ;0.85,0.15,0.15,1.0
;Blue
;matBlueSpecular As RGBA
;matBlueShininess As Single
matBlueAmbDiff dd 3e800000h,3ecccccdh,3f59999ah,3f800000h ;0.25,0.4,0.85,1.0
;Cherenkov-Vavilov
;matBlueEmission dd 3d4ccccdh,3d99999ah,3dcac083h,3f800000h ;0.05,0.075,0.099,1.0

;Lights
light_position dd 0c63b8000h,0c63b8000h,46bb8000h,3f800000h; -12000.0,-12000.0,24000.0,1.0
light_ambient dd 3a83126fh,3a83126fh,3a83126fh,0 ;0.001,0.001,0.001,0.0
light_diffuse dd 3a83126fh,3a83126fh,3a83126fh,0 ;0.001,0.001,0.001,0.0
;light_specular As RGBA

;Strings
nFrame dd 0
szMainWndTitle db 'MASM64 OpenGL Environment' ;No Zero Terminator
szMainWndTitleFrame db '- [Frame 00000000]',0
szMainWndClass db 'MainWndClass',0
szMsgCloseText db 'Exit?',0

;Menu
szMenuFile db '&File',0
szMenuFileExit db 'E&xit',9,'Ctrl+W',0
szMenuOptions db '&Options',0
szMenuOptionsCamera db 'Camera &Mode',0
szMenuOptionsCameraMode0 db '&Ortho Mode',0
szMenuOptionsCameraMode1 db '&Free Movement',0
szMenuHelp db '&Help',0
szMenuHelpAbout db '&About...',9,'F1',0

;Status Bar
;https://learn.microsoft.com/en-us/windows/win32/winauto/status-bar-control
szStatusClassName db 'msctls_statusbar32',0 ;"STATUSCLASSNAMEW"
sz_xCamText db 'xCam = ' ;No Zero Terminator
sz_xCamValue db 11 dup (0) ;'-1234.5678',0
sz_yCamText db 'yCam = '
sz_yCamValue db 11 dup (0)
sz_zCamText db 'zCam = '
sz_zCamValue db 11 dup (0)
sz_aYZ_CamText db 'aYZ_Cam = '
sz_aYZ_CamValue db 10 dup (0) ;'-360.1234',0
sz_aXY_CamText db 'aXY_Cam = '
sz_aXY_CamValue db 10 dup (0)
sz_aXZ_CamText db 'aXZ_Cam = '
sz_aXZ_CamValue db 10 dup (0)
sz_aYZ_ModelText db 'aYZ_Model = '
sz_aYZ_ModelValue db 10 dup (0)
sz_aXY_ModelText db 'aXY_Model = '
sz_aXY_ModelValue db 10 dup (0)
sz_aXZ_ModelText db 'aXZ_Model = '
sz_aXZ_ModelValue db 10 dup (0)

;Manual
szAboutMsgTitle db 'Manual',0
szAboutMsgText db 'Camera Motion:',13 ;No Zero Terminator
db 'Left Mouse Button - Look Left-Right, Up-Down',13
db 'Mouse Wheel Down - Move Camera Left-Right, Up-Down',13
db 'Right Mouse Button - Roll Camera Left-Right, Look Up-Down',13
db 'Mouse Scroll - Move Camera Forward-Backward',13
db 13
db 'Arrow Up - Move Forward',13
db 'Arrow Down - Move Backward',13
db 'Arrow Left - Move Left',13
db 'Arrow Right - Move Right',13
db 'Page Up - Move Up',13
db 'Page Down - Move Down',13
db 13
db 'Object Rotation:',13
db 'W - Tilt from the Camera',13
db 'S - Tilt to the Camera',13
db 'A - Turn Left',13
db 'D - Turn Right',13
db 'Q - Tilt Left',13
db 'E - Tilt Right',13
db 13
db 'Tab - Turn the Object Clockwise Quick',13
db 13
db 'Space, Esc - Reset Scene',13
db 'Shift - Boost',0

;Debug
nLastError dd 0
szErr db 'Error',0
szErrGetModuleHandle db 'GetModuleHandle Error: 0x' ;No Zero Terminator
szErrGetModuleHandleCode db 5 dup (0) ;'0000',0
szErrRegisterClass db 'RegisterClass Error: 0x'
szErrRegisterClassCode db 5 dup (0)
szErrCreateWindow db 'CreateWindow Error: 0x'
szErrCreateWindowCode db 5 dup (0)
szErrChoosePixelFormat db 'ChoosePixelFormat Error: 0x'
szErrChoosePixelFormatCode db 5 dup (0)
szErrCreateContext db 'wglCreateContext Error: 0x'
szErrCreateContextCode db 5 dup (0)
szErrGetClientRect db 'GetClientRect Error: 0x'
szErrGetClientRectCode db 5 dup (0)
szErrCreateMenu db 'CreateMenu Error: 0x'
szErrCreateMenuCode db 5 dup (0)
szErrCreateStatusBar db 'CreateStatusBar Error: 0x'
szErrCreateStatusBarCode db 5 dup (0)

.code
include 10_WinMainProc.asm
;include 11_InitializeGL.asm
;include 12_CreateMenu.asm
;include 13_CreateStatusBar.asm
include 14_ReAssignProc.asm

include 20_WndProc.asm
;include 21_GLResize.asm
;include 22_1_MouseTurn.asm
;include 22_2_MouseRoll.asm
;include 22_3_MousePan.asm
;include 22_4_MouseZoom.asm
include 28_AboutProc.asm
include 29_CloseProc.asm

include 30_DrawGLSceneProc.asm
;include 31_CheckKeys.asm
include 32_CheckAngleProc.asm
;include 33_CamMode_0.asm
include 34_CamMove2DProc.asm
;include 35_CamMode_1.asm
include 36_CamMove3DProc.asm
include 37_CheckDistProc.asm

;include 40_RefreshTitle.asm
;include 41_RefreshStatus.asm
include 42_FloatConvertProc.asm

;include 50_SetView.asm
include 51_DrawAxesProc.asm
include 52_DrawObjectProc.asm
include 53_DrawCapProc.asm

;include 60_CalcNormalProc.asm
;include 61_Lighting.asm

include 90_SpellErrorProc.asm

end
