Geocentric proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION  
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;Rotating the Object with the mouse
;The full arcball: sphere mapping, cross product, Rodrigues, pre-multiply

;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION  

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
Geocentric endp


