ArcballRotation proc
;Computes the arcball rotation
;from two unit vectors (vecOld and vecNew)
;on the virtual sphere, expressed in Camera's Local Coordinates
;and produces a 3x3 rotation matrix in WORLD coordinates
;stored in mtxArcball.
;Assumes the camera's 3x3 block (columns 0,1,2 of mtxCameraVolatile)
;is orthonormal, so its transpose is its inverse.
;Returns True on success, False on degenerate (skip rotation).

;1. Read the two unit vectors
movaps xmm0,oword ptr[xVectorOld]
movaps xmm1,oword ptr[xVectorNew]

;2. Cross product vecCam = vecOld * vecNew
;xCam = y0*z1 - z0*y1
;yCam = z0*x1 - x0*z1
;zCam = x0*y1 - y0*x1
movaps xmm2,xmm0 ;vecOld
shufps xmm2,xmm2,11001001b
movaps xmm3,xmm1 ;vecNew
shufps xmm3,xmm3,11010010b
movaps xmm4,xmm0 ;vecOld
shufps xmm4,xmm4,11010010b
movaps xmm5,xmm1 ;vecNew
shufps xmm5,xmm5,11001001b
mulps xmm2,xmm3
mulps xmm4,xmm5
subps xmm2,xmm4 ;xmm2 = vecCam

;3. Dot product cosA = old * new
;cosA = x0*x1 + y0*y1 + z0*z1
movaps xmm3,xmm0 ;vecOld
mulps xmm3,xmm1 ;vecNew
movaps xmm4,xmm3
shufps xmm4,xmm4,00111001b ;rotate right
addss xmm3,xmm4
shufps xmm4,xmm4,00111001b ;rotate right
addss xmm3,xmm4 ;xmm3 = cosA
shufps xmm3,xmm3,0 ;broadcast cosA

;4. Magnitude of the cross product
;sinA = |vecCam| = Sqr(xCam*xCam + yCam*yCam + zCam*zCam)
movaps xmm4,xmm2 ;vecCam
mulps xmm4,xmm4
movaps xmm5,xmm4
shufps xmm5,xmm5,00111001b ;rotate right
addss xmm4,xmm5
shufps xmm5,xmm5,00111001b ;rotate right
addss xmm4,xmm5
sqrtss xmm4,xmm4 ;xmm4 = sinA
shufps xmm4,xmm4,0 ;broadcast sinA

;5. Degenerate case
;If sinA is too small, the rotation is
;either identity (cosA > 0) or 180 deg (cosA < 0)
;The latter has no defined axis from the cross product.
;Skip both for now.
comiss xmm4,eps ;Compare against epsilon
jb Degenerate

;6. Normalize the axis
;xCam = xCam / sinA
;yCam = yCam / sinA
;zCam = zCam / sinA
divps xmm2,xmm4

;7. Transform axis from CAMERA-LOCAL to WORLD
;vecWorld = M_camera_3x3_transpose * vecCam

;In memory (column-major), mtxCameraVolatile's columns are:
;[m00 m04 m08]
;[m01 m05 m09]
;[m02 m06 m10]
lea eax,mtxCameraVolatile

;Its transpose multiplied by vecCam is:
;xWorld = m00*xCam + m01*yCam + m02*zCam
;yWorld = m04*xCam + m05*yCam + m06*zCam
;zWorld = m08*xCam + m09*yCam + m10*zCam

movaps xmm5,xmm2 ;Normalized vecCam
movaps xmm6,xmm2 ;Normalized vecCam
movaps xmm7,xmm2 ;Normalized vecCam

mulps xmm5,oword ptr[eax+00*4] ;components of xw
mulps xmm6,oword ptr[eax+04*4] ;components of xy
mulps xmm7,oword ptr[eax+08*4] ;components of xz

movaps xmm0,xmm5 ;components of xw
movaps xmm1,xmm5
shufps xmm1,xmm1,00111001b ;rotate right
addss xmm0,xmm1
shufps xmm1,xmm1,00111001b ;rotate right
addss xmm0,xmm1
movss xmm5,xmm0
shufps xmm5,xmm5,0 ;broadcast xw

movaps xmm0,xmm6 ;components of yw
movaps xmm1,xmm6
shufps xmm1,xmm1,00111001b ;rotate right
addss xmm0,xmm1
shufps xmm1,xmm1,00111001b ;rotate right
addss xmm0,xmm1
movss xmm6,xmm0 ;yw
shufps xmm6,xmm6,0 ;broadcast yw

movaps xmm0,xmm7 ;components of zw
movaps xmm1,xmm7
shufps xmm1,xmm1,00111001b ;rotate right
addss xmm0,xmm1
shufps xmm1,xmm1,00111001b ;rotate right
addss xmm0,xmm1
movss xmm7,xmm0 ;zw
shufps xmm7,xmm7,0 ;broadcast zw

