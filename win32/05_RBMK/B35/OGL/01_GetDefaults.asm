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

;2. Default Model Matrix is hardcoded in .data segment

;3. Default Object Matrix is hardcoded in .data segment

GetDefaults_End:
ret
GetDefaults endp


