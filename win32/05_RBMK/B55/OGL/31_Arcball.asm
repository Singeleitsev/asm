ArcballRotation proc
; Computes the arcball rotation
;from two unit vectors (VectorOld and VectorNew)
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
;xCam = y0 * z1 - z0 * y1
;yCam = z0 * x1 - x0 * z1
;zCam = x0 * y1 - y0 * x1
movaps xmm2,xmm0
shufps xmm2,xmm0,11001001b
movaps xmm3,xmm1
shufps xmm3,xmm1,11010010b
movaps xmm4,xmm0
shufps xmm4,xmm0,11010010b
movaps xmm5,xmm1
shufps xmm5,xmm1,11001001b
mulps xmm2,xmm3
mulps xmm4,xmm5
subps xmm2,xmm4 ;xmm2 = vecCam

;3. Dot product cosA = old * new
;cosA = x0 * x1 + y0 * y1 + z0 * z1
movaps xmm3,xmm0
mulps xmm3,xmm1
movaps xmm4,xmm3
shufps xmm4,xmm4,11111101b
movaps xmm5,xmm3
shufps xmm5,xmm5,11111110b
addss xmm4,xmm5
addss xmm3,xmm4 ;xmm3 = cosA
shufps xmm3,xmm3,0 ;broadcast cosA

;4. Magnitude of the cross product
;sinA = |vecCam| = Sqr(xCam * xCam + yCam * yCam + zCam * zCam)
movaps xmm4,xmm2
mulps xmm4,xmm4
movaps xmm5,xmm4
shufps xmm5,xmm5,11111101b
movaps xmm6,xmm4
shufps xmm6,xmm6,11111110b
addss xmm4,xmm5
addss xmm4,xmm6
sqrtss xmm4,xmm4 ;xmm4 = sinA
shufps xmm4,xmm4,0 ;broadcast sinA

;5. Degenerate case
;If sinA is too small, the rotation is
;either identity (cosA > 0) or 180 deg (cosA < 0)
;The latter has no defined axis from the cross product.
;Skip both for now.
comiss xmm4,eps
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

;Its transpose multiplied by (xCam, yCam, zCam) is:
;xWorld = m00 * xCam + m01 * yCam + m02 * zCam
;yWorld = m04 * xCam + m05 * yCam + m06 * zCam
;zWorld = m08 * xCam + m09 * yCam + m10 * zCam
movaps xmm5,xmm2
shufps xmm5,xmm5,00000000b ;Broadcast xCam
movaps xmm6,xmm2
shufps xmm6,xmm6,01010101b ;Broadcast yCam
movaps xmm7,xmm2
shufps xmm7,xmm7,10101010b ;Broadcast zCam

mulps xmm5,oword ptr[eax+00*4] ;m[00..03] * xCam
mulps xmm6,oword ptr[eax+04*4] ;m[04..07] * yCam
mulps xmm7,oword ptr[eax+08*4] ;m[08..11] * zCam

addps xmm5,xmm6
addps xmm5,xmm7 ;xmm5 = vecWorld

movaps xmm6,xmm5
shufps xmm6,xmm6,01010101b ;wy
movaps xmm7,xmm5
shufps xmm7,xmm7,10101010b ;wz

;8. Build the Rodrigues 3x3 rotation matrix (world space)
;c = cosA = xmm3
;s = sinA = xmm4
;t = 1 - cosA
movss xmm2,posOne
subss xmm2,xmm3 ;xmm2 = t
shufps xmm2,xmm2,0 ;broadcast t

;9. Compute Rodrigues and store Store in mtxArcball (column-major)
;[m00 m04 m08] <- [r00 r01 r02]
;[m01 m05 m09] <- [r10 r11 r12]
;[m02 m06 m10] <- [r20 r21 r22]
lea ecx,mtxArcball

