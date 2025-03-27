;==============
InitCamera proc
;==============

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

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

mov eax,f32_45
mov a_R3_YZ,eax ;Camera Pitch
mov a_R3_XZ,0 ;Camera Roll - Need to Correct WSAD Camera Control
mov a_R3_XY,eax ;Camera Yaw

mov x3D_Trans,0
mov y3D_Trans,0
mov z3D_Trans,0 ;For glOrtho Mode
;mov eax,f32_neg_1 ;For glFrustum Mode
;mov z3D_Trans,eax

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
InitCamera endp