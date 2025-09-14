option casemap:none

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
ExitProcess PROTO
GetLastError PROTO

;WndProc
MessageBoxA PROTO :QWORD,:QWORD,:QWORD,:QWORD
DefWindowProcA PROTO :QWORD,:QWORD,:QWORD,:QWORD
DestroyWindow PROTO
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
glHint PROTO :QWORD,:QWORD
glClearColor PROTO :QWORD,:QWORD,:QWORD,:QWORD
glClear PROTO :QWORD
glBegin PROTO :QWORD
glEnd PROTO
glPushMatrix PROTO
glPopMatrix PROTO
glTranslatef PROTO :QWORD,:QWORD,:QWORD
glRotatef PROTO :QWORD,:QWORD,:QWORD,:QWORD
glScalef PROTO :QWORD,:QWORD,:QWORD
glColor3f PROTO :QWORD,:QWORD,:QWORD
glVertex3f PROTO :QWORD,:QWORD,:QWORD
gluPerspective PROTO :QWORD,:QWORD,:QWORD,:QWORD

;Structures
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
;Structures
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

;Flags
nCameraMode db CAMERA_MODE_SPATIAL
nMouse db MOUSE_MODE_NO_ACTION
isActive db 0
isRefreshed db 1

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

;Model Scale
GlobalScale dd 3A83126Fh ;0.001_f32
;Model Angle
aYZ_Model dd 0 ;0.0_f32
aXY_Model dd 41a00000h ;20.0_f32
aXZ_Model dd 0 ;0.0_f32

;Camera Angle
aYZ_Cam dd 43960000h ;Tilt = 300.0_f32
aXY_Cam dd 0 ;Turn = 0.0_f32
aXZ_Cam dd 0 ;Roll = 0.0_f32
;Camera Position
xCam dd 0 ;0.0_f32
yCam dd 41100000h ;9.0_f32 = Move the World 9 Meters Forward = Move the Camera 9 Meters Back
zCam dd 0c0900000h ;-4.5_f32 = Move the World 4.5 Meters Down = Move the Camera 4.5 Meters Up

;Motion
dStep dd 3DCCCCCDh ;0.1_f32
dAngle dd 3F800000h ;1.0_f32
LinearSpeed dd 3DCCCCCDh ;0.1_f32
AngularSpeed dd 3F800000h ;1.0_f32
LinearBoost dd 41200000h ;10.0_f32
AngularBoost dd 41200000h ;10.0_f32
dTab dd 41f00000h ;30.0_f32

;Affine Transformations
;aRad dd 0
cosA dd 0
sinA dd 0
dxCam0 dd 0
dyCam0 dd 0
dzCam0 dd 0
dxCam1 dd 0
dyCam1 dd 0
dzCam1 dd 0
dxCam2 dd 0
dyCam2 dd 0
dzCam2 dd 0
dxCam3 dd 0
dyCam3 dd 0
dzCam3 dd 0

;Floating Point
f32_Absolute dd 0
bcd80_Absolute dt 0

;Keyboard Buffer
key db 128 dup (0)
nKeyCode dw 0

;Strings
szMainWndTitle db 'MASM64 OpenGL Environment',0
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
szAboutMsgTitle db 'Manual',0
szAboutMsgText db 'Camera Motion:',13
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

;Status Bar
;https://learn.microsoft.com/en-us/windows/win32/winauto/status-bar-control
szStatusClassName db 'msctls_statusbar32',0 ;"STATUSCLASSNAMEW"
sz_xCam db 'xCam = ',11 dup (0)
lpsz_xCam = $ - 11 ;First Empty (00h) Byte of Total 11
sz_yCam db 'yCam = ',11 dup (0)
lpsz_yCam = $ - 11
sz_zCam db 'zCam = ',11 dup (0)
lpsz_zCam = $ - 11
sz_aYZ_Cam db 'aYZ_Cam = ',10 dup (0)
lpsz_aYZ_Cam = $ - 10 ;First Empty (00h) Byte of Total 10
sz_aXY_Cam db 'aXY_Cam = ',10 dup (0)
lpsz_aXY_Cam = $ - 10
sz_aXZ_Cam db 'aXZ_Cam = ',10 dup (0)
lpsz_aXZ_Cam = $ - 10
sz_aYZ_Model db 'aYZ_Model = ',10 dup (0)
lpsz_aYZ_Model = $ - 10
sz_aXY_Model db 'aXY_Model = ',10 dup (0)
lpsz_aXY_Model = $ - 10
sz_aXZ_Model db 'aXZ_Model = ',10 dup (0)
lpsz_aXZ_Model = $ - 10

;Debug
nLastError dq 0
szErrGetModuleHandle db 'GetModuleHandle Error: 0x0000',0
lpszErrGetModuleHandleCode = $-2 ;Last Zero (30h) Byte
szErrRegisterClass db 'RegisterClass Error: 0x0000',0
lpszErrRegisterClassCode = $-2
szErrCreateWindow db 'CreateWindow Error: 0x0000',0
lpszErrCreateWindowCode = $-2
szErrChoosePixelFormat db 'ChoosePixelFormat Error: 0x0000',0
lpszErrChoosePixelFormatCode = $-2
szErrCreateContext db 'wglCreateContext Error: 0x0000',0
lpszErrCreateContextCode = $-2
szErrGetClientRect db 'GetClientRect Error: 0x0000',0
lpszErrGetClientRectCode = $-2
szErrCreateMenu db 'CreateMenu Error: 0x0000',0
lpszErrCreateMenuCode = $-2
szErrCreateStatusBar db 'CreateStatusBar Error: 0x0000',0
lpszErrCreateStatusBarCode = $-2

.code
include 10_WinMain.asm
;include 11_InitializeGL.asm
include 12_ReAssignProc.asm
;include 13_CreateMenu.asm
;include 14_CreateStatusBar.asm

include 20_WndProc.asm
;include 23_GLResize.asm
;include 24_1_MouseRotate.asm
;include 24_2_MouseRoll.asm
;include 24_3_MousePan.asm
;include 24_4_MouseZoom.asm
include 28_AboutProc.asm
include 29_CloseProc.asm

include 30_DrawGLSceneProc.asm
;include 31_CheckKeys.asm
include 32_CheckAngleProc.asm
include 33_CheckDistanceProc.asm
include 34_CameraMoveProc.asm
;include 35_SetView.asm

;include 40_RefreshStatus.asm
include 41_FloatConvertProc.asm

include 50_DrawAxesProc.asm
include 51_DrawObjectProc.asm
include 52_DrawCapProc.asm

include 90_SpellErrorProc.asm


end
