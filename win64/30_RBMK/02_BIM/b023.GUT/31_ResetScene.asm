ResetScene proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;movss xmm0,f32_1
;movss xmm1,f32_1
;movss xmm2,f32_1
xorps xmm0,xmm0
xorps xmm1,xmm1
xorps xmm2,xmm2
xorps xmm3,xmm3
Call glClearColor

movsd xmm0,f64_THOUSANDTH
movsd GlobalScale64,xmm0

;Model Position
mov xTrans,0
mov yTrans,0
mov zTrans,0

;Model Angles
mov aXY,0
mov aYZ,0
mov aXZ,0

;Model Rotation Speed
mov eax,f32_5
mov dAngle32,eax

;Camera and Aim Position
mov rax,f64_neg6 ;x of Spawn Point
mov xCam,rax
mov rax,f64_3 ;Altitude
mov yCam,rax
mov rax,f64_neg6 ;y of Spawn Point
mov zCam,rax
mov xAim,0
mov yAim,0
mov zAim,0

;Camera Speed
movsd xmm0,GlobalScale64
mulsd xmm0,f64_100
movsd dStep,xmm0

Call CameraMove

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
ResetScene endp
