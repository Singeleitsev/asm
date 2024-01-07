lblDrawPyramid:

;Reset The Current Modelview Matrix
call glLoadIdentity

;Move Left 1.5 Units And Into The Screen 6.0
mov eax,0bfc00000h ;-1.5f
movd xmm0,eax
xorps xmm1,xmm1 ;0.0f
mov eax,0c0c00000h ;-6.0f
movd xmm2,eax
call glTranslatef

;Rotate The Triangle On The Y axis
mov eax,aTri
movd xmm0,eax
xorps xmm1,xmm1 ;X=0.0f
mov eax,3f800000h ;Y=1.0f
movd xmm2,eax
xorps xmm3,xmm3 ;Z=0.0f
call glRotatef

;glBegin(GL_TRIANGLES); // Start Drawing A Triangle
mov rcx, 4 ;GL_TRIANGLES
call glBegin

;glColor3f(1.0f,0.0f,0.0f); // Red
mov eax,3f800000h ;1.0f
movd xmm0,eax
xorps xmm1,xmm1 ;0.0f
xorps xmm2,xmm2 ;0.0f
call glColor3f

;glVertex3f(0.0f,1.0f,0.0f); // Top Of Triangle (Front)
xorps xmm0,xmm0 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm1,eax
xorps xmm2,xmm2 ;0.0f
call glVertex3f

;glColor3f(0.0f,1.0f,0.0f); // Green
xorps xmm0,xmm0 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm1,eax
xorps xmm2,xmm2 ;0.0f
call glColor3f

;glVertex3f(-1.0f,-1.0f,1.0f); // Left Of Triangle (Front)
mov eax,0bf800000h ;-1.0f
movd xmm0,eax
mov eax,0bf800000h ;-1.0f
movd xmm1,eax
mov eax,3f800000h ;1.0f
movd xmm2,eax
call glVertex3f

;glColor3f(0.0f,0.0f,1.0f); // Blue
xorps xmm0,xmm0 ;0.0f
xorps xmm1,xmm1 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm2,eax
call glColor3f

;glVertex3f(1.0f,-1.0f,1.0f); // Right Of Triangle (Front)
mov eax,3f800000h ;1.0f
movd xmm0,eax
mov eax,0bf800000h ;-1.0f
movd xmm1,eax
mov eax,3f800000h ;1.0f
movd xmm2,eax
call glVertex3f

;glColor3f(1.0f,0.0f,0.0f); // Red
mov eax,3f800000h ;1.0f
movd xmm0,eax
xorps xmm1,xmm1 ;0.0f
xorps xmm2,xmm2 ;0.0f
call glColor3f

;glVertex3f(0.0f,1.0f,0.0f); // Top Of Triangle (Right)
xorps xmm0,xmm0 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm1,eax
xorps xmm2,xmm2 ;0.0f
call glVertex3f

;glColor3f(0.0f,0.0f,1.0f); // Blue
xorps xmm0,xmm0 ;0.0f
xorps xmm1,xmm1 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm2,eax
call glColor3f

;glVertex3f( 1.0f,-1.0f,1.0f); // Left Of Triangle (Right)
mov eax,3f800000h ;1.0f
movd xmm0,eax
mov eax,0bf800000h ;-1.0f
movd xmm1,eax
mov eax,3f800000h ;1.0f
movd xmm2,eax
call glVertex3f

;glColor3f(0.0f,1.0f,0.0f); // Green
xorps xmm0,xmm0 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm1,eax
xorps xmm2,xmm2 ;0.0f
call glColor3f

;glVertex3f( 1.0f,-1.0f,-1.0f); // Right Of Triangle (Right)
mov eax,3f800000h ;1.0f
movd xmm0,eax
mov eax,0bf800000h ;-1.0f
movd xmm1,eax
mov eax,0bf800000h ;-1.0f
movd xmm2,eax
call glVertex3f

;glColor3f(1.0f,0.0f,0.0f); // Red
mov eax,3f800000h ;1.0f
movd xmm0,eax
xorps xmm1,xmm1 ;0.0f
xorps xmm2,xmm2 ;0.0f
call glColor3f

;glVertex3f( 0.0f, 1.0f, 0.0f); // Top Of Triangle (Back)
xorps xmm0,xmm0 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm1,eax
xorps xmm2,xmm2 ;0.0f
call glVertex3f

;glColor3f(0.0f,1.0f,0.0f); // Green
xorps xmm0,xmm0 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm1,eax
xorps xmm2,xmm2 ;0.0f
call glColor3f

;glVertex3f( 1.0f,-1.0f,-1.0f); // Left Of Triangle (Back)
mov eax,3f800000h ;1.0f
movd xmm0,eax
mov eax,0bf800000h ;-1.0f
movd xmm1,eax
mov eax,0bf800000h ;-1.0f
movd xmm2,eax
call glVertex3f

;glColor3f(0.0f,0.0f,1.0f); // Blue
xorps xmm0,xmm0 ;0.0f
xorps xmm1,xmm1 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm2,eax
call glColor3f

;glVertex3f(-1.0f,-1.0f, -1.0f); // Right Of Triangle (Back)
mov eax,0bf800000h ;-1.0f
movd xmm0,eax
mov eax,0bf800000h ;-1.0f
movd xmm1,eax
mov eax,0bf800000h ;-1.0f
movd xmm2,eax
call glVertex3f

;glColor3f(1.0f,0.0f,0.0f); // Red
mov eax,3f800000h ;1.0f
movd xmm0,eax
xorps xmm1,xmm1 ;0.0f
xorps xmm2,xmm2 ;0.0f
call glColor3f

;glVertex3f( 0.0f, 1.0f, 0.0f); // Top Of Triangle (Left)
xorps xmm0,xmm0 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm1,eax
xorps xmm2,xmm2 ;0.0f
call glVertex3f

;glColor3f(0.0f,0.0f,1.0f); // Blue
xorps xmm0,xmm0 ;0.0f
xorps xmm1,xmm1 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm2,eax
call glColor3f

;glVertex3f(-1.0f,-1.0f,-1.0f); // Left Of Triangle (Left)
mov eax,0bf800000h ;-1.0f
movd xmm0,eax
mov eax,0bf800000h ;-1.0f
movd xmm1,eax
mov eax,0bf800000h ;-1.0f
movd xmm2,eax
call glVertex3f

;glColor3f(0.0f,1.0f,0.0f); // Green
xorps xmm0,xmm0 ;0.0f
mov eax,3f800000h ;1.0f
movd xmm1,eax
xorps xmm2,xmm2 ;0.0f
call glColor3f

;glVertex3f(-1.0f,-1.0f, 1.0f); // Right Of Triangle (Left)
mov eax,0bf800000h ;-1.0f
movd xmm0,eax
mov eax,0bf800000h ;-1.0f
movd xmm1,eax
mov eax,3f800000h ;1.0f
movd xmm2,eax
call glVertex3f

;Done Drawing The Pyramid
call glEnd

finit
;Increase The Rotation Variable For The Triangle
fld aTri
fadd daTri
fstp aTri

