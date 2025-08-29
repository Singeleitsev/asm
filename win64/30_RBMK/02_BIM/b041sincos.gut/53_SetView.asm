;lbl_SetView:

;Set Object
mov rcx,1700h ;GL_MODELVIEW
Call glMatrixMode

Call glLoadIdentity

;glRotatef(aXY_Model, 0, 0, 1)
movss xmm0,aXY_Model
xorps xmm1,xmm1
xorps xmm2,xmm2
movss xmm3,f32_1
Call glRotatef

;glScalef(GlobalScale, GlobalScale, GlobalScale)
movss xmm0,GlobalScale
movss xmm1,GlobalScale
movss xmm2,GlobalScale
Call glScalef

;Set Camera
mov rcx,1701h ;GL_PROJECTION
Call glMatrixMode

Call glLoadIdentity

;gluPerspective(90, RectAspect, 0.1, 1000)
movsd xmm0,f64_90
movsd xmm1,RectAspect
movsd xmm2,f64_TENTH
movsd xmm3,f64_1000
Call gluPerspective

;glRotatef(aYZ_Cam, 1, 0, 0)
movss xmm0,aYZ_Cam
movss xmm1,f32_1
xorps xmm2,xmm2
xorps xmm3,xmm3
Call glRotatef

;glRotatef(aXY_Cam, 0, 0, 1)
movss xmm0,aXY_Cam
xorps xmm1,xmm1
xorps xmm2,xmm2
movss xmm3,f32_1
Call glRotatef

;glRotatef(aXZ_Cam, 0, 1, 0)
movss xmm0,aXZ_Cam
xorps xmm1,xmm1
movss xmm2,f32_1
xorps xmm3,xmm3
Call glRotatef

;glTranslatef(xCam, yCam, zCam)
movss xmm0,xCam
movss xmm1,yCam
movss xmm2,zCam
Call glTranslatef

;lbl_SetView_End:
