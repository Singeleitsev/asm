Geocentric proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

invoke MouseToVector, xMouseNew, yMouseNew, offset xVectorNew

call ArcballRotation
test eax,eax
jnz Geocentric_Fail

call ArcToCamera

invoke Mat4byMat4, offset mtxWorld, offset mtxObjectVolatile, offset mtxTemp

cld
lea esi,mtxTemp
lea edi,mtxObjectVolatile
mov ecx,16
rep movsd

jmp Geocentric_End

Geocentric_Fail:
invoke WriteLog,offset szErrGeocentric

Geocentric_End:
;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION  
;VectorOld <- VectorNew
SAVE_OLD_SPHERE_VECTOR

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0
ret

Geocentric endp


