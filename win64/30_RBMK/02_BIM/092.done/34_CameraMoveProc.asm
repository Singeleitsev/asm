CameraMove proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;RotX - Tilt
;aRad = -aYZ_Cam * PI_OVER_180 'Negative Angle
;cosA = Cos(aRad)
;sinA = Sin(aRad)
fld aYZ_Cam
fchs
fmul f32_PI_OVER_180
fsincos
fstp cosA
fstp sinA
;dxCam1 = dxCam0
mov eax,dxCam0
mov dxCam1,eax
;dyCam1 = dyCam0 * cosA - dzCam0 * sinA
movss xmm0,dyCam0
mulss xmm0,cosA
movss xmm1,dzCam0
mulss xmm1,sinA
subss xmm0,xmm1
movss dyCam1,xmm0
;dzCam1 = dyCam0 * sinA + dzCam0 * cosA
movss xmm0,dyCam0
mulss xmm0,sinA
movss xmm1,dzCam0
mulss xmm1,cosA
addss xmm0,xmm1
movss dzCam1,xmm0

;RotZ - Turn
;aRad = -aXY_Cam * PI_OVER_180 'Negative Angle
;cosA = Cos(aRad)
;sinA = Sin(aRad)
fld aXY_Cam
fchs
fmul f32_PI_OVER_180
fsincos
fstp cosA
fstp sinA
;dxCam2 = dxCam1 * cosA - dyCam1 * sinA
movss xmm0,dxCam1
mulss xmm0,cosA
movss xmm1,dyCam1
mulss xmm1,sinA
subss xmm0,xmm1
movss dxCam2,xmm0
;dyCam2 = dxCam1 * sinA + dyCam1 * cosA
movss xmm0,dxCam1
mulss xmm0,sinA
movss xmm1,dyCam1
mulss xmm1,cosA
addss xmm0,xmm1
movss dyCam2,xmm0
;dzCam2 = dzCam1
mov eax,dzCam1
mov dzCam2,eax

;RotY - Roll
;aRad = -aXZ_Cam * PI_OVER_180 'Negative Angle
;cosA = Cos(aRad)
;sinA = Sin(aRad)
fld aXZ_Cam
fchs
fmul f32_PI_OVER_180
fsincos
fstp cosA
fstp sinA
;dxCam3 = dxCam2 * cosA + dzCam2 * sinA
movss xmm0,dxCam2
mulss xmm0,cosA
movss xmm1,dzCam2
mulss xmm1,sinA
addss xmm0,xmm1
movss dxCam3,xmm0
;dyCam3 = dyCam2
mov eax,dyCam2
mov dyCam3,eax
;dzCam3 = dzCam2 * cosA - dxCam2 * sinA
movss xmm0,dzCam2
mulss xmm0,cosA
movss xmm1,dxCam2
mulss xmm1,sinA
subss xmm0,xmm1
movss dzCam3,xmm0

;Move
;xCam = xCam + dxCam3
movss xmm0,xCam
addss xmm0,dxCam3
movss xCam,xmm0
;yCam = yCam + dyCam3
movss xmm1,yCam
addss xmm1,dyCam3
movss yCam,xmm1
;zCam = zCam + dzCam3
movss xmm2,zCam
addss xmm2,dzCam3
movss zCam,xmm2

Call CheckDistance

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
CameraMove endp
