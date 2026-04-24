option casemap: none

;Standard Libraries
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\Comctl32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\GlU32.Lib

;__stdio_common_vsprintf PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD
AppendMenuA PROTO :QWORD,:QWORD,:QWORD,:QWORD
CheckMenuItem PROTO :QWORD,:QWORD,:QWORD
ChoosePixelFormat PROTO :QWORD,:QWORD
CloseHandle PROTO :QWORD
CreateAcceleratorTableA PROTO :QWORD,:QWORD
CreateFontIndirectA PROTO :QWORD
CreateMenu PROTO
CreateFileA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD
CreatePopupMenu PROTO
CreateWindowExA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD
DefFrameProcA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD
DefMDIChildProcA PROTO :QWORD,:QWORD,:QWORD,:QWORD
DeleteObject  PROTO :QWORD
DestroyAcceleratorTable PROTO :QWORD
DestroyMenu PROTO :QWORD
DestroyWindow PROTO :QWORD
DispatchMessageA PROTO :QWORD
DrawMenuBar PROTO :QWORD
DrawTextA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD
EnableMenuItem PROTO :QWORD,:QWORD,:QWORD
ExitProcess PROTO :QWORD
GetClientRect PROTO :QWORD,:QWORD
GetDC PROTO :QWORD
GetDlgCtrlID PROTO :QWORD
GetMenu PROTO :QWORD
;GetMessageA PROTO :QWORD,:QWORD,:QWORD,:QWORD
GetModuleHandleA PROTO :QWORD
GetProcessHeap PROTO
GetSubMenu PROTO :QWORD,:QWORD
HeapAlloc PROTO :QWORD,:QWORD,:QWORD
HeapFree PROTO :QWORD,:QWORD,:QWORD
;InitCommonControlsEx PROTO :QWORD
IsIconic PROTO :QWORD
LoadCursorA PROTO :QWORD,:QWORD
LoadIconA PROTO :QWORD,:QWORD
MessageBoxA PROTO :QWORD,:QWORD,:QWORD,:QWORD
PeekMessageA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD
PostMessageA PROTO :QWORD,:QWORD,:QWORD,:QWORD
PostQuitMessage PROTO :QWORD
ReadFile PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD
RegisterClassExA PROTO :QWORD
ReleaseCapture PROTO
ReleaseDC PROTO :QWORD,:QWORD
RestoreDC PROTO :QWORD,:QWORD
SaveDC PROTO :QWORD
SelectObject PROTO :QWORD,:QWORD
SendMessageA PROTO :QWORD,:QWORD,:QWORD,:QWORD
SetBkMode PROTO :QWORD,:QWORD
SetCapture PROTO :QWORD
SetPixelFormat PROTO :QWORD,:QWORD,:QWORD
SetMenu PROTO :QWORD,:QWORD
SetTextColor PROTO :QWORD,:QWORD
SetWindowTextA PROTO :QWORD,:QWORD
ShowWindow PROTO :QWORD,:QWORD
SwapBuffers PROTO :QWORD
TranslateMDISysAccel PROTO :QWORD,:QWORD
TranslateMessage PROTO :QWORD
UpdateWindow PROTO :QWORD
;OpenGL32
glBegin PROTO :QWORD
glBindTexture PROTO :QWORD,:QWORD
glClear PROTO :QWORD
glClearColor PROTO :QWORD,:QWORD,:QWORD,:QWORD
glClearDepth PROTO :QWORD,:QWORD
glColor4f PROTO :QWORD,:QWORD,:QWORD,:QWORD
glCullFace PROTO :QWORD
glDepthFunc PROTO :QWORD
glDisable PROTO :QWORD
glEnable PROTO :QWORD
glEnd PROTO
glFlush PROTO
glGenTextures PROTO :QWORD,:QWORD
glLightfv PROTO :QWORD,:QWORD,:QWORD
glLoadIdentity PROTO
glMaterialfv PROTO :QWORD,:QWORD,:QWORD
glMatrixMode PROTO :QWORD
glNormal3fv PROTO :QWORD
glOrtho PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD
glPopMatrix PROTO
glPushMatrix PROTO
glRotatef PROTO :QWORD,:QWORD,:QWORD,:QWORD
glShadeModel PROTO :QWORD
glTexCoord2f PROTO :QWORD,:QWORD
glTexEnvf PROTO :QWORD,:QWORD,:QWORD
glTexImage2D PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD
glTexParameterf PROTO :QWORD,:QWORD,:QWORD
glTranslatef PROTO :QWORD,:QWORD,:QWORD
glVertex3fv PROTO :QWORD
glViewport PROTO :QWORD,:QWORD,:QWORD,:QWORD
;GlU32
gluBuild2DMipmaps PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD
gluNewQuadric PROTO
gluPerspective PROTO :QWORD,:QWORD,:QWORD,:QWORD
gluQuadricOrientation PROTO :QWORD,:QWORD
gluSphere PROTO :QWORD,:QWORD,:QWORD,:QWORD
;WGL
wglCreateContext PROTO :QWORD
wglDeleteContext PROTO :QWORD
wglMakeCurrent PROTO :QWORD,:QWORD

