;===============
DrawGLScene proc
;===============

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Clear Screen And Depth Buffer
mov rcx,4100h ;GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT
call glClear

mov rcx,1701h ;GL_PROJECTION
call glMatrixMode
call glLoadIdentity

;Camera Pitch
;glRotatef(lookupdown,1.0f,0,0);
movd xmm0,a_R3_YZ
movd xmm1,f32_1 ;1.0f
xorps xmm2,xmm2 ;0.0f
xorps xmm3,xmm3 ;0.0f
call glRotatef

;Camera Roll
;glRotatef(sceneroty,0,1.0f,0);
movd xmm0,a_R3_XZ
xorps xmm1,xmm1 ;0.0f
movd xmm2,f32_1 ;1.0f
xorps xmm3,xmm3 ;0.0f
call glRotatef

;Camera Yaw
;glRotatef(getdrunk,0,0,1.0f);
movd xmm0,a_R3_XY
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

include 04_Object\TesseractCalcVert.asm
;include 04_Object\CameraRotate.asm
include 04_Object\TesseractDraw.asm

;======================

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
DrawGLScene endp