option casemap: none
option prologue: none
option epilogue: none

;Standard Libraries
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\Comctl32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\OpenGL32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\GlU32.Lib

;WinAPI
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
CreateMDIWindowA PROTO :QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD,:QWORD
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
GetParent PROTO :QWORD
GetProcessHeap PROTO
GetSubMenu PROTO :QWORD,:QWORD
GetWindowLongA PROTO :QWORD
HeapAlloc PROTO :QWORD,:QWORD,:QWORD
HeapFree PROTO :QWORD,:QWORD,:QWORD
;InitCommonControlsEx PROTO :QWORD
IsIconic PROTO :QWORD
IsWindow PROTO :QWORD
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
TranslateAcceleratorA PROTO :QWORD,:QWORD,:QWORD
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

CLIENTCREATESTRUCT64 STRUCT
hWindowMenu dq 0
idFirstChild dd 0
dummy dd 0 ;Exists only in win64.inc by hutch--
CLIENTCREATESTRUCT64 ENDS

MDICREATESTRUCT64 STRUCT
szClass dq 0
szTitle dq 0
hOwner dq 0
x dd 0
y dd 0
cxWidth dd 0
cyHeight dd 0
style dd 0
dummy dd 0 ;Exists only in win64.inc by hutch--
lParam dq 0
MDICREATESTRUCT64 ENDS

RECT64 STRUCT
left dd 0
top dd 0
right dd 0
bottom dd 0
RECT64 ENDS

CHILD64 STRUCT
hWnd dq 0 ;Handle to child window
hDC dq 0 ;Child DC
hRC dq 0 ;Child RC
WindowRect RECT64 <0,0,0,0>
iType db 0 ;CHILD_TYPE
iThisChild db 0 ;Child ID
dummy db 6 dup (0)
CHILD64 ENDS

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

;ACCEL64 STRUCT
;fVirt dw 0
;key dw 0
;cmd dw 0
;dummy dw 0 ;<---
;ACCEL64 ENDS

PIXELFORMATDESCRIPTOR64 STRUCT
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

;Custom Structures
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
;f32_neg0p5 DD 0bf000000h ;-0.5
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

f64_neg2000 DQ 0c09f400000000000h ;-2000
f64_neg1 DQ 0bff0000000000000h ;-1
f64_neg0p5 DQ 0bfe0000000000000h ;-0.5
f64_neg0p001 DQ 03f50624dd2f1a9fch ;0.001
f64_0p5 DQ 03fe0000000000000h ;0.5
f64_1 DQ 03ff0000000000000h ;1
f64_10 DQ 04024000000000000h ;10
f64_45 DQ 04046800000000000h ;45
f64_1000 DQ 0408f400000000000h ;1000
f64_2000 DQ 0409f400000000000h ;2000

;Resources
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
CM_FILE_CLOSE equ 1090h
CM_FILE_EXIT equ 1099h
CM_EDIT_UNDO equ 1100h
CM_EDIT_CUT equ 1110h
CM_EDIT_COPY equ 1111h
CM_EDIT_PASTE equ 1112h
CM_WINDOW_TILEVERT equ 1200h
CM_WINDOW_TILEHORZ equ 1201h
CM_WINDOW_CASCADE equ 1202h
CM_HELP_ABOUT equ 9001h

;Projections
CHILD_TYPE_TOP equ 0 ;XZ (Top) ortho view
CHILD_TYPE_FRONT equ 1 ;XY (Front) ortho view
CHILD_TYPE_LEFT equ 2 ;YZ (Left) ortho view
CHILD_TYPE_3D equ 3 ;Axonometry

;Titles
szTitleFrame db 'Al',27h,'s OpenGL MDI Assembly Implementation',0
szTitleTop db 'Top',0
szTitleFront db 'Front',0
szTitleLeft db 'Left',0
szTitle3D db '3D',0

;Class Names
szClassFrame DB 'ClassFrame',0
szClassClient DB 'MDICLIENT',0
szClassChild2D DB 'ClassChild2D',0
szClassChild3D DB 'ClassChild3D',0

;Menu Names
szMenuFile db '&File',0
szMenuFileNewTop db 'New &Top View',9,'Ctrl+1',0
szMenuFileNewFront db 'New &Front View',9,'Ctrl+2',0
szMenuFileNewLeft db 'New &Left View',9,'Ctrl+3',0
szMenuFileNew3D db '&New 3D View',9,'Ctrl+4',0
szMenuFileOpen db '&Open...',0
szMenuFileSave db '&Save',0
szMenuFileSaveAs db 'Save &As...',0
szMenuFileClose db '&Close',9,'Ctrl+W',0
szMenuFileExit db 'E&xit',9,'Alt+F4',0
szMenuEdit db '&Edit',0
szMenuEditUndo db '&Undo',9,'Ctrl+Z',0
szMenuEditCut db 'Cu&t',9,'Ctrl+X',0
szMenuEditCopy db '&Copy',9,'Ctrl+C',0
szMenuEditPaste db '&Paste',9,'Ctrl+V',0
szMenuWindow db '&Window',0
szMenuWindowTileVert db 'Tile &Vertical',0
szMenuWindowTileHorz db  'Tile &Horizontal',0
szMenuWindowCascade db '&Cascade',0
szMenuHelp db '&Help',0
szMenuHelpAbout db '&About',0

