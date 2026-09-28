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
ghWndStatusBar dd 0
;Divide Status Bar by 9 parts
xStatusParts dd STATUS_BAR_PARTS-1 dup (0),-1
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 170,340,510,680,850 ;(n-1) constants

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
gnMouseMode dd MOUSE_MODE_FREE

;Counters
gnFrame dd 0

;Timer
align 8
qpcFreq dq 0 ;Ticks per Second
qpcPrev dq 0 ;Last Sample
qpcNow dq 0 ;Current Sample
gDeltaT real4 0.0 ;Seconds, Clamped to [0, 0.1]
MaxDeltaT real4 0.1 ;Clamp Threshold
tTitleAcc real4 0.0 ;Accumulator for title updates
nTitleFrames dd 0 ;Special Counter for FPS

;Input

;Keyboard
align 4
key db 255 dup (0)
nKeyCode dd 0

;Screen Coordinates
align 4
xMouseNew dd 0
yMouseNew dd 0
xMouseOld dd 0
yMouseOld dd 0
dxMouse dd 0
dyMouse dd 0

;Direction
posOne real4 1.0
negOne real4 -1.0

;Camera
align 16
vecCamPos vec4 <>
;Walk
CamWalkSpeed real4 20.0
CamWalkBoost real4 10.0
CamWalkMagnitude real4 0.0
;Drag
CamDragSpeed real4 20.0
CamDragMagnitude real4 0.0
;Dolly
CamDollySpeed real4 1.0
CamDollyMagnitude real4 0.0
;Rotate
CamRotateSpeedHor real4 0.1 ;Degrees by Pixel
CamAngleHor real4 0.0
CamSinHor real4 0.0
CamCosHor real4 0.0
CamRotateSpeedVer real4 0.1 ;Degrees by Pixel
CamAngleVer real4 0.0
CamSinVer real4 0.0
CamCosVer real4 0.0

;Object
align 16
vecObjPos vec4 <>
;Move
ObjMoveSpeed real4 20.0
ObjMoveBoost real4 10.0
ObjMoveMagnitude real4 0.0
;Rotate
ObjRotateSpeedVer real4 0.1 ;Degrees by Pixel
ObjAngleHor real4 0.0
ObjSinHor real4 0.0
ObjCosHor real4 0.0
ObjRotateSpeedHor real4 0.1 ;Degrees by Pixel
ObjAngleVer real4 0.0
ObjSinVer real4 0.0
ObjCosVer real4 0.0

;Numeric
PiOver180 real4 0.017453292519943295
eps real4 0.001 ;One micrometer
;Unnamed
f32_10K real4 10000.0

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
fovy real8 45.0
zNear real8 100.0
zFar real8 100000.0

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
 0.0,		\ ;m30 = xCamLocal
 0.0,		\ ;m31 = yCamLocal
-6000.0,	\ ;m32 = zCamLocal
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
 0.0,		\ ;m30 = xObjLocal
 0.0,		\ ;m31 = yObjLocal
 0.0,		\ ;m32 = zObjLocal
 1.0		> ;m33 = 1.0

mtxProjectionVolatile mat4 <>
mtxCameraVolatile mat4 <>
mtxObjectVolatile mat4 <>

;Lighting
align 4
lightAmbient  RGBA <0.25,0.25,0.25,1.0>
lightDiffuse  RGBA <0.75,0.75,0.75,1.0>
lightSpecular RGBA <0.15,0.15,0.15,1.0>
lightPosition vec4 <-2000.0,-1000.0,2000.0,0.0>

;Auto Rotation
align 4
autoAngle real4 0.0
autoAngle2 real4 0.0
autoRotate db 1
fRotOuter real4 0.025
fRotInner real4 0.04
fNegOne real4 -1.0
fTwoPi real4 6.28318530718
fHalf real4 0.5
f360_real real4 360.0
fCubeSize real4 180.0
fLayerHeight real4 180.0
fRadiusOuter real4 2000.0
fRadiusInner real4 1300.0
fTemp real4 0.0
fTempX real4 0.0
fTempY real4 0.0
fTempZ real4 0.0
fTempAngle real4 0.0
fTempR real4 0.0
fTempG real4 0.0
fTempB real4 0.0
fGround real4 7000.0
fNegGround real4 -7000.0
align 16
colorTable real4 0.2,0.6,1.0, 1.0,0.3,0.3, 0.2,0.8,0.4, 1.0,0.8,0.2, 0.6,0.3,0.9, 1.0,0.5,0.0


