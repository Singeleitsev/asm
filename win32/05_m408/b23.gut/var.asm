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
xStatusParts dd STATUS_BAR_PARTS-1 dup (0),-1
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 102,204,307,430,552,675,788,901 ;(n-1) constants

;WinGDI
ghDC dd 0
giPixelFormat dd 0
ghRC dd 0
gRectClientWidth dd 0 ;Integer
gRectClientHeight dd 0 ;Integer
gRectClientAspect real8 0.0
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

;Input
align 4
key db 255 dup (0)
nKeyCode dd 0
nMouseMode dd 0
dxMouse dd 0
dyMouse dd 0
xCurPos dd 0
yCurPos dd 0
xPrevPos dd 0
yPrevPos dd 0

;Logger
ghLogFile dd 0
dwBytesWritten dd 0

;Debug
gnLastError dd 0

;OpenGL Scene Defaults

;gluPerspective Arguments
fovy real8 90.0
zNear real8 1.0
zFar real8 1000000.0

;Camera Matrix Defaults in World Coordinates
dxCamDefault real4 0.0
dyCamDefault real4 1500.0
dzCamDefault real4 -9000.0
;Camera World to Local Conversion Angle = -90.0 deg about World X Axis
;Camera Tilt = 30.0 deg about its Local X Axis
;Camera's Local x Axis coincidents with the World x Axis
;Camera Total = -90.0 + 30.0 = -60.0 = 300.0 deg about World X Axis
;axyCamDefault real4 0.0
;axzCamDefault real4 0.0
;ayzCamDefault real4 300.0

;Object Matrix Defaults in World Coordinates
;dxObjDefault real4 0.0
;dyObjDefault real4 0.0
;dzObjDefault real4 0.0
;axyObjDefault real4 20.0
;axzObjDefault real4 0.0
;ayzObjDefault real4 0.0

;Motion
LinearSpeed real4 20.0 ;Default
LinearBoost real4 10.0 ;Default
posStep real4 0.0
negStep real4 0.0
AngularSpeed real4 1.0 ;Default
AngularBoost real4 10.0 ;Default
posAngle real4 0.0
negAngle real4 0.0

;Buffers
align 16
mtxProjectionDefault mat4 <>
mtxProjectionVolatile mat4 <>
mtxCameraDefault mat4 <>
mtxCameraVolatile mat4 <>
mtxObjectDefault mat4 <>
mtxObjectVolatile mat4 <>

;Lighting
align 4
lightPosition POINT4D <-2000.0,-1000.0,2000.0,1.0>
lightDiffuse RGBA <0.4,0.4,0.35,0.0>
lightAmbient RGBA <0.4,0.4,0.35,0.0>

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


