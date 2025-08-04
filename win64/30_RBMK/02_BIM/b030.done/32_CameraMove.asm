CameraMove proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx,1700h ;GL_MODELVIEW
Call glMatrixMode

Call glLoadIdentity

movss xmm0,f32_neg90
xorps xmm1,xmm1
xorps xmm2,xmm2
movss xmm3,f32_1
Call glRotatef ;(-90, 0, 0, 1)

movss xmm0,f32_neg90
xorps xmm1,xmm1
movss xmm2,f32_1
xorps xmm3,xmm3
Call glRotatef ;(-90, 0, 1, 0)

movss xmm0,aXY_Model
xorps xmm1,xmm1
xorps xmm2,xmm2
movss xmm3,f32_1
Call glRotatef ;(aXY, 0, 0, 1)

movss xmm0,xTrans
movss xmm1,yTrans
movss xmm2,zTrans
Call glTranslatef ;(xTrans, yTrans, zTrans)

movss xmm0,GlobalScale32
movss xmm1,GlobalScale32
movss xmm2,GlobalScale32
Call glScalef ;(GlobalScale, GlobalScale, GlobalScale)

mov rcx,1701h ;GL_PROJECTION
Call glMatrixMode

Call glLoadIdentity

movsd xmm0,f64_90
movsd xmm1,RectAspect
movsd xmm2,f64_TENTH
movsd xmm3,f64_1000
Call gluPerspective ;(90, RectAspect, 0.1, 1000)

movsd xmm0,xCam
movsd xmm1,yCam
movsd xmm2,zCam
movsd xmm3,xAim
mov qword ptr rax,yAim
mov qword ptr [rsp+20h],rax
mov qword ptr rax,zAim
mov qword ptr [rsp+28h],rax
mov qword ptr [rsp+30h],0
mov qword ptr rax,f64_1
mov qword ptr [rsp+38h],rax
mov qword ptr [rsp+40h],0
Call gluLookAt ;(xCam, yCam, zCam, xAim, yAim, zAim, 0, 1, 0)

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
CameraMove endp