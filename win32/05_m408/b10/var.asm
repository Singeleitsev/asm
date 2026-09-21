;WinMain
align 4
ghInst dd 0
gnWndClass dd 0
ghWnd dd 0

;Menu
ghMenu dd 0
ghMenuFile dd 0
ghMenuHelp dd 0

;Accelerators
ghAccTable dd 0

;StatusBar
ghwndStatusBar dd 0
;Divide Status Bar by 9 parts
xStatusParts dd 8 dup (0),-1 ;9 Variables
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 102,204,307,430,552,675,788,901 ;8 Constants

;WinGDI
ghDC dd 0
giPixelFormat dd 0
ghRC dd 0
gRectClientWidth dd 0 ;Integer
gRectClientHeight dd 0 ;Integer
gRectClientAspect dq 0 ;Double
xScrCenter dd 0 ;Integer
yScrCenter dd 0 ;Integer

;Flags
isActive db 1
isInitialPosition db 1
isRefreshed db 0

;Counters
gnFrame dd 0

;Timer
align 8
qpcFreq dq 0
qpcPrev dq 0
gDeltaT dq 0
tStatusAcc dq 0
tTitleAcc dq 0
nTitleFrames dd 0

;Logger
ghLogFile dd 0
dwBytesWritten dd 0

;Debug
gnLastError dd 0

;OpenGL Scene Defaults
;gluPerspective Arguments
fovy dq 4056800000000000h ;90.0
zNear dq 3FF0000000000000h ;1.0
zFar dq 412E848000000000h ;1000000.0

;Input
align 4
xPrevPos dd 0
yPrevPos dd 0
xCurPos dd 0
yCurPos dd 0
dxMouse dd 0
dyMouse dd 0
nMouseMode dd 0
key db 255 dup (0)
nKeyCode dd 0

;Motion
dStep dd 0
dAngle dd 0

;Buffers
align 4
mtxProjectionBuffer dd 16 dup (0)
mtxModelViewBuffer dd 16 dup (0)

;Lighting
align 4
;Position (-2000.0f,-1000.0f,2000.0f,1.0f)
lightPosition POINT4D <0c4fa0000h,0c47a0000h,44fa0000h,3f800000h>
;Diffuse Color (0.4f,0.4f,0.35f,0.0f)
lightDiffuse RGBA <3ecccccdh,3ecccccdh,3eb33333h,0>
;Ambient Color (0.4f,0.4f,0.35f,0.0f)
lightAmbient RGBA <3ecccccdh,3ecccccdh,3eb33333h,0>

;VBO
gVerts dd 0
gNorms dd 0
gCols dd 0
gVertCount dd 0
lpVerts dd 0
lpNorms dd 0
lpCols dd 0
capV dd 59 dup (0)
capN dd 59 dup (0)
capReady db 0


