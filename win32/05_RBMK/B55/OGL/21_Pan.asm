Pan proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION  
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;Load Mouse Deltas
cvtsi2ss xmm0,dxMouse
mov eax,dyMouse
neg eax
cvtsi2ss xmm1,eax

;Pan Scale
mulss xmm0,PanSpeed
mulss xmm1,PanSpeed

;Save
movss PanMagnitudeX,xmm0
movss PanMagnitudeY,xmm1

;Move Camera along its Local +x and +y Coordinates
invoke CameraMove,PanMagnitudeX,0 ;0 is for Local x axis
invoke CameraMove,PanMagnitudeY,1 ;1 is for Local y axis

;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
Pan endp