;Structures
WNDCLASSEX64 STRUCT
cbSize dd 0
style dd 0
lpfnWndProc dq 0
cbClsExtra dd 0
cbWndExtra dd 0
hInstance dq 0
hIcon dq 0
hCursor dq 0
hbrBackground dq 0
lpszMenuName dq 0
lpszClassName dq 0
hIconSm dq 0
WNDCLASSEX64 ENDS

POINT2D STRUCT
x dd 0
y dd 0
POINT2D ENDS

MSG64 STRUCT
hWnd dq 0
message dd 0
wParam dq 0
lParam dq 0
time dd 0
pt POINT2D <0,0>
MSG64 ENDS

RECT64 STRUCT
left dd 0
top dd 0
right dd 0
bottom dd 0
RECT64 ENDS

PIXELFORMATDESCRIPTOR64 STRUC
nSize dw 0
nVersion dw 0
dwFlags dd 0
iPixelType db 0
cColorBits db 0
cRedBits db 0
cRedShift db 0
cGreenBits db 0
cGreenShift db 0
cBlueBits db 0
cBlueShift db 0
cAlphaBits db 0
cAlphaShift db 0
cAccumBits db 0
cAccumRedBits db 0
cAccumGreenBits db 0
cAccumBlueBits db 0
cAccumAlphaBits db 0
cDepthBits db 0
cStencilBits db 0
cAuxBuffers db 0
iLayerType db 0
bReserved db 0
dwLayerMask dd 0
dwVisibleMask dd 0
dwDamageMask dd 0
PIXELFORMATDESCRIPTOR64 ENDS

ACCEL64 STRUC
fVirt dw 0
key dw 0
cmd dw 0
ACCEL64 ENDS

CLIENTCREATESTRUCT64 STRUC
hWindowMenu dq 0
idFirstChild dd 0
dummy dd 0 ;Exists only in win64.inc by hutch--
CLIENTCREATESTRUCT64 ENDS

CREATESTRUCT64 STRUC
lpCreateParams dq 0
hInstance dq 0
hMenu dq 0
hwndParent dq 0
cyHeight dd 0
cxWidth dd 0
y dd 0
x dd 0
style dd 0
lpszName dq 0
lpszClass dq 0
dwExStyle dd 0
CREATESTRUCT64 ENDS

;LOGFONTA64 STRUC
;lfHeight dd 0
;lfWidth dd 0
;lfEscapement dd 0
;lfOrientation dd 0
;lfWeight dd 0
;lfItalic db 0
;lfUnderline db 0
;lfStrikeOut db 0
;lfCharSet db 0
;lfOutPrecision db 0
;lfClipPrecision db 0
;lfQuality db 0
;lfPitchAndFamily db 0
;lfFaceName 32 dup (0) ;[LF_FACESIZE]
;LOGFONTA64 ENDS

;SECURITY_ATTRIBUTES64 STRUC
;nLength dw 0
;lpSecurityDescriptor dq 0
;bInheritHandle db 0
;SECURITY_ATTRIBUTES64 ENDS

;SECURITY_DESCRIPTOR64 STRUC
;Revision db 0
;Sbz1 db 0
;Control dw 0 ;SECURITY_DESCRIPTOR_CONTROL
;Owner dq 0 ;PSID
;Group dq 0 ;PSID
;Sacl dq 0 ;PACL
;Dacl dq 0 ;PACL
;SECURITY_DESCRIPTOR64 ENDS

;OVERLAPPED64 STRUC
;Internal dd 0
;InternalHigh dd 0
;Offset_ dq 0
;OffsetHigh dq 0
;Pointer  dq 0
;hEvent dq 0
;OVERLAPPED64 ENDS

