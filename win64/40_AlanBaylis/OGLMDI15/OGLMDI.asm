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
GetClientRect PROTO :QWORD,:QWORD
GetDC PROTO :QWORD
GetDlgCtrlID PROTO :QWORD
GetMenu PROTO :QWORD
;GetMessageA PROTO :QWORD,:QWORD,:QWORD,:QWORD
GetSubMenu PROTO :QWORD,:QWORD
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
glTranslatef PROTO :QWORD,:QWORD,:QWORD
glVertex3fv PROTO :QWORD
glViewport PROTO :QWORD,:QWORD,:QWORD,:QWORD
;GlU32
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

ACCEL64 STRUC
 fVirt dw ?
 key dw ?
 cmd dw ?
ACCEL64 ENDS

LOGFONTA64 STRUC
 lfHeight dd 0
 lfWidth dd 0
 lfEscapement dd 0
 lfOrientation dd 0
 lfWeight dd 0
 lfItalic db 0
 lfUnderline db 0
 lfStrikeOut db 0
 lfCharSet db 0
 lfOutPrecision db 0
 lfClipPrecision db 0
 lfQuality db 0
 lfPitchAndFamily db 0
 lfFaceName 32 dup (0) ;[LF_FACESIZE]
LOGFONTA64 ENDS

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

;Custom Structures
CHILD64 STRUCT
 hWnd dq 0 ;Handle to child window
 hDC dq 0 ;Individual device context
 hRC dq 0 ;Individual rendering context
 iType dq 0 ;Type of child window (CHILD_TYPE)
CHILD64 ENDS

POINT4D STRUCT
 x dd 0
 y dd 0
 z dd 0
 w dd 0 ;Dummy for XMM operations 
POINT4D ENDS

TEXTURE STRUCT
 Vertex POINT2D 3 dup <> ;Only x and y
 Bpp dd 0 ;Image Color Depth In Bits Per Pixel
 Width dd 0 ;Image Width
 Height dd 0 ;Image Height
 TexID dd 0 ;Texture ID Used To Select A Texture
 LoadTGA db 0
 ImageData db 0 ;Image Data (Up To 32 Bits)
 TexName db 20 dup (0)
TEXTURE ENDS

POLYGON STRUCT ;Actually, triangle
 Vertex POINT4D 3 dup <>
 Normal POINT4D <>
 Texture TEXTURE <>
POLYGON ENDS

.const

;Numeric
f32_neg500 DD 0c3fa0000h ;-500
f32_neg100 DD 0c2c80000h ;-100
;f32_neg90 DD 0c2b40000h ;-90
;f32_neg0p001 DD ba83126fh ;-0.001
;f32_0 DD 0 ;0
;f32_0p001 dd 3a83126fh ;0.001
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

f64_neg2000 DQ 0c09f400000000000r	;-2000
f64_neg1 DQ 0bff0000000000000r	;-1
f64_neg0p5 DQ 0bfe0000000000000r	;-0.5
f64_neg0p001 DQ 03f50624dd2f1a9fch ;0.001
f64_0p5 DQ 03fe0000000000000h ;0.5
f64_1 DQ 03ff0000000000000h ;1
f64_10 DQ 04024000000000000h ;10
f64_45 DQ 04046800000000000h ;45
f64_1000 DQ 0408f400000000000h ;1000
f64_2000 DQ 0409f400000000000h ;2000

;Menu ID's
IDI_MYICON equ 104
IDI_CHILDICON equ 105
CM_FILE_NEW_3D equ 9067
CM_FILE_NEW_FRONT equ 9068
CM_FILE_NEW_TOP equ 9069
CM_FILE_NEW_LEFT equ 9070
CM_FILE_EXIT equ 9071
CM_FILE_OPEN equ 9072
CM_FILE_SAVE equ 9073
CM_FILE_SAVEAS equ 9074
CM_EDIT_UNDO equ 9075
CM_EDIT_CUT equ 9076
CM_EDIT_COPY equ 9077
CM_EDIT_PASTE equ 9078
CM_WINDOW_CASCADE equ 9079
CM_WINDOW_ARRANGE equ 9080
CM_WINDOW_TILEVERT equ 9081
CM_WINDOW_TILEHORZ equ 9082
ID_MDI_CLIENT equ 4999
ID_MDI_FIRSTCHILD equ 50000

;Custom
CHILD_TYPE_TOP equ 0 ;XZ (Top) ortho view
CHILD_TYPE_FRONT equ 1 ;XY (Front) ortho view
CHILD TYPE_LEFT equ 2 ;YZ (Left) ortho view
CHILD_TYPE_3D equ 3 ;Axonometry

;Names
szAppTitle db 'Al',27h,'s OpenGL MDI Example'
;Class Names
g_szMainClassName DB 'MainWindow', 00H
g_szClientClassName DB 'MDICLIENT', 00H
g_szChild3DClassName DB '3DOpenGL', 00H
g_szChild2DClassName DB '2DOpenGL', 00H
;Menu Names
szMenuNameMain db 'MAIN',0
szMenuFile db '&File',0
szMenuFileNew3D db '&New 3D',0
szMenuFileNewFront db 'New &Front View',0
szMenuFileNewTop db 'New &Top View',0
szMenuFileNewLeft db 'New &Left View',0
szMenuFileExit db 'E&xit',0
szMenuFileOpen db '&Open...',0
szMenuFileSave db '&Save',0
szMenuFileSaveAs db 'Save &As...',0
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

