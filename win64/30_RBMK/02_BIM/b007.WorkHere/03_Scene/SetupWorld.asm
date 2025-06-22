
;==============
SetupWorld proc
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

;Scale 1 to 200
movsd xmm0,f64_neg200 ;GLdouble left = -200.0
movsd xmm1,f64_200 ;GLdouble right = 200.0
movsd xmm2,f64_neg200 ;GLdouble bottom = -200.0
movsd xmm3,f64_200 ;GLdouble top = 200.0
movsd xmm8,f64_neg200 ;GLdouble zNear = -200.0f
movsd qword ptr [rsp+20h],xmm8
movsd xmm9,f64_200 ;GLdouble zFar = 200.0f
movsd qword ptr [rsp+28h],xmm9
call glOrtho
;;Don't forget to
;;Set zTrans = 0.0f
;;in SetupWorld

;movsd xmm0,f64_neg12000 ;GLdouble left = -12000.0
;movsd xmm1,f64_12000 ;GLdouble right = 12000.0
;movsd xmm2,f64_neg12000 ;GLdouble bottom = -12000.0
;movsd xmm3,f64_12000 ;GLdouble top = 12000.0
;movsd xmm8,f64_40000 ;GLdouble zNear = 40000.0f
;movsd qword ptr [rsp+20h],xmm8
;movsd xmm9,f64_60000 ;GLdouble zFar = 60000.0f
;movsd qword ptr [rsp+28h],xmm9
;call glFrustum
;;Don't forget to
;;Set zTrans = -30000.0f
;;in SetupWorld

mov eax,f32_45
mov aYZ,eax ;Camera Pitch
mov aXY,eax ;Camera Yaw
mov aXZ,0 ;Camera Roll

mov xTrans,0
mov yTrans,0
mov zTrans,0 ;For glOrtho Mode
;mov eax,f32_neg_30000 ;For glFrustum Mode
;mov zTrans,eax


;include 04_Object\RBMKInit.asm


;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
SetupWorld endp


