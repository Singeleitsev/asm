;WinMain
ghInst dq 0
ghProcessHeap dq 0
gnWndClass dq 0
ghWnd dq 0

;Menu
ghMenu dq 0
ghMenuFile dq 0
ghMenuHelp dq 0

;Accelerators
ghAccTable dq 0

;StatusBar
ghWndStatusBar dq 0
;Divide Status Bar by 9 parts
xStatusParts dd STATUS_BAR_PARTS-1 dup (0),-1
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 170,340,510,680,850 ;(n-1) constants

;Timer
align 10h
qpcFreq dq 0 ;Ticks per Second
qpcPrev dq 0 ;Last Sample
qpcNow dq 0 ;Current Sample
FPS dd 0 ;Special Counter for FPS

;Flags
isActive db 1
isInitialPosition db 1
isRefreshed db 0
gnMouseMode dd MOUSE_MODE_FREE

;GDI
ghDC dq 0
giPixelFormat dd 0
ghRC dq 0
gRectClientWidth dd 0 ;Integer
gRectClientHeight dd 0 ;Integer
gRectClientAspect real8 0.0
xScrCenter dd 0 ;Integer
yScrCenter dd 0 ;Integer

;Application Logger
ghLogFile dq 0
dwBytesWritten dd 0
gnLastError dd 0

;Input

;Keyboard
align 10h
key db 256 dup (0)
nKeyCode dd 0

;Screen Coordinates
xMouseNew dd 0
yMouseNew dd 0
xMouseOld dd 0
yMouseOld dd 0
dxMouse dd 0
dyMouse dd 0

;Camera
align 16
vecCamPos vec4 <>
;Walk
CamWalkSpeed real4 0.2
CamWalkBoost real4 10.0
;Drag
CamDragSpeed real4 0.2
;Dolly
CamDollySpeed real4 0.1
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
ObjMoveSpeed real4 0.2
ObjMoveBoost real4 10.0
;Rotate
ObjRotateSpeedVer real4 0.1 ;Degrees by Pixel
ObjAngleHor real4 0.0
ObjSinHor real4 0.0
ObjCosHor real4 0.0
ObjRotateSpeedHor real4 0.1 ;Degrees by Pixel
ObjAngleVer real4 0.0
ObjSinVer real4 0.0
ObjCosVer real4 0.0

;OpenGL 3.2+
profileMask dd 0 ;Core profile
numFormats dd 0

;------------------------------------------------------------
;Camera convention for this project:
;- Camera looks along world +y (not the OpenGL default -z)
;- Camera is tilted down slightly (~ -z component)
;- "Forward" in the code = the camera's own forward axis,
;which corresponds to matrix column indices 2,6,10 here.
;- Pressing Up walks the camera forward;on screen the
;world appears to move backward. That is intended.
;------------------------------------------------------------
;x|00|10|20|30| |x|00|04|08|12|
;y|01|11|21|31| |y|01|05|09|13|
;z|02|12|22|32| |z|02|06|10|14|
;w|03|13|23|33| |w|03|07|11|15|

align 10h
mtxProjectionDefault mat4 < \
 2.09422,	\ ;m00 = f / aspect = 3.1715948 / (786/519)
 0.0,		\ ;m01
 0.0,		\ ;m02
 0.0,		\ ;m03
 0.0,		\ ;m10
 3.1715948,	\ ;m11 = f = 1 / tan(35°/2)
 0.0,		\ ;m12
 0.0,		\ ;m13
 0.0,		\ ;m20
 0.0,		\ ;m21
-1.0004001,	\ ;m22 = (zFar + zNear) / (zNear - zFar)
-1.0,		\ ;m23 = -1
 0.0,		\ ;m30
 0.0,		\ ;m31
-2.0004001,	\ ;m32 = (2 * zFar * zNear) / (zNear - zFar)
 0.0 		> ;m33

;Camera World to Local Conversion Angle = -90.0 deg about World X Axis
;Camera Tilt = 10.0 deg about its Local X Axis
;Camera's Local x Axis coincidents with the World x Axis
;Camera Total Tilt = -90.0 + 10.0 = -80.0 = 280.0 deg about World X Axis
mtxCameraDefault mat4 < \
 1.0,		\ ;m00 = 1.0
 0.0,		\ ;m01
 0.0,		\ ;m02
 0.0,		\ ;m03
 0.0,		\ ;m10
 0.1736482,	\ ;m11 = cos(280)
-0.9848078,	\ ;m12 = sin(280)
 0.0,		\ ;m13
 0.0,		\ ;m20
 0.9848078,	\ ;m21 = -sin(280)
 0.1736482,	\ ;m22 = cos(280)
 0.0,		\ ;m23
-25.0,		\ ;m30 = xCamLocal
-20.0,		\ ;m31 = yCamLocal
-150.0,		\ ;m32 = zCamLocal
 1.0		> ;m33 = 1.0

;The Object is initially Turned 135 degrees about its local Z Axis
mtxObjectDefault mat4 < \
-0.7071068,	\ ;m00 = cos(135)
 0.7071068,	\ ;m01 = sin(135)
 0.0,		\ ;m02
 0.0,		\ ;m03
-0.7071068,	\ ;m04 = -sin(135)
-0.7071068,	\ ;m05 = cos(135)
 0.0,		\ ;m06
 0.0,		\ ;m07
 0.0,		\ ;m08
 0.0,		\ ;m09
 1.0,		\ ;m10 = 1.0
 0.0,		\ ;m11
 0.0,		\ ;m12 = xObjLocal
 0.0,		\ ;m13 = yObjLocal
 0.0,		\ ;m14 = zObjLocal
 1.0		> ;m15 = 1.0

