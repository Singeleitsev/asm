Orbit proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;dAngleX = dyMouse*MouseSensitivity  (pitch)
mov eax,dyMouse
cvtsi2ss xmm0,eax
mulss xmm0,MouseSensitivity
movss dAngleX,xmm0

;dAngleY = dxMouse*MouseSensitivity  (yaw)
mov eax,dxMouse
cvtsi2ss xmm0,eax
mulss xmm0,MouseSensitivity
movss dAngleY,xmm0

;sinX,cosX via x87
fld dAngleX
fmul PiOver180
fsincos
fstp cosX
fstp sinX

;sinY,cosY via x87
fld dAngleY
fmul PiOver180
fsincos
fstp cosY
fstp sinY



;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
Orbit endp


