
;=================
ReSizeGLScene proc
;=================

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx,g_hWnd
lea rdx,rc
call GetClientRect

xor rcx,rcx
xor rdx,rdx
xor r8,r8
mov r8d,rc.right
xor r9,r9
mov r9d,rc.bottom
call glViewport ;Reset The Current Viewport

;Select The Projection Matrix
mov rcx,1701h ;GL_PROJECTION
call glMatrixMode
;Reset The Projection Matrix
call glLoadIdentity

;;Calculate The Aspect Ratio Of The Window
;;gluPerspective(45.0f,(GLfloat)width/(GLfloat)height,0.1f,100.0f);
;movsd xmm0,aCam ;GLdouble aspect = 35.0
;movd xmm1,rc.right ;Load the Dword
;cvtdq2pd xmm1,xmm1 ;Convert the Dword Integer to Packed Double
;movd xmm2,rc.bottom ;Load the Dword
;cvtdq2pd xmm2,xmm2 ;Convert the Dword Integer to Packed Double
;divsd xmm1,xmm2
;movsd xmm2,f64_TENTH ;0.1f
;movsd xmm3,f64_100 ;100.0f
;call gluPerspective

movsd xmm0,f64_neg1 ;GLdouble left = -1.0
movsd xmm1,f64_1 ;GLdouble right = 1.0
movsd xmm3,f64_neg1 ;GLdouble bottom = -1.0
movsd xmm4,f64_1 ;GLdouble top = 1.0
movsd xmm8,f64_2 ;GLdouble zNear = 2.0f
movsd qword ptr [rsp+20h],xmm8
movsd xmm8,f64_5 ;GLdouble zFar = 5.0f
movsd qword ptr [rsp+28h],xmm8
call glFrustum

;Select The Modelview Matrix
mov rcx,1700h ;GL_MODELVIEW
call glMatrixMode
;Reset The Modelview Matrix
call glLoadIdentity

;;Define A Viewing Transformation
;;gluLookAt(5.0f,5.0f,5.0f, 0.0f,0.0f,0.0f, 0.0f,1.0f,0.0f);
;movsd xmm0,xCam ;GLdouble eyeX = 5.0
;movsd xmm1,yCam ;GLdouble eyeY = 5.0
;movsd xmm2,zCam ;GLdouble eyeZ = 5.0
;movsd xmm8,xAim ;GLdouble centerX = 0.0
;movsd qword ptr [rsp+20h],xmm8
;movsd xmm8,yAim ;GLdouble centerY = 0.0
;movsd qword ptr [rsp+28h],xmm8
;movsd xmm8,zAim ;GLdouble centerZ = 0.0
;movsd qword ptr [rsp+30h],xmm8
;mov qword ptr [rsp+38h],0 ;GLdouble upX = 0.0
;movsd xmm8,f64_1 ;GLdouble upY = 1.0
;movsd qword ptr [rsp+40h],xmm8
;mov qword ptr [rsp+48h],0 ;GLdouble upZ = 0.0
;call gluLookAt

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
ReSizeGLScene endp

