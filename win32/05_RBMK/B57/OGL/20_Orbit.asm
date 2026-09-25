Orbit proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

invoke MouseToVector, xMouseNew, yMouseNew, offset xVectorNew

call ArcballRotation
test eax,eax
jnz Orbit_Fail

invoke Mat4byMat4, offset mtxArcball, offset mtxCameraVolatile, offset mtxTemp

cld
lea esi,mtxTemp
lea edi,mtxCameraVolatile
mov ecx,16
rep movsd

jmp Orbit_End

Orbit_Fail:
invoke WriteLog,offset szErrOrbit

Orbit_End:
;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION
;VectorOld <- VectorNew
SAVE_OLD_SPHERE_VECTOR
;Set Flags
mov isInitialPosition,0
mov isRefreshed,0
ret
Orbit endp


