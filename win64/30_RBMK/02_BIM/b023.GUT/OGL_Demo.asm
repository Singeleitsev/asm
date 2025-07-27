option casemap:none

;Standard Libraries
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
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
ExitProcess PROTO
GetLastError PROTO
;WndProc
MessageBoxA PROTO :QWORD,:QWORD,:QWORD,:QWORD
DefWindowProcA PROTO :QWORD,:QWORD,:QWORD,:QWORD
DestroyWindow PROTO
DestroyMenu PROTO :QWORD
PostQuitMessage PROTO :QWORD
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
gluLookAt PROTO :QWORD,:QWORD,:QWORD,:QWORD, :QWORD,:QWORD,:QWORD,:QWORD,:QWORD

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
PAINTSTRUCT64 STRUC
	hdc dq ?
	fErase dd ?
	dummy dd ? ;Exists only in win64.inc by hutch--
	rcPaint RECT64 <>
	fRestore dd ?
	fIncUpdate dd ?
	rgbReserved db 32 dup(?)
PAINTSTRUCT64 ENDS
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

.const
;Screen
DEFAULT_SCREEN_WIDTH equ 1024
DEFAULT_SCREEN_HEIGHT equ 768
;Numeric Constants
include 01_ConstNumeric.asm
;Object
include 02_Layout.asm

.data
;Global Handles
ghInst dq 0
ghWnd dq 0
;Structures
wcx WNDCLASSEX64 <>
msg MSG64 <>
RectMain RECT64 <>
pfd PIXELFORMATDESCRIPTOR64 <>
;WinMain
fWinMainActive dq 0
;OpenGL
ghDC dq 0
ghRC dq 0
iPixelFormat dq 0
RectWidth dd 0 ;Integer
RectHeight dd 0 ;Integer
RectAspect dq 0 ;Float64
;Model Position
xTrans dd 0
yTrans dd 0
zTrans dd 0
;Model Angles
aXY dd 0
aYZ dd 0
aXZ dd 0
;Camera
xCam dq 0
yCam dq 0
zCam dq 0
xAim dq 0
yAim dq 0
zAim dq 0
GlobalScale64 dq 3F50624DD2F1A9FCh ;0.001
GlobalScale32 dd 3A83126Fh ;0.001
;Motion
dStep dq 4059000000000000h ;100.0
dAngle32 dd 40a00000h ;5.0
;Keyboard Buffer
key db 256 dup (0)
nKeyCode dd 0
;Strings
szMainWndTitle db 'OpenGL example',0
szMainWndClass db 'MainWndClass',0
szMsgCloseText db 'Close?',0
szMsgCloseTitle db 'Such A Good Application',0
;Debug
nLastError dq 0
szErrGetModuleHandle db 'GetModuleHandle Error: xxxx',0
szErrRegisterClass db 'RegisterClass Error: xxxx',0
szErrCreateWindow db 'CreateWindow Error: xxxx',0
szErrChoosePixelFormat db 'ChoosePixelFormat Error: xxxx',0
szErrCreateContext db 'wglCreateContext Error: xxxx',0
szErrGetClientRect db 'GetClientRect Error: xxxx',0

.code
include 10_WinMain.asm
include 12_SpellError.asm
include 20_WndProc.asm
include 23_CloseProc.asm
include 30_InitializeGL.asm
include 31_ResetScene.asm
include 32_CameraMove.asm
include 33_GLResize.asm
include 40_DrawGLScene.asm
include 41_DrawAxes.asm
include 42_DrawObject.asm
include 43_DrawCap.asm

end