;F

;Format
szFormatString db '%s',0
szFormatDecimal db '%d',0
szFormatFloat db '%f',0

;Error Messages
szError db 'Error',0
szRegisterClass_Err db 'Failed to Register the Window',0
szCreateWindowFrame_Err db 'Failed to Create the Frame Window',0
szFileOpen_Err db 'Image file not found',0
szGIF_Err db 'Image cannot be indexed color',10'Convert the image to RGB or RGBA',0
szGrayScale_Err db 'Image cannot be grayscale color',10'Convert the image to RGB or RGBA',0
szCompressed_Err db 'Image cannot be compressed',10'Convert the image to an uncompressed format',0
szEmpty_Err db 'Image must have a width and height greater than 0',0
szBit_Err db 'Image must be 24 or 32 bit',0
szImageLoad_Err db 'Image load failed for unknown reason',0

.data

;System Structures
wcx WNDCLASSEX64 <>
msg MSG64 <>
RectMain RECT64 <>
pfd PIXELFORMATDESCRIPTOR64 <>
accel ACCEL64 <>

;Custom Structures and Classes
LogFont LOGFONTA64 <>
vertex VERTEX 8 dup <> ;Vertices for cube
texture TEXTURE <> ;Texture instance
polygon POLYGON 12 dup <> ;Polygons for cube

;Handles
g_hInst dq 0
g_hMDIClient dq 0
g_hMainWindow dq 0
g_rectChild dq 0
;Menu
hMenu dq 0
hMenuFileNew3D dq 0
hMenuFileNewFront dq 0
hMenuFileNewTop dq 0
hMenuFileNewLeft dq 0
hMenuFileExit dq 0
hMenuFileOpen dq 0
hMenuFileSave dq 0
hMenuFileSaveAs dq 0
hMenuEditUndo dq 0
hMenuEditCut dq 0
hMenuEditCopy dq 0
hMenuEditPaste dq 0
hMenuWindowCascade dq 0
hMenuWindowArrange dq 0
hMenuWindowTileVert dq 0
hMenuWindowTileHorz dq 0
hAccTable dq 0
;Font
hFont dq 0
hOldFont dq 0

;Child Windows
;g_iMaxChild dd 50 ;Maximum number of child windows wanted
g_iNumChild dd 0 ;Number of child windows created
g_child CHILD64 50 dup <> ;Create 50 CHILD structures

;Keyboard
key db 256 dup (0) ; Array used for keyboard input
released_key db 256 dup (0) ;Array used for toggled keyboard input
;Mouse
MouseX dd 0
MouseY dd 0
g_bMouseDrag db 0 ;Mouse capture flag
g_iMouseLastX dd 0
g_iMouseLastY dd 0
g_iMouseDeltaX dd 0
g_iMouseDeltaY dd 0
g_bMouseDrag2 db 0
g_iMouseLastX2 dd 0
g_iMouseLastY2 dd 0
g_iMouseDeltaX2 dd 0
g_iMouseDeltaY2 dd 0
;Positioning
VerticalShift dd 0
HorizontalShift dd 0
;Scene
VertexNumber dd 0
;Cube
g_fCubeRotationX dd 0
g_fCubeRotationY dd 0
Zoom DD 03ccccccdr ;Ortho view zoom value = 0.25f
;Environment
ShortestDistance DD 02710H ;10000d
FrontDepth DD 042b40000r ;90.0f
TopDepth DD 0c2b40000r ;-90.0f
LeftDepth DD 0c2b40000r ;-90.0f

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
file dq 0
NumberOfBytesRead db 0
TGAheader db 0,0,2,0,0,0,0,0,0,0,0,0 ;Uncompressed TGA Header
TGAcompare db 12 dup (0) ;Used To Compare TGA Header
header db 6 dup (0) ;First 6 Useful Bytes From The Header
bytesPerPixel dd 0 ;Holds Number Of Bytes Per Pixel Used In The TGA File
imageSize dd 0 ;Used To Store The Image Size When Setting Aside Ram
type dd 1908h ;Set The Default GL Mode To RGBA (32 BPP)
szTGAFileName db 'tile1.tga',0
;szFOpenMode db 'rb',0

;Text Properties
colorRGB dd 0 ;For Win32 text

.code

include 01_WinMain\00_WinMain.asm
;include 01_WinMain\10_RegisterClass.asm ;Not a Procedure
;include 01_WinMain\20_InitGL.asm ;Not a Procedure
include 01_WinMain\21_SetVertices.asm
include 01_WinMain\22_SetPolygons.asm
;include 01_WinMain\23_SetNormal.asm ;Not a Procedure
include 01_WinMain\24_SetTextures.asm ;LoadTGA
;include 01_WinMain\30_MainLoop.asm ;Not a Procedure
;include 01_WinMain\31_CheckKeys.asm ;Not a Procedure
include 10_WndProc\000_WndProc.asm

include 11_Child3DWndProc\00_Child3DWndProc.asm

include 12_Child2DWndProc\00_Child2DWndProc.asm

include 30_DrawWin32Text\00_DrawWin32Text.asm


end