;Custom Structures
CHILD64 STRUCT
hWnd dq 0 ;Handle to child window
hDC dq 0 ;Individual device context
hRC dq 0 ;Individual rendering context
WindowRect RECT64 <0,0,0,0>
iType db 0 ;Type of child window (CHILD_TYPE)
dummy db 7 dup (0)
CHILD64 ENDS

POINT4D STRUCT
x dd 0
y dd 0
z dd 0
w dd 0 ;Dummy for XMM operations
POINT4D ENDS

TEXTURE STRUCT
txrVertex dd 6 dup (0) ;POINT2D 3 dup (<0,0>)
lpszFileName dq 0
txrBitsPP dd 0 ;Image Color Depth In Bits Per Pixel
txrWidth dd 0 ;Image Width
txrHeight dd 0 ;Image Height
txrSize dd 0 ;Used To Store The Image Size When Setting Aside Ram
txrID dd 0 ;Texture ID Used To Select A Texture
txrType dd 0
TEXTURE ENDS

POLYGON STRUCT ;Actually, triangle
pgVertex dd 12 dup (0) ;POINT4D 3 dup (<0,0,0,0>)
pgNormal dd 4 dup (0) ;POINT4D <0,0,0,0>
POLYGON ENDS

.const

;Numeric
f32_neg500 DD 0c3fa0000h ;-500
f32_neg100 DD 0c2c80000h ;-100
;f32_neg90 DD 0c2b40000h ;-90
f32_neg0p001 DD 0ba83126fh ;-0.001
;f32_0 DD 0 ;0
f32_0p001 dd 3a83126fh ;0.001
f32_0p1 DD 03dcccccdh ;0.1
f32_0p2 DD 03e4ccccdh ;0.2
;f32_0p25 DD 03ccccccdh ;0.25f
f32_0p5 DD 03f000000h ;0.5
f32_0p8 DD 03f4ccccdh ;0.8
f32_0p9 DD 03f666666h ;0.9
f32_1 DD 03f800000h ;1
f32_radians dd 3c8efa35h ;PI_OVER_180 = 1.74532925199433E-02
f32_pi DD 040490fd8h ;PI
f32_90 DD 042b40000h ;90
f32_100 DD 042c80000h ;100
f32_180 DD 043340000h ;180
f32_200 DD 043480000h ;200
f32_1000 dd 447a0000h ;1000.0f
f32_10000 dd 461c4000h ;10000.0f

f64_neg2000 DQ 0c09f400000000000r ;-2000
f64_neg1 DQ 0bff0000000000000r ;-1
f64_neg0p5 DQ 0bfe0000000000000r ;-0.5
f64_neg0p001 DQ 03f50624dd2f1a9fch ;0.001
f64_0p5 DQ 03fe0000000000000h ;0.5
f64_1 DQ 03ff0000000000000h ;1
f64_10 DQ 04024000000000000h ;10
f64_45 DQ 04046800000000000h ;45
f64_1000 DQ 0408f400000000000h ;1000
f64_2000 DQ 0409f400000000000h ;2000

;Resources
IDI_MYICON equ 100h
IDI_CHILDICON equ 101h
ID_MDI_CLIENT equ 2000h
ID_MDI_FIRSTCHILD equ 3000h

;Menu ID's
CM_FILE_NEW_TOP equ 1000h
CM_FILE_NEW_FRONT equ 1001h
CM_FILE_NEW_LEFT equ 1002h
CM_FILE_NEW_3D equ 1003h
CM_FILE_OPEN equ 1010h
CM_FILE_SAVE equ 1020h
CM_FILE_SAVEAS equ 1021h
CM_FILE_EXIT equ 1099h
CM_EDIT_UNDO equ 1100h
CM_EDIT_CUT equ 1110h
CM_EDIT_COPY equ 1111h
CM_EDIT_PASTE equ 1112h
CM_WINDOW_CASCADE equ 1200h
CM_WINDOW_ARRANGE equ 1201h
CM_WINDOW_TILEVERT equ 1202h
CM_WINDOW_TILEHORZ equ 1203h

;Projections
CHILD_TYPE_TOP equ 0 ;XZ (Top) ortho view
CHILD_TYPE_FRONT equ 1 ;XY (Front) ortho view
CHILD_TYPE_LEFT equ 2 ;YZ (Left) ortho view
CHILD_TYPE_3D equ 3 ;Axonometry

;Titles
szAppTitle db 'Al',27h,'s OpenGL MDI Example',0
szWindowTitleTop db 'Top',0
szWindowTitleFront db 'Front',0
szWindowTitleLeft db 'Left',0
szWindowTitle3D db '3D',0