;8. Load vecWorld to xmm0
;Comment style: little-endian
xorps xmm0,xmm0
movss xmm0,xmm5 ;xmm0 = 0,0,0,xw
shufps xmm0,xmm0,00111001b ;rotate right
movss xmm0,xmm6 ;xmm0 = xw,0,0,yw
shufps xmm0,xmm0,00111001b ;rotate right
movss xmm0,xmm7 ;xmm0 = yw,xw,0,zw
shufps xmm0,xmm0,01001110b ;xmm0 = 0,zw,yw,xw

;9. Build the Rodrigues 3x3 rotation matrix (world space)
;t = 1 - cosA
movss xmm2,posOne
shufps xmm2,xmm2,0 ;broadcast posOne
subss xmm2,xmm3
shufps xmm2,xmm2,0 ;broadcast t

;10. Compute Rodrigues and store Store in mtxArcball (column-major)
;[m00 m04 m08] <- [r00 r01 r02]
;[m01 m05 m09] <- [r10 r11 r12]
;[m02 m06 m10] <- [r20 r21 r22]
lea ecx,mtxArcball

;So memory layout is:
;mtxArcball(00) = R00 = t*xw*xw+cosA
;mtxArcball(01) = R10 = t*xw*yw+sinA*zw
;mtxArcball(02) = R20 = t*xw*zw-sinA*yw
;mtxArcball(03) = 0
;mtxArcball(04) = R01 = t*yw*xw-sinA*zw
;mtxArcball(05) = R11 = t*yw*yw+cosA
;mtxArcball(06) = R21 = t*yw*zw+sinA*xw
;mtxArcball(07) = 0
;mtxArcball(08) = R02 = t*zw*xw+sinA*yw
;mtxArcball(09) = R12 = t*zw*yw-sinA*xw
;mtxArcball(10) = R22 = t*zw*zw+cosA
;mtxArcball(11) = 0
;mtxArcball(12) = 0
;mtxArcball(13) = 0
;mtxArcball(14) = 0
;mtxArcball(15) = 1

;Initial state:
;Comment style: little-endian

;xmm0 = 0,zw,yw,xw 
;xmm1 = free (junk)
;xmm2 = t,t,t,t
;xmm3 = cosA,cosA,cosA,cosA
;xmm4 = sinA,sinA,sinA,sinA
;xmm5 = xw,xw,xw,xw
;xmm6 = yw,yw,yw,yw
;xmm7 = zw,zw,zw,zw

mulps xmm0,xmm2 ;0,t*zw,t*yw,t*xw
movaps xmm1,xmm0 ;0,t*zw,t*yw,t*xw
movaps xmm2,xmm0 ;0,t*zw,t*yw,t*xw

mulps xmm0,xmm5 ;0,t*zw*xw,t*yw*xw,t*xw*xw
mulps xmm1,xmm6 ;0,t*zw*yw,t*yw*yw,t*xw*yw
mulps xmm2,xmm7 ;0,t*zw*zw,t*yw*zw,t*xw*zw

mulss xmm5,xmm4 ;?,?,?,sinA*xw
mulss xmm6,xmm4 ;?,?,?,sinA*yw
mulss xmm7,xmm4 ;?,?,?,sinA*zw

addss xmm0,xmm3 ;0,t*zw*xw,t*yw*xw,t*xw*xw+cosA
movss dword ptr[ecx+00*4],xmm0
shufps xmm0,xmm0,00111001b ;a00,0,t*zw*xw,t*yw*xw
subss xmm0,xmm7 ;a00,0,t*zw*xw,t*yw*xw-sinA*zw
movss dword ptr[ecx+04*4],xmm0
shufps xmm0,xmm0,00111001b ;a04,a00,0,t*zw*xw
addss xmm0,xmm6 ;a04,a00,0,t*zw*xw+sinA*yw
movss dword ptr[ecx+08*4],xmm0

addss xmm1,xmm7 ;0,t*zw*yw,t*yw*yw,t*xw*yw+sinA*zw
movss dword ptr[ecx+01*4],xmm1
shufps xmm1,xmm1,00111001b ;a01,0,t*zw*yw,t*yw*yw
addss xmm1,xmm3 ;a01,0,t*zw*yw,t*yw*yw+cosA
movss dword ptr[ecx+05*4],xmm1
shufps xmm1,xmm1,00111001b ;a05,a01,t*zw*yw
subss xmm1,xmm5 ;a05,a01,t*zw*yw-sinA*xw
movss dword ptr[ecx+09*4],xmm1

subss xmm2,xmm6 ;0,t*zw*zw,t*yw*zw,t*xw*zw-sinA*yw
movss dword ptr[ecx+02*4],xmm2
shufps xmm2,xmm2,00111001b ;a02,0,t*zw*zw,t*yw*zw
addss xmm2,xmm5 ;a02,0,t*zw*zw,t*yw*zw+sinA*xw
movss dword ptr[ecx+06*4],xmm2
shufps xmm2,xmm2,00111001b ;a06,a02,0,t*zw*zw
addss xmm2,xmm3 ;a06,a02,0,t*zw*zw+cosA
movss dword ptr[ecx+10*4],xmm2

jmp Success

;Failure
Degenerate:
invoke WriteLog,offset szErrArcball
mov eax,-1
ret

;Report Success
Success:
xor eax,eax
ret

ArcballRotation endp

