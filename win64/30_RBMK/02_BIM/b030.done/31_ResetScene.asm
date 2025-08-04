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
mov eax,f32_45
mov aXY_Model,eax
;mov aYZ_Model,0
;mov aXZ_Model,0

;Model Rotation Speed
mov eax,f32_1
mov dAngle32,eax

;Camera and Aim Position
mov rax,f64_neg7p5 ;x of Spawn Point
mov xCam,rax
mov rax,f64_2 ;Altitude = 3 meters
mov yCam,rax
mov zCam,0 ;y of Spawn Point
mov xAim,0
mov yAim,0
mov zAim,0

;Camera Speed
movsd xmm0,GlobalScale64
mulsd xmm0,f64_100
movsd dStep64,xmm0

Call CameraMove

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
ResetScene endp