;Class Names
g_szMainClassName DB 'MainWindow',0
g_szClientClassName DB 'MDICLIENT',0
g_szChild3DClassName DB '3DOpenGL',0
g_szChild2DClassName DB '2DOpenGL',0

;Menu Names
szMenuNameMain db 'MAIN',0
szMenuFile db '&File',0
szMenuFileNewTop db 'New &Top View',0
szMenuFileNewFront db 'New &Front View',0
szMenuFileNewLeft db 'New &Left View',0
szMenuFileNew3D db '&New 3D',0
szMenuFileOpen db '&Open...',0
szMenuFileSave db '&Save',0
szMenuFileSaveAs db 'Save &As...',0
szMenuFileExit db 'E&xit',0
szMenuEdit db '&Edit',0
szMenuEditUndo db '&Undo\tCtrl+Z',0
szMenuEditCut db 'Cu&t\tCtrl+X',0
szMenuEditCopy db '&Copy\tCtrl+C',0
szMenuEditPaste db '&Paste\tCtrl+V',0
szMenuWindow db '&Window',0
szMenuWindowCascade db '&Cascade',0
szMenuWindowArrange db 'Tile &Horizontal',0
szMenuWindowTileVert db 'Tile &Vertical',0
szMenuWindowTileHorz db 'Arrange &Icons',0

;Format
szFormatString db '%s',0
szFormatDecimal db '%d',0
szFormatFloat db '%f',0

;Error Messages
szError db 'Error',0
;WinMain
szRegisterClass_Err db 'Failed to Register the Window',0
szCreateWindowFrame_Err db 'Failed to Create the Frame Window',0
szFileOpen_Err db 'Image file not found',0
szReadFile_Err db'Failed to Read the File',0
szGIF_Err db 'Image cannot be indexed color',10,'Convert the image to RGB or RGBA',0
szGrayScale_Err db 'Image cannot be grayscale color',10,'Convert the image to RGB or RGBA',0
szCompressed_Err db 'Image cannot be compressed',10,'Convert the image to an uncompressed format',0
szEmpty_Err db 'Image must have width and height greater than 0',0
szBit_Err db 'Image must be 24 or 32 bit',0
szImageLoad_Err db 'Image load failed for unknown reason',0
szDataSize_Err db 'Image Size Does Not Match The Memory Reserved',0
;WndProc
szCreateMDIClient_Err db 'MDI Client Window creation failed',0
szChildrenOverflow_Err db 'The number of children has reached the maximum',0
szChildType_Err db 'Improper Child Type',0
szCreateChild_Err db 'Child Window creation failed',0

.data

;System Structures
wcx WNDCLASSEX64 <>
ccs CLIENTCREATESTRUCT64 <>
csa CREATESTRUCT64 <>
msg MSG64 <>
accel ACCEL64 <>
RectMain RECT64 <>
pfd PIXELFORMATDESCRIPTOR64 <>

;Custom Structures and Classes
vtx POINT4D 8 dup (<>) ;Vertices for cube
txr TEXTURE <> ;Texture instance
pg POLYGON 12 dup (<>) ;Polygons for cube
;LogFont LOGFONTA64 <>

;Handles
g_hInst dq 0
g_hMDIClient dq 0
g_hMainWindow dq 0

;Menu
hMenuMain dq 0
hMenuFile dq 0
hMenuFileNewTop dq 0
hMenuFileNewFront dq 0
hMenuFileNewLeft dq 0
hMenuFileNew3D dq 0
hMenuFileOpen dq 0
hMenuFileSave dq 0
hMenuFileSaveAs dq 0
hMenuFileExit dq 0
hMenuEdit dq 0
hMenuEditUndo dq 0
hMenuEditCut dq 0
hMenuEditCopy dq 0
hMenuEditPaste dq 0
hMenuWindow dq 0
hMenuWindowCascade dq 0
hMenuWindowArrange dq 0
hMenuWindowTileVert dq 0
hMenuWindowTileHorz dq 0
hAccTable dq 0

;Font
;hFont dq 0
;hOldFont dq 0

;Child Windows
g_iMaxChild db 10 ;Maximum number of child windows wanted
g_iNumChild db 0 ;Number of child windows created
g_child CHILD64 10 dup (<>) ;Create 10 CHILD structures

;Keyboard
key db 256 dup (0) ; Array used for keyboard input
released_key db 256 dup (0) ;Array used for toggled keyboard input

