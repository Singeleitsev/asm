Geocentric proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION

;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

invoke MouseToVector, xMouseNew, yMouseNew, offset xVectorNew

;call ArcballRotation

;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION  

;VectorOld <- VectorNew
SAVE_OLD_SPHERE_VECTOR

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
Geocentric endp


