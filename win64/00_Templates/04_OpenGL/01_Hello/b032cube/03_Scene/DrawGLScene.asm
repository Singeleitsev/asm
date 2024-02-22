DrawGLScene proc

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Clear The Screen And The Depth Buffer
mov rcx,4100h ;GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT
;Reset The View
call glClear

mov rcx,1701h ;GL_PROJECTION
call glMatrixMode
call glLoadIdentity

movsd xmm0,f64_neg1 ;GLdouble left = -1.0
movsd xmm1,f64_1 ;GLdouble right = 1.0
movsd xmm2,f64_neg1 ;GLdouble bottom = -1.0
movsd xmm3,f64_1 ;GLdouble top = 1.0
movsd xmm8,f64_neg1 ;GLdouble zNear = -1.0f
movsd qword ptr [rsp+20h],xmm8
movsd xmm9,f64_1 ;GLdouble zFar = 1.0f
movsd qword ptr [rsp+28h],xmm9
call glOrtho

;movsd xmm0,f64_neg1 ;GLdouble left = -1.0
;movsd xmm1,f64_1 ;GLdouble right = 1.0
;movsd xmm2,f64_neg1 ;GLdouble bottom = -1.0
;movsd xmm3,f64_1 ;GLdouble top = 1.0
;movsd xmm8,f64_4 ;GLdouble zNear = 4.0f
;movsd qword ptr [rsp+20h],xmm8
;movsd xmm9,f64_6 ;GLdouble zFar = 6.0f
;movsd qword ptr [rsp+28h],xmm9
;call glFrustum ;GL_PROJECTION

;Select The Modelview Matrix
mov rcx,1700h ;GL_MODELVIEW
call glMatrixMode
call glLoadIdentity

;Camera Pitch
;glRotatef(lookupdown,1.0f,0,0);
movd xmm0,aYZ
movd xmm1,f32_1 ;1.0f
xorps xmm2,xmm2 ;0.0f
xorps xmm3,xmm3 ;0.0f
call glRotatef

;Camera Roll
;glRotatef(sceneroty,0,1.0f,0);
movd xmm0,aXZ
xorps xmm1,xmm1 ;0.0f
movd xmm2,f32_1 ;1.0f
xorps xmm3,xmm3 ;0.0f
call glRotatef

;Camera Yaw
;glRotatef(getdrunk,0,0,1.0f);
movd xmm0,aXY
xorps xmm1,xmm1 ;0.0f
xorps xmm2,xmm2 ;0.0f
movd xmm3,f32_1 ;1.0f
call glRotatef

;glTranslatef(xtrans, ytrans, ztrans);
movd xmm0,xTrans
movd xmm1,yTrans
movd xmm2,zTrans
call glTranslatef

;Describe Geometry Here
;======================

include 04_Object\CubeDraw.asm

;======================

mov rcx,hdc
call SwapBuffers

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

mov rax,1
ret
DrawGLScene endp

