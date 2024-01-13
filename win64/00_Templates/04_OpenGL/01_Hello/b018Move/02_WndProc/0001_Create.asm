lbl_wmcreate:

;Select The Projection Matrix
mov rcx,1701h ;GL_PROJECTION
call glMatrixMode
;Reset The Projection Matrix
call glLoadIdentity

;Calculate The Aspect Ratio Of The Window
;gluPerspective(45.0f, (GLfloat)width / (GLfloat)height, 0.1f, 100.0f);
;movsd xmm0,dbl_45 ;45.0f
;movd xmm1,rc.right ;Use Scalar Double Instruction to load the Qword
;cvtdq2pd xmm1,xmm1 ;Convert the Qword Integer to Packed Double
;movd xmm2,rc.bottom ;Use Scalar Double Instruction to load the Qword
;cvtdq2pd xmm2,xmm2 ;Convert the Qword Integer to Packed Double
;divsd xmm1,xmm2
;movsd xmm2,dbl_TENTH ;0.1f
;movsd xmm3,dbl_100 ;100.0f
;call gluPerspective

;Select The ModelView Matrix
mov rcx,1700h ;GL_MODELVIEW
call glMatrixMode
;Reset The ModelView Matrix
call glLoadIdentity

;Define A Viewing Transformation
;gluLookAt(5.0f,5.0f,5.0f, 0.0f,0.0f,0.0f, 0.0f,1.0f,0.0f);
movsd xmm0,dbl_5 ;GLdouble eyeX = 5.0f
movsd xmm1,dbl_5 ;GLdouble eyeY = 5.0f
movsd xmm2,dbl_5 ;GLdouble eyeZ = 5.0f
mov qword ptr [rsp+20h],0 ;GLdouble centerX = 0.0
mov qword ptr [rsp+28h],0 ;GLdouble centerY = 0.0
mov qword ptr [rsp+30h],0 ;GLdouble centerZ = 0.0
mov qword ptr [rsp+38h],0 ;GLdouble upX = 0.0
movsd xmm3,dbl_1 ;GLdouble upY = 1.0
movsd qword ptr [rsp+40h],xmm3
mov qword ptr [rsp+48h],0 ;GLdouble upZ = 0.0
call gluLookAt

xor eax,eax
jmp lbl_finish

