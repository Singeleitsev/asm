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

GetDefaults proc

;1. Set the Default Projection Matrix

;1.1. Activate the Projection Matrix
push 1701h ;GL_PROJECTION
call glMatrixMode

;1.2. Reset the Projection Matrix
call glLoadIdentity

;1.3. Set the Perspective
;Call gluPerspective(90.0, RectAspect, 1.0, 1000000.0)
;zFar = 1000000.0
push dword ptr [zFar+4] ;high dword
push dword ptr [zFar] ;low dword
;zNear = 1.0
push dword ptr [zNear+4]
push dword ptr [zNear]
;aspect = Width/Height
push dword ptr [gRectClientAspect+4]
push dword ptr [gRectClientAspect]
;fovy = 90.0
push dword ptr [fovy+4]
push dword ptr [fovy]
call gluPerspective
;wglGetLastError

;1.4. Store this Projection Matrix as the Default
push offset mtxProjectionDefault
push 0BA7h ;GL_PROJECTION_MATRIX
call glGetFloatv

;2. Hardcode the Default Model Matrix
lea ecx,mtxCameraDefault

;2.1. Move the Entire Scene to Make it Visible in the Frame
;Call glTranslatef(0.0f, 1500.0f, -9000.0f)

;mov eax,dxCamDefault ;x = 0.0f is already set by the identity initializer
;mov dword ptr[ecx+12*4],eax ;index of dx * size 4
mov eax,dyCamDefault ;y = 1500.0f
mov dword ptr[ecx+13*4],eax ;index of dy * size 4
mov eax,dzCamDefault ;z = -9000.0f
mov dword ptr[ecx+14*4],eax ;index of dz * size 4

;2.2. Rotate the Entire Scene to Make it Visible in the Frame
;Camera World to Local Conversion Angle = -90.0 deg about World X Axis
;Camera Tilt = 30.0 deg about its Local X Axis
;Camera's Local x Axis coincidents with the World x Axis
;Camera Total = -90.0 + 30.0 = -60.0 = 300.0 deg about World X Axis
;Call glRotatef(300.0f, 1.0f, 0.0f, 0.0f)
;Camera Tilt = 30.0 deg about its Local X Axis
;Camera's Local x Axis coincidents with the World x Axis
mov eax,3F000000h ;cos(300) = 0.5f
mov dword ptr[ecx+5*4],eax ;index * size 4
mov eax,0BF5DB3D7h ;-sin(300) = -sqrt(3)/2 ~ -0.8660254f
mov dword ptr[ecx+6*4],eax ;index * size 4
mov eax,3F5DB3D7h ;sin(300) = sqrt(3)/2 ~ 0.8660254f
mov dword ptr[ecx+9*4],eax ;index * size 4
mov eax,3F000000h ;cos(300) = 0.5f
mov dword ptr[ecx+10*4],eax ;index * size 4

;Rotation in Local Coordinates does not affect the Translation Column


;3. Hardcode the Default Object Matrix
lea ecx,mtxObjectDefault

;3.1. Rotate the Entire Scene to Set the Default Position
;Call glRotatef(20.0f, 0.0f, 0.0f, 1.0f) 'Object Turn
mov eax,3F70A3D7h ;cos(20) = 0.9396926f
mov dword ptr[ecx+0*4],eax ;index * size 4
mov eax,3EAF1BBDh ;sin(20) = 0.3420201f
mov dword ptr[ecx+1*4],eax ;index * size 4
mov eax,0BEAF1BBDh ;-sin(20) = -0.3420201f
mov dword ptr[ecx+4*4],eax ;index * size 4
mov eax,3F70A3D7h ;cos(20) = 0.9396926f
mov dword ptr[ecx+5*4],eax ;index * size 4

;Rotation in Local Coordinates does not affect the Translation Column

GetDefaults_End:
ret
GetDefaults endp


