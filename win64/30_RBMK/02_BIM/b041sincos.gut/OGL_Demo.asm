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

;StatusBar
InitCommonControlsEx PROTO :QWORD

;PopupMenu
CreateMenu PROTO
CreatePopupMenu PROTO
SetMenu PROTO :QWORD,:QWORD
DrawMenuBar PROTO :QWORD
;TrackPopupMenu PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD ;<--
AppendMenuA PROTO :QWORD,:QWORD,:QWORD,:QWORD
CheckMenuItem PROTO :QWORD,:QWORD,:QWORD
DestroyMenu PROTO :QWORD

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
INITCOMMONCONTROLSEX64 Ends

.const
;Numeric
include 00_ConstNumeric.asm
;Object
include 01_Layout.asm

;Menu ID's
IDM_APP_EXIT equ 1009
IDM_HELP_ABOUT equ 9001

.data
;Structures
wcx WNDCLASSEX64 <>
msg MSG64 <>
RectMain RECT64 <>
pfd PIXELFORMATDESCRIPTOR64 <>
icce INITCOMMONCONTROLSEX64 <>

;Global Handles
ghInst dq 0
ghWnd dq 0

;Menu Handles
hMenu dq 0
hMenuFile dq 0
hMenuHelp dq 0

;Status Bar
hwndStatusBar dq 0
idStatusBar dq 0
xStatusParts dd 100,200,300,450,600,750,900,-1 ;Divide Status Bar by 8 parts

;OpenGL
ghDC dq 0
ghRC dq 0
iPixelFormat dq 0
RectWidth dd 0 ;Integer
RectHeight dd 0 ;Integer
RectAspect dq 0 ;Float64

;WinMain
fWinMainActive dq 0
;Model Position
;xModel dd 0
;yModel dd 0
;zModel dd 0

;Model Scale
GlobalScale dd 3A83126Fh ;0.001_f32
;Model Angle
aXY_Model dd 41a00000h ;20.0_f32
;Camera Angle
aYZ_Cam dd 43960000h ;300.0_f32
aXY_Cam dd 0 ;0.0_f32
aXZ_Cam dd 0 ;0.0_f32
;Camera Position
xCam dd 0 ;0.0_f32
yCam dd 41100000h ;9.0_f32
zCam dd 0c0900000h ;-4.5_f32
;Motion
LinearSpeed dd 3DCCCCCDh ;0.1_f32
LinearBoost dd 41200000h ;10.0_f32
dStep dd 3DCCCCCDh ;0.1_f32
dxCam dd 0
dyCam dd 0
dzCam dd 0
AngularSpeed dd 3F800000h ;1.0_f32
AngularBoost dd 41200000h ;10.0_f32
dAngle dd 3F800000h ;1.0_f32
dTab dd 41f00000h ;30.0_f32

;Keyboard Buffer
key db 256 dup (0)
nKeyCode dd 0

;Strings
szMainWndTitle db 'OpenGL example',0
szMainWndClass db 'MainWndClass',0
szMsgCloseText db 'Close?',0
szMsgCloseTitle db 'Such A Good Application',0

;Menu
szMenuFile db '&File',0
szMenuFileExit db 'E&xit',9,'Ctrl+W',0
szMenuHelp db '&Help',0
szMenuHelpAbout db '&About...',0
szAboutMsgText db 'Camera Motion:',13
db 'Arrow Up - Move Forward',13
db 'Arrow Down - Move Backward',13
db 'Arrow Left - Move Left',13
db 'Arrow Right - Move Right',13
db 'Page Up - Move Up',13
db 'Page Down - Move Down',13,13
db 'Camera Rotation:',13
db 'W - Look Down',13
db 'S - Look Up',13
db 'A - Look Left',13
db 'D - Look Right',13
db 'Z - Roll Camera Left',13
db 'C - Roll Camera Right',13,13
db 'Object Rotation:',13
db 'Q - Turn the Object Counter-Clockwise',13
db 'E - Turn the Object Clockwise',13
db 'Tab - Turn the Object Clockwise Quick',13,13
db 'Shift - Boost',0
szAboutMsgTitle db 'Manual',0

;Status Bar
;https://learn.microsoft.com/en-us/windows/win32/winauto/status-bar-control
szStatusClassName db 'msctls_statusbar32',0 ;"STATUSCLASSNAMEW"
sz_xCam db 'xCam = 0.000',0 ;format(xCam, "0.000")
sz_yCam db 'yCam = 0.000',0 ;format(yCam, "0.000")
sz_zCam db 'zCam = 0.000',0 ;format(zCam, "0.000")
sz_aXY_Model db 'aXY_Model = 0.000',0 ;format(aXY_Model, "0.000")
sz_aXY_Cam db 'aXY_Cam = 0.000',0 ;format(aXY_Cam, "0.000")
sz_aYZ_Cam db 'aYZ_Cam = 0.000',0 ;format(aYZ_Cam, "0.000")

;Debug
nLastError dq 0
szErrGetModuleHandle db 'GetModuleHandle Error: 0000',0
szErrRegisterClass db 'RegisterClass Error: 0000',0
szErrCreateWindow db 'CreateWindow Error: 0000',0
szErrChoosePixelFormat db 'ChoosePixelFormat Error: 0000',0
szErrCreateContext db 'wglCreateContext Error: 0000',0
szErrGetClientRect db 'GetClientRect Error: 0000',0
szErrCreateMenu db 'CreateMenu Error: 0000',0
szErrCreateStatusBar db 'CreateStatusBar Error: 0000',0

.code
include 10_WinMain.asm
include 11_SpellErrorProc.asm
include 20_WndProc.asm
;include 21_CreateMenu.asm
;include 22_CreateStatusBar.asm
;include 23_GLResize.asm
include 24_CloseProc.asm
include 30_AboutProc.asm
include 40_InitializeGLProc.asm
include 50_DrawGLSceneProc.asm
;include 51_CheckKeys.asm
;include 52_RefreshStatus.asm
;include 53_SetView.asm
include 60_ResetSceneProc.asm
include 70_DrawAxesProc.asm
include 71_DrawObjectProc.asm
include 72_DrawCapProc.asm

end
