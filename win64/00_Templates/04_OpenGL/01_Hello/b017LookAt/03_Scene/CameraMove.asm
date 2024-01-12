;==============
CameraMove proc
;==============

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Select The Projection Matrix
mov rcx,1701h ;GL_PROJECTION
call glMatrixMode
;Reset The Projection Matrix
call glLoadIdentity

mov rcx,g_hWnd
lea rdx,rc
call GetClientRect

;Calculate The Aspect Ratio Of The Window
;gluPerspective(45.0f, (GLfloat)width / (GLfloat)height, 0.1f, 100.0f);
movsd xmm0,dbl_45 ;45.0f
movd xmm1,rc.right ;Load the Dword
cvtdq2pd xmm1,xmm1 ;Convert the Dword Integer to Packed Double
movd xmm2,rc.bottom ;Load the Dword
cvtdq2pd xmm2,xmm2 ;Convert the Dword Integer to Packed Double
divsd xmm1,xmm2
movsd xmm2,dbl_TENTH ;0.1f
movsd xmm3,dbl_100 ;100.0f
call gluPerspective

;Select The ModelView Matrix
mov rcx,1700h ;GL_MODELVIEW
call glMatrixMode
;Reset The ModelView Matrix
call glLoadIdentity

;Define A Viewing Transformation
;gluLookAt(5.0f,5.0f,5.0f, 0.0f,0.0f,0.0f, 0.0f,1.0f,0.0f);
movsd xmm0,dbl_5 ;GLdouble eyeX = 5.0
movsd xmm1,dbl_5 ;GLdouble eyeY = 5.0
movsd xmm2,dbl_5 ;GLdouble eyeZ = 5.0

;movsd xmm7,dbl_TENTH ;GLdouble centerX = 0.1
;movsd qword ptr [rsp+20h],xmm7 ;GLdouble centerX = 0.1

mov qword ptr [rsp+20h],0 ;GLdouble centerX = 0.0
mov qword ptr [rsp+28h],0 ;GLdouble centerY = 0.0
mov qword ptr [rsp+30h],0 ;GLdouble centerZ = 0.0
mov qword ptr [rsp+38h],0 ;GLdouble upX = 0.0
movsd xmm7,dbl_1 ;GLdouble upY = 1.0
movsd qword ptr [rsp+40h],xmm7
mov qword ptr [rsp+48h],0 ;GLdouble upZ = 0.0
call gluLookAt

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
CameraMove endp

