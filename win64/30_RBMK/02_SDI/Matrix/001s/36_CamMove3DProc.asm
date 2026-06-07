CameraMove3D proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

movss xmm0,dxCam ;Keep dxCam in xmm0, not in Memory
movss xmm1,dyCam ;Keep dyCam in xmm1, not in Memory
movss xmm2,dzCam ;Keep dzCam in xmm2, not in Memory
;xmm3 = Buffer for dxCam
;xmm4 = Buffer for dyCam
;xmm5 = Buffer for dzCam
;In Each Block of Coordinate Calculations,
;Only 2 of 3 Registers are Used to Store Deltas
;The Remaining Resister is Used as a Buffer

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
;xmm3 = xmm0
;No Calculations
;Using xmm3 as a Buffer
;dyCam1 = dyCam0 * cosA - dzCam0 * sinA
movss xmm4,xmm1 ;dyCam0
mulss xmm4,cosA
movss xmm3,xmm2 ;dzCam0
mulss xmm3,sinA
subss xmm4,xmm3
;dzCam1 = dyCam0 * sinA + dzCam0 * cosA
movss xmm5,xmm1 ;dyCam0
mulss xmm5,sinA
movss xmm3,xmm2 ;dzCam0
mulss xmm3,cosA
addss xmm5,xmm3
;Store Results
;movss xmm0,xmm3 ;dxCam1
movss xmm1,xmm4 ;dyCam1
movss xmm2,xmm5 ;dzCam1

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
movss xmm5,xmm1 ;dyCam1
mulss xmm5,sinA
subss xmm3,xmm5
;dyCam2 = dxCam1 * sinA + dyCam1 * cosA
movss xmm4,xmm0 ;dxCam1
mulss xmm4,sinA
movss xmm5,xmm1 ;dyCam1
mulss xmm5,cosA
addss xmm4,xmm5
;dzCam2 = dzCam1
;xmm5 = xmm2
;No Calculations
;Using xmm5 as a Buffer
;Store Results
movss xmm0,xmm3 ;dxCam2
movss xmm1,xmm4 ;dyCam2
;movss xmm2,xmm5 ;dzCam2

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
;xmm4 = xmm1
;No Calculations
;Using xmm4 as a Buffer
;dzCam3 = dzCam2 * cosA - dxCam2 * sinA
movss xmm5,xmm2 ;dzCam2
mulss xmm5,cosA
movss xmm4,xmm0 ;dxCam2
mulss xmm4,sinA
subss xmm5,xmm4
;Store Results
movss xmm0,xmm3 ;dxCam3
;movss xmm1,xmm4 ;dyCam3
movss xmm2,xmm5 ;dzCam3

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

;Epilogue:
leave
ret
CameraMove3D endp


