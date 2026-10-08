GetDefaults proc
PROLOG 100h

;1. Set the Default Projection Matrix

;1.1. Activate the Projection Matrix
mov rcx,1701h ;GL_PROJECTION
call glMatrixMode

;1.2. Reset the Projection Matrix
call glLoadIdentity

;1.3. Set the Perspective
movsd xmm0,fovy
movsd xmm1,gRectClientAspect
movsd xmm2,zNear
movsd xmm3,zFar
call gluPerspective
;wglGetLastError

;1.4. Store this Projection Matrix as the Default
mov rcx,0BA7h ;GL_PROJECTION_MATRIX
lea rdx,mtxProjectionDefault
call glGetFloatv

;2. Default Model Matrix is hardcoded in .data segment

;3. Default Object Matrix is hardcoded in .data segment

GetDefaults_End:
EPILOG
GetDefaults endp