;Volatile Matrices
mtxProjectionVolatile mat4 <>
mtxCameraVolatile mat4 <>
mtxObjectVolatile mat4 <>

mtxRodrigues mat4 <>
mtxBuffer mat4 <>

;Lighting
lightPosition vec4 <0.3,-0.8,0.5,1.0>

;OpenGL Functions from the vendor's driver DLL

;ARB Functions
gpWglCreateContextAttribsARB dq 0
gpWglChoosePixelFormatARB dq 0

;Matrices
gpGlUniformMatrix4fv dq 0

;VBO - OpenGL 1.5
gpGlGenBuffers dq 0
gpGlBindBuffer dq 0
gpGlBufferData dq 0
gpGlDeleteBuffers dq 0

;VAO
gpGlEnableVertexAttribArray dq 0
gpGlDisableVertexAttribArray dq 0
gpGlVertexAttribPointer dq 0
gpGlBindAttribLocation dq 0
gpGlGenVertexArrays dq 0
gpGlBindVertexArray dq 0
gpGlDeleteVertexArrays dq 0

;Shaders - OpenGL 2.0
gpGlCreateShader dq 0
gpGlShaderSource dq 0
gpGlCompileShader dq 0
gpGlGetShaderiv dq 0
gpGlCreateProgram dq 0
gpGlAttachShader dq 0
gpGlLinkProgram dq 0
gpGlGetProgramiv dq 0
gpGlUseProgram dq 0
gpGlDeleteShader dq 0
gpGlDeleteProgram dq 0
gpGlGetAttribLocation dq 0

;Shader Uniforms
gpGlGetUniformLocation dq 0
gpGlUniform3f dq 0
gpGlUniform3fv dq 0

;Application Pointers

;VBO
VboVerticesID dq 0
VboIndicesOpaqueID dq 0
VboIndicesTransparentID dq 0

;VAO
VaoID dq 0

;Shaders
gpFileNameShaderV dq 0
gpFileNameShaderF dq 0
ghShaderV dq 0
ghShaderF dq 0
gpShaderProgram dq 0
gnShaderStatus  dd 0
gnProgramStatus dd 0

;Uniforms
uLocationProjection dq 0
uLocationView dq 0
uLocationModel dq 0
uLocationCamera dq 0
uLocationLightDir dq 0
uLocationDiffuse dq 0
uLocationSpecular dq 0
uLocationAmbient dq 0
uLocationEmissive dq 0
uLocationProps0 dq 0
uLocationProps1 dq 0

;OpenGL Logger
gpGlGetShaderInfoLog dq 0
gpGlGetProgramInfoLog dq 0
shaderLogLength dd 0
shaderLogBuffer db 1024 dup (0)


;OBJ File
ghObjFile dq 0
gnObjFileSize dq 0
ghObjMapping dq 0
gpObjDataStart dq 0
gpObjDataEnd dq 0

;Token Counters
gnCount_mtllib dd 0 ;Material Libraries
gnCount_o dd 0 ;Objects
gnCount_g dd 0 ;Groups
gnCount_usemtl dd 0 ;Used Materials
gnCount_s dd 0 ;Smoothing Groups
gnCount_v dd 0 ;Vertices
gnCount_vn dd 0 ;Normals
gnCount_vt dd 0 ;Texture Vectors
gnCount_f dd 0 ;Faces

;Buffers
gpBuffer_mtllib dq 0 ;Material Libraries Metadata
gpBuffer_o dq 0 ;Objects Metadata
gpBuffer_g dq 0 ;Groups Metadata
gpBuffer_usemtl dq 0 ;Used Materials Metadata
gpBuffer_s dq 0 ;Smoothing Groups Metadata
gpBuffer_v dq 0 ;Vertices Raw Coordinates
gpBuffer_vn dq 0 ;Normals Raw Coordinates
gpBuffer_vt dq 0 ;Texture Vectors Raw Coordinates
gpBuffer_f dq 0 ;Faces Raw Indices

;Entity Counters
gnCurrent_mtllib dd 0 ;Material Libraries
gnCurrent_o dd 0 ;Objects
gnCurrent_g dd 0 ;Groups
gnCurrent_usemtl dd 0 ;Used Materials
gnCurrent_s dd 0 ;Smoothing Groups
gnCurrent_v dd 0 ;Vertices
gnCurrent_vn dd 0 ;Normals
gnCurrent_vt dd 0 ;Texture Vectors
gnCurrent_f dd 0 ;Faces

;Material Map
gpUsemtlToMaterial dq 0 ;Index into gpBuffer_newmtl for each usemtl

gnCurrentCombinedCount dd 0 ;<---
gpObjCombined dq 0 ;<---
gnCurrentIndexCount dd 0 ;<---
gpObjIndices dq 0 ;<---

;MTL File
ghMtlFile dq 0
gnMtlFileSize dq 0
ghMtlMapping dq 0
gpMtlDataStart dq 0
gpMtlDataEnd dq 0

;Token Counters
gnCount_newmtl dd 0 ;Materials

;Buffers
gpBuffer_newmtl dq 0 ;Materials Metadata

;Entity Counters
gnCurrent_newmtl dd 0 ;Materials

;BuildGeometry
gpInterleavedVNC dq 0
gpIndicesOpaque dq 0
gpIndicesTransparent dq 0
gnCurrentFaceIndex dd 0
gnCurrentVertex dd 0
rsiOpaque dq 0
rsiTransparent dq 0

;Final Counter
gnTotalIndices dd 0
gnIndexCountOpaque dd 0
gnIndexCountTransparent dd 0


