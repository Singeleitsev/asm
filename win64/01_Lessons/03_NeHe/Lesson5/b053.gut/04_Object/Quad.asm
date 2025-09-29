lblDrawQuad:

;Reset The Current Modelview Matrix
call glLoadIdentity

;glTranslatef(1.5f,0.0f,-7.0f) // Move Right1.5 Units And Into The Screen 7.0
mov eax,3fc00000h ;1.5f
movd xmm0,eax
xorps xmm1,xmm1
mov eax,0c0e00000h ;-7.0f
movd xmm2,eax
call glTranslatef

;glRotatef(rquad,1.0f,1.0f,1.0f) // Rotate The Quad On The X axis ( NEW )
movss xmm0,aQuad
movss xmm1,sgl_1
movss xmm2,sgl_1
movss xmm3,sgl_1
call glRotatef

;glBegin(GL_QUADS) // Draw A Quad
mov ecx,7 ;GL_QUADS
call glBegin

movd xmm6,sgl_neg_1
movd xmm7,sgl_1

;glColor3f(0.0f,1.0f,0.0f) // Set The Color To Green
xorps xmm0,xmm0
movss xmm1,sgl_1
xorps xmm2,xmm2
call glColor3f

;glVertex3f(1.0f,1.0f,-1.0f) // Top Right Of The Quad (Top)
movss xmm0,sgl_1
movss xmm1,sgl_1
movss xmm2,sgl_neg_1
call glVertex3f

;glVertex3f(-1.0f,1.0f,-1.0f) // Top Left Of The Quad (Top)
movaps xmm2,xmm6
movaps xmm1,xmm7
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(-1.0f,1.0f,1.0f) // Bottom Left Of The Quad (Top)
movaps xmm2,xmm7
movaps xmm1,xmm7
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(1.0f,1.0f,1.0f) // Bottom Right Of The Quad (Top)
movaps xmm2,xmm7
movaps xmm1,xmm7
movaps xmm0,xmm7
call glVertex3f

;glColor3f(1.0f,0.5f,0.0f) // Set The Color To Orange
movss xmm1,sgl_HALF
xorps xmm2,xmm2
movaps xmm0,xmm7
call glColor3f

;glVertex3f(1.0f,-1.0f,1.0f) // Top Right Of The Quad (Bottom)
movaps xmm2,xmm7
movaps xmm1,xmm6
movaps xmm0,xmm7
call glVertex3f

;glVertex3f(-1.0f,-1.0f,1.0f) // Top Left Of The Quad (Bottom)
movaps xmm2,xmm7
movaps xmm1,xmm6
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(-1.0f,-1.0f,-1.0f) // Bottom Left Of The Quad (Bottom)
movaps xmm2,xmm6
movaps xmm1,xmm6
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(1.0f,-1.0f,-1.0f) // Bottom Right Of The Quad (Bottom)
movaps xmm2,xmm6
movaps xmm1,xmm6
movaps xmm0,xmm7
call glVertex3f

;glColor3f(1.0f,0.0f,0.0f) // Set The Color To Red
xorps xmm2,xmm2
xorps xmm1,xmm1
movaps xmm0,xmm7
call glColor3f

;glVertex3f(1.0f,1.0f,1.0f) // Top Right Of The Quad (Front)
movaps xmm2,xmm7
movaps xmm1,xmm7
movaps xmm0,xmm7
call glVertex3f

;glVertex3f(-1.0f,1.0f,1.0f) // Top Left Of The Quad (Front)
movaps xmm2,xmm7
movaps xmm1,xmm7
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(-1.0f,-1.0f,1.0f) // Bottom Left Of The Quad (Front)
movaps xmm2,xmm7
movaps xmm1,xmm6
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(1.0f,-1.0f,1.0f) // Bottom Right Of The Quad (Front)
movaps xmm2,xmm7
movaps xmm1,xmm6
movaps xmm0,xmm7
call glVertex3f

;glColor3f(1.0f,1.0f,0.0f) // Set The Color To Yellow
xorps xmm2,xmm2
movaps xmm1,xmm7
movaps xmm0,xmm7
call glColor3f

;glVertex3f(1.0f,-1.0f,-1.0f) // Top Right Of The Quad (Back)
movaps xmm2,xmm6
movaps xmm1,xmm6
movaps xmm0,xmm7
call glVertex3f

;glVertex3f(-1.0f,-1.0f,-1.0f) // Top Left Of The Quad (Back)
movaps xmm2,xmm6
movaps xmm1,xmm6
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(-1.0f,1.0f,-1.0f) // Bottom Left Of The Quad (Back)
movaps xmm2,xmm6
movaps xmm1,xmm7
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(1.0f,1.0f,-1.0f) // Bottom Right Of The Quad (Back)
movaps xmm2,xmm6
movaps xmm1,xmm7
movaps xmm0,xmm7
call glVertex3f

;glColor3f(0.0f,0.0f,1.0f) // Set The Color To Blue
movaps xmm2,xmm7
xorps xmm1,xmm1
xorps xmm0,xmm0
call glColor3f

;glVertex3f(-1.0f,1.0f,1.0f) // Top Right Of The Quad (Left)
movaps xmm2,xmm7
movaps xmm1,xmm7
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(-1.0f,1.0f,-1.0f) // Top Left Of The Quad (Left)
movaps xmm2,xmm6
movaps xmm1,xmm7
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(-1.0f,-1.0f,-1.0f) // Bottom Left Of The Quad (Left)
movaps xmm2,xmm6
movaps xmm1,xmm6
movaps xmm0,xmm6
call glVertex3f

;glVertex3f(-1.0f,-1.0f,1.0f) // Bottom Right Of The Quad (Left)
movaps xmm2,xmm7
movaps xmm1,xmm6
movaps xmm0,xmm6
call glVertex3f

;glColor3f(1.0f,0.0f,1.0f) // Set The Color To Violet
movaps xmm2,xmm7
xorps xmm1,xmm1
movaps xmm0,xmm7
call glColor3f

;glVertex3f(1.0f,1.0f,-1.0f) // Top Right Of The Quad (Right)
movaps xmm2,xmm6
movaps xmm1,xmm7
movaps xmm0,xmm7
call glVertex3f

;glVertex3f(1.0f,1.0f,1.0f) // Top Left Of The Quad (Right)
movaps xmm2,xmm7
movaps xmm1,xmm7
movaps xmm0,xmm7
call glVertex3f

;glVertex3f(1.0f,-1.0f,1.0f) // Bottom Left Of The Quad (Right)
movaps xmm2,xmm7
movaps xmm1,xmm6
movaps xmm0,xmm7
call glVertex3f

;glVertex3f(1.0f,-1.0f,-1.0f) // Bottom Right Of The Quad (Right)
movaps xmm2,xmm6
movaps xmm1,xmm6
movaps xmm0,xmm7
call glVertex3f


;Done Drawing The Quad
call glEnd

;Decrease The Rotation Variable For The Quad
fld aQuad
fsub daQuad
fstp aQuad