;About
szAbout db 'Win32 (x64) MDI application',0Ah,0Dh
db 'with OpenGL compatible child windows',0Ah,0Dh
db 'Based on the great application',0Ah,0Dh
db 'Copyright © 24/01/2001, Alan Baylis, All Rights Reserved',0

;Debug Messages
szLocator db 'I am here!',0

;Format
;szFormatString db '%s',0
;szFormatDecimal db '%d',0
;szFormatFloat db '%f',0

;Error Messages
;WinMain
szWinMain db 'WinMain',0
szRegisterClass_Err db 'Failed to Register the Window',0
szCreateWindowFrame_Err db 'Failed to Create the Frame Window',0
szMakeCurrent_Err db 'wglMakeCurrent Error',0
;WndProc
szWndProc db 'WndProc',0
szCreateMenuMain_Err db 'Main Menu creation failed',0
szGetMenu_Err db 'GetMenu returned 0',0
szCreateSubMenu_Err db 'SubMenu creation failed',0
szAccelerator_Err db 'Accelerator creation failed',0
szCreateMDIClient_Err db 'MDI Client Window creation failed',0
szChildrenOverflow_Err db 'The number of children has reached the maximum',0
;CreateChild
szCreateChild db 'CreateChild',0
szChildrenOverflow db 'The number of children has reached the maximum',0
szChildType_Err db 'Improper Child Type',0
szCreateChild_Err db 'Child Window creation failed',0
szCreateChild_ParentMisMatch db 'Child Window Parent MisMatch',0
szCreateChild_NotMDIChild db 'The child is not recognized as MDI child',0
szCreateChild_NoSysMenu db 'No SysMenu for Child Window',0
szCreateChild_DC_Err db 'Failed to get Device Context',0
szCreateChild_RC_Err db 'hRC is NULL',0
;Child2DWndProc
szChild2D db 'Child2DWndProc',0
szChild2D_DC_Err db 'hDC is NULL',0
szChild2D_RC_Err db 'hRC is NULL',0
;Child3DWndProc
szChild3D db 'Child3DWndProc',0
szChild3D_DC_Err db 'hDC is NULL',0
szChild3D_RC_Err db 'hRC is NULL',0
;SetTextures
szSetTextures db 'SetTextures',0
szFileOpen_Err db 'Image file not found',0
szReadFile_Err db'Failed to Read the File',0
szGIF_Err db 'Image cannot be indexed color',10,'Convert the image to RGB or RGBA',0
szGrayScale_Err db 'Image cannot be grayscale color',10,'Convert the image to RGB or RGBA',0
szCompressed_Err db 'Image cannot be compressed',10,'Convert the image to an uncompressed format',0
szEmpty_Err db 'Image must have width and height greater than 0',0
szBit_Err db 'Image must be 24 or 32 bit',0
szImageLoad_Err db 'Image load failed for unknown reason',0
szDataSize_Err db 'Image Size Does Not Match The Memory Reserved',0
;Draw2DProc
szDraw2D db 'Draw2D',0
;Draw3DProc
szDraw3D db 'Draw3D',0

.data

;System Structures
wcx WNDCLASSEX64 <>
ccs CLIENTCREATESTRUCT64 <>
mcs MDICREATESTRUCT64<>
msg MSG64 <>

;accel ACCEL64 5 dup (<>)
accel dw 9 ;fVirt = FVIRTKEY | FCONTROL = 1 + 8
dw 31h ;key = VK_1
dw CM_FILE_NEW_TOP ;cmd
dw 9 ;fVirt = FVIRTKEY | FCONTROL = 1 + 8
dw 32h ;key = VK_2
dw CM_FILE_NEW_FRONT ;cmd
dw 9 ;fVirt = FVIRTKEY | FCONTROL = 1 + 8
dw 33h ;key = VK_3
dw CM_FILE_NEW_LEFT ;cmd
dw 9 ;fVirt = FVIRTKEY | FCONTROL = 1 + 8
dw 34h ;key = VK_4
dw CM_FILE_NEW_3D ;cmd
dw 9 ;fVirt = FVIRTKEY | FCONTROL = 1 + 8
dw 57h ;key = VK_W
dw CM_FILE_CLOSE ;cmd

pfd PIXELFORMATDESCRIPTOR64 <>

;Custom Structures and Classes
vtx POINT4D 8 dup (<>) ;Vertices for cube
txr TEXTURE <> ;Texture instance
pg POLYGON 12 dup (<>) ;Polygons for cube

