GetDefaults proc

;1. Set the Default Projection Matrix

;1.1. Activate the Projection Matrix
push 1701h ;GL_PROJECTION
call glMatrixMode

;1.2. Reset the Projection Matrix
call glLoadIdentity

;1.3. Set the Perspective
;zFar
push dword ptr [zFar+4] ;high dword
push dword ptr [zFar] ;low dword
;zNear
push dword ptr [zNear+4]
push dword ptr [zNear]
;aspect = Width/Height
push dword ptr [gRectClientAspect+4]
push dword ptr [gRectClientAspect]
;fovy
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