;Mouse
;MouseX dd 0
;MouseY dd 0
;Child3DWndProc_Mouse
g_bMouseDrag db 0 ;Mouse capture flag
g_iMouseLastX dd 0
g_iMouseLastY dd 0
g_iMouseDeltaX dd 0
g_iMouseDeltaY dd 0
;Child2DWndProc_Mouse
g_bMouseDrag2 db 0
g_iMouseLastX2 dd 0
g_iMouseLastY2 dd 0
g_iMouseDeltaX2 dd 0
g_iMouseDeltaY2 dd 0

;Positioning
VerticalShift dd 0
HorizontalShift dd 0

;Scene
VertexNumber db 0
ShortestDistance DD 461c4000h ;10000.0f

;Cube
g_fCubeRotationX dd 0
g_fCubeRotationY dd 0
Zoom DD 03ccccccdr ;Ortho view zoom value = 0.25f

;Sphere
sphere dq 0 ;GLUquadricObj

;Environment
TopDepth DD 0c2b40000h ;-90.0f
FrontDepth DD 042b40000h ;90.0f
LeftDepth DD 0c2b40000h ;-90.0f

;Material
fMatAmbient dd 03f4ccccdh,03f4ccccdh,03f4ccccdh,03dcccccdh ;0.8, 0.8, 0.8, 1.0
fMatDiffuse dd 03f4ccccdh,03f4ccccdh,03f4ccccdh,03dcccccdh ;0.8, 0.8, 0.8, 1.0
fMatSpecular dd 03f666666h,03f666666h,03f666666h,03dcccccdh ;0.9, 0.9, 0.9, 1.0
fMatEmission dd 0,0,0,03dcccccdh ;0.0, 0.0, 0.0, 1.0
fMatShininess dd 042c80000h ;100.0

;Light
fLightAmbient dd 03e4ccccdh,03e4ccccdh,03e4ccccdh,03dcccccdh ;0.2, 0.2, 0.2, 1.0
fLightPosition dd 043480000h,0,0,03dcccccdh ;200.0, 0.0, 0.0, 1.0

;TGA
szTGAFileName db 'Tile1.tga',0
LoadTGA db 0
;ol OVERLAPPED64 <0,0,0,0,0,0>
NumberOfBytesRead dd 0
lpImageData dq 0 ;Image Data (Up To 32 Bits)
TGAheader db 0,0,2,0,0,0,0,0,0,0,0,0 ;Uncompressed TGA Header
TGAcompare db 12 dup (0) ;Used To Compare TGA Header
header db 6 dup (0) ;First 6 Useful Bytes From The Header

;Text Properties
colorRGB dd 0 ;For Win32 text

.code

include 0_WinMain\000_WinMainProc.asm
;include 010_RegisterClass.asm ;included in WinMain
;include 030_MainLoop.asm
;include 031_CheckKeys.asm
;include 090_Errors.asm

include 1_WndProc\100_WndProc.asm
;include 110_Create.asm ;included in WndProc
;include 120_Command.asm
include 1_WndProc\121_CreateChildProc.asm
;include 180_Close.asm
;include 190_ClientErrors.asm
;include 191_ChildErrors.asm ;included in CreateChild

include 2_Child2DWndProc\200_Child2DWndProc.asm
;include 210_MouseMove.asm ;included in Child2DWndProc
;include 211_LButtonDown.asm
;include 212_LButtonUp.asm
;include 220_KeyDown.asm
;include 221_KeyUp.asm
;include 230_Command.asm
;include 240_MDIActivate.asm
;include 250_Size.asm
;include 280_Close.asm
;include 290_Errors.asm

include 3_Child3DWndProc\300_Child3DWndProc.asm
;include 310_MouseMove.asm ;included in Child3DWndProc
;include 311_LButtonDown.asm
;include 312_LButtonUp.asm
;include 320_KeyDown.asm
;include 321_KeyUp.asm
;include 330_Command.asm
;include 340_MDIActivate.asm
;include 380_Close.asm
;include 390_Errors.asm

include 4_SetScene\400_InitGLProc.asm
include 4_SetScene\401_SetVerticesProc.asm
include 4_SetScene\402_SetPolygonsProc.asm
include 4_SetScene\403_SetTexturesProc.asm
;include 409_Errors.asm ;included in SetTextures
;include 410_SetTop.asm ;included in MainLoop
;include 411_SetFront.asm
;include 412_SetLeft.asm
;include 413_Set3D.asm
include 4_SetScene\420_Draw2DProc.asm
include 4_SetScene\430_Draw3DProc.asm

;include 500_DrawWin32Text.asm

end

