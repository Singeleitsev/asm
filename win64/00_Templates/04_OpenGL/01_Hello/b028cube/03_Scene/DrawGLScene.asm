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

;glRotatef(lookupdown,1.0f,0,0);
movd xmm0,aYZ
movd xmm1,f32_1 ;1.0f
xorps xmm2,xmm2 ;0.0f
xorps xmm3,xmm3 ;0.0f
call glRotatef

;glRotatef(sceneroty,0,1.0f,0);
movd xmm0,aXY
xorps xmm1,xmm1 ;0.0f
movd xmm2,f32_1 ;1.0f
xorps xmm3,xmm3 ;0.0f
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

