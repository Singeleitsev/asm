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

;Keyboard
align 4
key db 255 dup (0)
nKeyCode dd 0

;Mouse
align 4
gnMouseMode dd 0
xMouseNew dd 0
yMouseNew dd 0
xMouseOld dd 0
yMouseOld dd 0
dxMouse dd 0
dyMouse dd 0
;Arcball
SpinSpeed real4 0.5 ;degrees per pixel
Radius real4 0.0
;Arcball pipeline coordinate stack
align 16
xVectorNew real4 0.0
yVectorNew real4 0.0
zVectorNew real4 1.0
wVectorNew real4 0.0 ;Padding
xVectorOld real4 0.0
yVectorOld real4 0.0
zVectorOld real4 1.0
wVectorOld real4 1.0 ;Padding
align 16
mtxArcball mat4 <>
eps real4 0.001 ;1 micrometer

;Pan
PanSpeed real4 20.0
PanMagnitudeX real4 1.0
PanMagnitudeY real4 1.0
;Dolly
DollySpeed real4 1.0
DollyMagnitude real4 0.0

;Motion
;Direction
posOne real4 1.0
negOne real4 -1.0
;Move
WalkSpeed real4 20.0
WalkBoost real4 10.0
WalkMagnitude real4 0.0
;Rotate
sinSlow real4 0.017452406 ;sin(1deg)
cosSlow real4 0.999847695 ;cos(1deg)
;AngularBoost
sinFast real4 0.173648178 ;sin(10deg)
cosFast real4 0.984807753 ;cos(10deg)

;Numeric
PiOver180 real4 0.017453292519943295

;Logger
ghLogFile dd 0
dwBytesWritten dd 0

;Debug
gnLastError dd 0

;OpenGL Scene Defaults

;------------------------------------------------------------
;Camera convention for this project:
;- Camera looks along world +y (not the OpenGL default -z)
;- Camera is tilted down slightly (~ -z component)
;- "Forward" in the code = the camera's own forward axis,
;  which corresponds to matrix column indices 2,6,10 here.
;- Pressing Up walks the camera forward; on screen the
;  world appears to move backward. That is intended.
;------------------------------------------------------------
;x|00|10|20|30| |x|00|04|08|12|
;y|01|11|21|31| |y|01|05|09|13|
;z|02|12|22|32| |z|02|06|10|14|
;w|03|13|23|33| |w|03|07|11|15|

;gluPerspective Arguments
fovy real8 90.0
zNear real8 1.0
zFar real8 1000000.0

;Buffers
align 16
mtxProjectionDefault mat4 <>

;Camera World to Local Conversion Angle = -90.0 deg about World X Axis
;Camera Tilt = 30.0 deg about its Local X Axis
;Camera's Local x Axis coincidents with the World x Axis
;Camera Total Tilt = -90.0 + 30.0 = -60.0 = 300.0 deg about World X Axis
mtxCameraDefault mat4 < \
 1.0,		\ ;m00 = 1.0
 0.0,		\ ;m01
 0.0,		\ ;m02
 0.0,		\ ;m03
 0.0,		\ ;m10
 0.5,		\ ;m11 = cos(300)
-0.8660254,	\ ;m12 = -sin(300) = -sqrt(3)/2
 0.0,		\ ;m13
 0.0,		\ ;m20
 0.8660254,	\ ;m21 = sin(300) = sqrt(3)/2
 0.5,		\ ;m22 = cos(300)
 0.0,		\ ;m23
 0.0,		\ ;m30 = dxCam
 1500.0,	\ ;m31 = dyCam
-9000.0,	\ ;m32 = dzCam
 1.0 		> ;m33 = 1.0

;The Object is initially Turned 20 degrees about its local Z Axis
;Just to ensure this matrix works
mtxObjectDefault mat4 < \
 0.9396926,	\ ;m00 = cos(20)
 0.3420201,	\ ;m01 = sin(20)
 0.0,		\ ;m02
 0.0,		\ ;m03
-0.3420201,	\ ;m10 = -sin(20)
 0.9396926,	\ ;m11 = cos(20)
 0.0,		\ ;m12
 0.0,		\ ;m13
 0.0,		\ ;m20
 0.0,		\ ;m21
 1.0,		\ ;m22 = 1.0
 0.0,		\ ;m23
 0.0,		\ ;m30
 0.0,		\ ;m31
 0.0,		\ ;m32
 1.0		> ;m33 = 1.0

mtxProjectionVolatile mat4 <>
mtxCameraVolatile mat4 <>
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


