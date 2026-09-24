Pan proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION  
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;Point to the Camera Matrix
lea ecx,mtxCameraVolatile

;Load Mouse Deltas
cvtsi2ss xmm0,dxMouse
cvtsi2ss xmm1,dyMouse

;Pan Scale
mulss xmm0,PanSpeed
mulss xmm1,PanSpeed

;Fill all 4 xmm lanes
shufps xmm0,xmm0,0 ;dxMouse
shufps xmm1,xmm1,0 ;dyMouse

;Move Camera along its Local +x and +y Coordinates

;new[12] = old[12] + dxMouse*m00 - dyMouse*m08
;new[13] = old[13] + dxMouse*m01 - dyMouse*m09
;new[14] = old[14] + dxMouse*m02 - dyMouse*m10

movaps xmm2,oword ptr[ecx+0*4] ;xmm2 = m[00..03]
movaps xmm3,oword ptr[ecx+8*4] ;xmm3 = m[08..11]

mulps xmm0,xmm2 ;xmm2 = dxMouse*m[00..03]
mulps xmm1,xmm3 ;xmm3 = dyMouse*m[08..11]
subps xmm0,xmm1 ;xmm0 = xmm2 - xmm3

addps xmm0,oword ptr[ecx+12*4] ;xmm0 = old[12..15] + xmm0

;Store
movaps oword ptr[ecx+12*4],xmm0 ;new[12..15]

;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
Pan endp


