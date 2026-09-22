;CameraWalk
;Moves the camera along one of its own axes by a signed
;distance, updating the translation column of mtxCameraVolatile.
;Parameters (stdcall):
; axis:
;  0 = local X (right)
;  1 = local Y (up)
;  2 = local Z (forward/back)
; distance: signed REAL4, in world units

;------------------------------------------------------------
;Camera convention for this project:
;- Camera looks along world +y (not the OpenGL default -z)
;- Camera is tilted down slightly (~ -z component)
;- "Forward" in the code = the camera's own forward axis,
;  which corresponds to matrix column indices 2,6,10 here.
;- Pressing Up walks the camera forward; on screen the
;  world appears to move backward. That is intended.
;------------------------------------------------------------
;x|00|10|20|30| |x|00|04|08|12|
;y|01|11|21|31| |y|01|05|09|13|
;z|02|12|22|32| |z|02|06|10|14|
;w|03|13|23|33| |w|03|07|11|15|

CameraWalk proc distance:REAL4, axis:DWORD

;1. Compute the Chosen Axis offset
mov eax,axis
shl eax,2 ;axis_index * 4 bytes

;2. Point to the Camera Matrix
lea ecx,mtxCameraVolatile

;3. Compute the Chosen Axis address
add eax,ecx

;4. Load the three components, scale each by distance.
movss xmm0,distance
movss xmm1,xmm0
movss xmm2,xmm0

;5. world = distance * column[axis]

;dx_world = dStep * mtxCameraVolatile(0i)
mulss xmm0,dword ptr[eax+0*4]
;dy_world = dStep * mtxCameraVolatile(1i)
mulss xmm1,dword ptr[eax+4*4]
;dz_world = dStep * mtxCameraVolatile(2i)
mulss xmm2,dword ptr[eax+8*4]

;6. Do the full basis transform

;Accumulate world-space displacement
;xmm3 = xmm0*m00 + xmm1*m10 + xmm2*m20
;xmm4 = xmm0*m01 + xmm1*m11 + xmm2*m21
;xmm5 = xmm0*m02 + xmm1*m12 + xmm2*m22

;dx contributes to world via column 0
;m00
movss xmm6,xmm0
mulss xmm6,dword ptr[ecx+0*4]
movss xmm3,xmm6
;m01
movss xmm6,xmm0
mulss xmm6,dword ptr[ecx+1*4]
movss xmm4,xmm6
;m02
movss xmm6,xmm0
mulss xmm6,dword ptr[ecx+2*4]
movss xmm5,xmm6

;dy contributes via column 1
;m10
movss xmm6,xmm1
mulss xmm6,dword ptr[ecx+4*4]
addss xmm3,xmm6
;m11
movss xmm6,xmm1
mulss xmm6,dword ptr[ecx+5*4]
addss xmm4,xmm6
;m12
movss xmm6,xmm1
mulss xmm6,dword ptr[ecx+6*4]
addss xmm5,xmm6

;dz contributes via column 2
;m20
movss xmm6,xmm2
mulss xmm6,dword ptr[ecx+8*4]
addss xmm3,xmm6
;m21
movss xmm6,xmm2
mulss xmm6,dword ptr[ecx+9*4]
addss xmm4,xmm6
;m22
movss xmm6,xmm2
mulss xmm6,dword ptr[ecx+10*4]
addss xmm5,xmm6

;7. Add to the Translation Column

;dx_local (index 12, member 30)
addss xmm3,dword ptr[ecx+12*4]
movss dword ptr[ecx+12*4],xmm3
;dy_local (index 13, member 31)
addss xmm4,dword ptr[ecx+13*4]
movss dword ptr[ecx+13*4],xmm4
;dz_local (index 14, member 32)
addss xmm5,dword ptr[ecx+14*4]
movss dword ptr[ecx+14*4],xmm5

CameraWalk_End:
mov isInitialPosition,0
mov isRefreshed,0
ret
CameraWalk endp


