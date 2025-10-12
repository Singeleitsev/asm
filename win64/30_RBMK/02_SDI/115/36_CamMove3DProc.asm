CameraMove3D proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

movss xmm0,dxCam ;Keep dxCam in xmm0, not in Memory
movss xmm1,dyCam ;Keep dyCam in xmm1, not in Memory
movss xmm2,dzCam ;Keep dzCam in xmm2, not in Memory

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
;dyCam1 = dyCam0 * cosA - dzCam0 * sinA
movss xmm5,xmm1 ;dyCam0
mulss xmm5,cosA
movss xmm6,xmm2 ;dzCam0
mulss xmm6,sinA
subss xmm5,xmm6
;dzCam1 = dyCam0 * sinA + dzCam0 * cosA
movss xmm7,xmm1 ;dyCam0
mulss xmm7,sinA
movss xmm8,xmm2 ;dzCam0
mulss xmm8,cosA
addss xmm7,xmm8
;Store Results
;movss xmm0,xmm3 ;dxCam1
movss xmm1,xmm5 ;dyCam1
movss xmm2,xmm7 ;dzCam1

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
movss xmm3,xmm0 ;dxCam1
mulss xmm3,cosA
movss xmm4,xmm1 ;dyCam1
mulss xmm4,sinA
subss xmm3,xmm4
;dyCam2 = dxCam1 * sinA + dyCam1 * cosA
movss xmm5,xmm0 ;dxCam1
mulss xmm5,sinA
movss xmm6,xmm1 ;dyCam1
mulss xmm6,cosA
addss xmm5,xmm6
;dzCam2 = dzCam1
;Store Results
movss xmm0,xmm3 ;dxCam2
movss xmm1,xmm5 ;dyCam2
;movss xmm2,xmm7 ;dzCam2

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
movss xmm3,xmm0 ;dxCam2
mulss xmm3,cosA
movss xmm4,xmm2 ;dzCam2
mulss xmm4,sinA
addss xmm3,xmm4
;dyCam3 = dyCam2
;dzCam3 = dzCam2 * cosA - dxCam2 * sinA
movss xmm7,xmm2 ;dzCam2
mulss xmm7,cosA
movss xmm8,xmm0 ;dxCam2
mulss xmm8,sinA
subss xmm7,xmm8
;Store Results
movss xmm0,xmm3 ;dxCam3
;movss xmm1,xmm5 ;dyCam3
movss xmm2,xmm7 ;dzCam3

;Add Translation Vector dCam to Position Vector Cam
;xCam = dxCam3 + xCam
addss xmm0,xCam
movss xCam,xmm0
;yCam = dyCam3 + yCam
addss xmm1,yCam
movss yCam,xmm1
;zCam = dzCam3 + zCam
addss xmm2,zCam
movss zCam,xmm2

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
CameraMove3D endp

