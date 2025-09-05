;==============
DrawViewXW proc
;==============

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

;Reset The Current Viewport
;Reset The Current Viewport
xor rcx,rcx
xor rdx,rdx
xor r8,r8
xor r9,r9
mov ecx,xViewXW
mov edx,yViewXW
mov r8d,wViewXW
mov r9d,hViewXW
call glViewport

mov rcx,1701h ;GL_PROJECTION
call glMatrixMode
call glLoadIdentity

;Scale 1 to 1
movsd xmm0,f64_neg2 ;GLdouble left = -1.0
movsd xmm1,f64_2 ;GLdouble right = 1.0
movsd xmm2,f64_neg2 ;GLdouble bottom = -1.0
movsd xmm3,f64_2 ;GLdouble top = 1.0
movsd xmm8,f64_neg2 ;GLdouble zNear = -1.0f
movsd qword ptr [rsp+20h],xmm8
movsd xmm9,f64_2 ;GLdouble zFar = 1.0f
movsd qword ptr [rsp+28h],xmm9
call glOrtho
;;Don't forget to
;;Set z3D_Trans = 0.0f

;movsd xmm0,f64_neg1 ;GLdouble left = -1.0
;movsd xmm1,f64_1 ;GLdouble right = 1.0
;movsd xmm2,f64_neg1 ;GLdouble bottom = -1.0
;movsd xmm3,f64_1 ;GLdouble top = 1.0
;movsd xmm8,f64_4 ;GLdouble zNear = 4.0f
;movsd qword ptr [rsp+20h],xmm8
;movsd xmm9,f64_6 ;GLdouble zFar = 6.0f
;movsd qword ptr [rsp+28h],xmm9
;call glFrustum ;GL_PROJECTION
;;Don't forget to
;;Set zTrans = -1.0f

mov rcx,1700h ;GL_MODELVIEW
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
movd xmm0,x3D_Trans
movd xmm1,y3D_Trans
movd xmm2,z3D_Trans
call glTranslatef

;Describe Geometry Here
;======================
call TesseractDraw
;======================

;mov rcx,g_hDC
;call SwapBuffers ;Double Buffering

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
DrawViewXW endp