;Handles
g_hInst dq 0
g_hWndFrame dq 0
g_hWndClient dq 0

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
hMenuFileClose dq 0
hMenuFileExit dq 0
hMenuEdit dq 0
hMenuEditUndo dq 0
hMenuEditCut dq 0
hMenuEditCopy dq 0
hMenuEditPaste dq 0
hMenuWindow dq 0
hMenuWindowTileVert dq 0
hMenuWindowTileHorz dq 0
hMenuWindowCascade dq 0
hMenuHelp dq 0
hMenuHelpAbout dq 0
hAccTable dq 0

;Font
;hFont dq 0
;hOldFont dq 0

;Child Windows
g_iMaxChild db 8 ;Maximum number of child windows wanted
g_iNumChild db 0 ;Number of child windows created
g_child CHILD64 8 dup (<>) ;Create 8 CHILD structures

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

;Scene
g_IsRefreshed db 0 ;Prevents from rebuilding unchanged scene
VertexNumber db 0
ShortestDistance DD 2710h ;10000

;Cube
g_fCubeRotationX dd 0
g_fCubeRotationY dd 0
;Zoom DD 03ccccccdr ;Ortho view zoom value = 0.25f

;Sphere
sphere dq 0 ;GLUquadricObj

;Environment
TopDepth DD 0c2b40000h ;-90.0f
FrontDepth DD 042b40000h ;90.0f
LeftDepth DD 0c2b40000h ;-90.0f

;Material
fMatSphereAmbient dd 3F800000h,3F800000h,00000000h,3DCCCCCDh ;1.0,1.0,0.0,1.0
fMatSphereDiffuse dd 3F800000h,3F800000h,00000000h,3DCCCCCDh ;1.0,1.0,0.0,1.0
fMatAmbient dd 3f4ccccdh,3f4ccccdh,3f4ccccdh,3dcccccdh ;0.8,0.8,0.8,1.0
fMatDiffuse dd 3f4ccccdh,3f4ccccdh,3f4ccccdh,3dcccccdh ;0.8,0.8,0.8,1.0
fMatSpecular dd 3f666666h,3f666666h,3f666666h,3dcccccdh ;0.9,0.9,0.9,1.0
fMatEmission dd 0,0,0,03dcccccdh ;0.0,0.0,0.0,1.0
fMatShininess dd 042c80000h ;100.0

;Light
fLightAmbient dd 3e4ccccdh,3e4ccccdh,3e4ccccdh,3dcccccdh ;0.2,0.2,0.2,1.0
fLightPosition dd 43480000h,0,0,3dcccccdh ;200.0,0.0,0.0,1.0

;TGA
szTGAFileName db 'Tile1.tga',0
LoadTGA db 0
NumberOfBytesRead dd 0
lpImageData dq 0 ;Image Data (Up To 32 Bits)
TGAheader db 0,0,2,0,0,0,0,0,0,0,0,0 ;Uncompressed TGA Header
TGAcompare db 12 dup (0) ;Used To Compare TGA Header
header db 6 dup (0) ;First 6 Useful Bytes From The Header

.code

include 0_WinMain\0000_WinMainProc.asm
;include 0100_MainLoop.asm
;include 0110_CheckKeys.asm
;include 0200_SetTop.asm
;include 0210_SetFront.asm
;include 0220_SetLeft.asm
;include 0230_Set3D.asm
;include 0900_Errors.asm

include 1_FrameWndProc\10_FrameWndProc.asm
;include 11_001_0_Create.asm
;include 11_001_1_Menu.asm
;include 11_001_2_Accel.asm
;include 11_010_Close.asm
;include 11_111_Command.asm
;include 12_CreateChild.asm
;include 13_InitGL.asm
;include 14_0_SetTextures.asm
;include 14_9_Errors.asm
;include 19_Errors.asm

include 2_Child2DWndProc\20_Child2DWndProc.asm
;include 21_005_Size.asm
;include 21_010_Close.asm
;include 21_100_KeyDown.asm
;include 21_101_KeyUp.asm
;include 21_111_Command.asm
;include 21_200_MouseMove.asm
;include 21_201_LButtonDown.asm
;include 21_202_LButtonUp.asm
;include 21_222_MDIActivate.asm
;include 29_Errors.asm

include 3_Child3DWndProc\30_Child3DWndProc.asm
;include 31_005_Size.asm
;include 31_010_Close.asm
;include 31_100_KeyDown.asm
;include 31_101_KeyUp.asm
;include 31_111_Command.asm
;include 31_200_MouseMove.asm
;include 31_201_LButtonDown.asm
;include 31_202_LButtonUp.asm
;include 31_222_MDIActivate.asm
;include 39_Errors.asm

include 4_MiscProc\400_SetVerticesProc.asm
include 4_MiscProc\401_SetPolygonsProc.asm
include 4_MiscProc\420_Draw2DProc.asm
include 4_MiscProc\430_Draw3DProc.asm
include 4_MiscProc\440_MenuUpdateProc.asm
include 4_MiscProc\490_PurgeProc.asm

end
