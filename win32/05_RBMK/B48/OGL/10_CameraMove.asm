ComputeWalkMagnitude proc direction:REAL4

movss xmm0,WalkSpeed

cmp byte ptr[key+10h],0 ;Shift
je SetDirection
mulss xmm0,WalkBoost

SetDirection:
mulss xmm0,direction
movss WalkMagnitude,xmm0

ret
ComputeWalkMagnitude endp




;Move the camera along one of its own axes
;with specified speed, sign of speed is direction
;affecting mtxCameraVolatile
;Parameters (stdcall):
; speed: signed REAL4, either -1.0 or 1.0
; axis:
;  0 = Model +x = OpenGL +x
;  1 = Model +y = OpenGL -z
;  2 = Model +z = OpenGL +y

CameraMove proc magnitude:REAL4, axis:DWORD

;1. Load the Speed (signed)
movss xmm0,magnitude
movss xmm1,xmm0
movss xmm2,xmm0

;2. Compute the Chosen Axis offset
mov eax,axis
shl eax,2 ;axis_index * 4 bytes

;3. Point to the Camera Matrix
lea ecx,mtxCameraVolatile

;4. Compute the Chosen Axis address
add eax,ecx

;5. Compute the Displacement
;x|00|04|08|12|
;y|01|05|09|13|
;z|02|06|10|14|
;w|03|07|11|15|

;5.1 Local Displacement

;dx_local = dStep * m[axis+0]
;dy_local = dStep * m[axis+4]
;dz_local = dStep * m[axis+8]

mulss xmm0,dword ptr[eax+0*4]
mulss xmm1,dword ptr[eax+4*4]
mulss xmm2,dword ptr[eax+8*4]

;5.2. Fill all 4 xmm lanes
shufps xmm0,xmm0,0 ;dx_local
shufps xmm1,xmm1,0 ;dy_local
shufps xmm2,xmm2,0 ;dz_local

;5.3. Accumulate world-space displacement

;dx contributes to world via column 0
;dy contributes to world via column 1
;dz contributes to world via column 2

;dx_world = dx_local*m00 + dy_local*m04 + dz_local*m08
;dy_world = dx_local*m01 + dy_local*m05 + dz_local*m09
;dz_world = dx_local*m02 + dy_local*m06 + dz_local*m10

movaps xmm3,oword ptr[ecx+0*4] ;old[00..03]
movaps xmm4,oword ptr[ecx+4*4] ;old[04..07]
movaps xmm5,oword ptr[ecx+8*4] ;old[08..11]

mulps xmm0,xmm3
mulps xmm1,xmm4
mulps xmm2,xmm5

addps xmm0,xmm1
addps xmm0,xmm2

;5.4. Add to the Translation Column

;x_world = x_world + dx_world
;y_world = y_world + dy_world
;z_world = z_world + dz_world

movaps xmm6,oword ptr[ecx+12*4] ;old[12..15]
addps xmm0,xmm6

;5.5. Store the computed values
movaps oword ptr[ecx+12*4],xmm0

;6. Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
CameraMove endp