;So memory layout is:
;mtxArcball(00) = R00 = t*wx*wx + c
;mtxArcball(01) = R10 = t*wx*wy + s*wz ;
;mtxArcball(02) = R20 = t*wx*wz - s*wy
;mtxArcball(03) = 0
;mtxArcball(04) = R01 = t*wx*wy - s*wz ;
;mtxArcball(05) = R11 = t*wy*wy + c
;mtxArcball(06) = R21 = t*wy*wz + s*wx
;mtxArcball(07) = 0
;mtxArcball(08) = R02 = t*wx*wz + s*wy
;mtxArcball(09) = R12 = t*wy*wz - s*wx
;mtxArcball(10) = R22 = t*wz*wz + c
;mtxArcball(11) = 0
;mtxArcball(12) = 0
;mtxArcball(13) = 0
;mtxArcball(14) = 0
;mtxArcball(15) = 1

movss xmm0,xmm2 ;t
mulss xmm0,xmm5 ;t*wx
movss dword ptr[ecx+00*4],xmm0 ;t*wx
movss dword ptr[ecx+02*4],xmm0 ;t*wx
mulss xmm0,xmm6 ;t*wx*wy
movss dword ptr[ecx+01*4],xmm0 ;t*wx*wy
movss xmm1,xmm4 ;s
mulss xmm1,xmm7 ;s*wz
subss xmm0,xmm1 ;t*wx*wy - s*wz
movss dword ptr[ecx+04*4],xmm0 ;Done
addss xmm1,dword ptr[ecx+01*4] ;t*wx*wy + s*wz
movss dword ptr[ecx+01*4],xmm1 ;Done

movss xmm0,dword ptr[ecx+02*4] ;t*wx
mulss xmm0,xmm7 ;t*wx*wz
movss dword ptr[ecx+08*4],xmm0 ;t*wx*wz
movss xmm1,xmm4 ;s
mulss xmm1,xmm6 ;s*wy
subss xmm0,xmm1 ;t*wx*wz - s*wy
movss dword ptr[ecx+02*4],xmm0 ;Done
addss xmm1,dword ptr[ecx+08*4] ;t*wx*wz + s*wy
movss dword ptr[ecx+08*4],xmm1 ;Done

movss xmm0,xmm5 ;wx
mulss xmm0,dword ptr[ecx+00*4] ;t*wx*wx
addss xmm0,xmm3 ;t*wx*wx + c
movss dword ptr[ecx+00*4],xmm0 ;Done

movss xmm0,xmm2 ;t
mulss xmm0,xmm6 ;t*wy
movss dword ptr[ecx+05*4],xmm0 ;t*wy
mulss xmm0,xmm7 ;t*wy*wz
movss dword ptr[ecx+06*4],xmm0 ;t*wy*wz
movss xmm1,xmm4 ;s
mulss xmm1,xmm5 ;s*wx
subss xmm0,xmm1 ;t*wy*wz - s*wx
movss dword ptr[ecx+09*4],xmm0 ;Done
addss xmm1,dword ptr[ecx+06*4] ;t*wy*wz + s*wx
movss dword ptr[ecx+06*4],xmm1 ;Done

movss xmm0,xmm6 ;wy
mulss xmm0,dword ptr[ecx+05*4] ;t*wy*wy
addss xmm0,xmm3 ;t*wy*wy + c
movss dword ptr[ecx+05*4],xmm0 ;Done

movss xmm0,xmm2 ;t
mulss xmm0,xmm7 ;t*wz
mulss xmm0,xmm7 ;t*wz*wz
addss xmm0,xmm3 ;t*wz*wz + c
movss dword ptr[ecx+10*4],xmm0 ;Done

mov dword ptr[ecx+07*4],0
mov dword ptr[ecx+11*4],0
mov dword ptr[ecx+12*4],0
mov dword ptr[ecx+13*4],0
mov dword ptr[ecx+14*4],0
movss xmm0,posOne
movss dword ptr[ecx+15*4],xmm0

jmp Success

;Failure
Degenerate:
mov eax,-1
ret

;Report Success
Success:
xor eax,eax
ret

ArcballRotation endp

