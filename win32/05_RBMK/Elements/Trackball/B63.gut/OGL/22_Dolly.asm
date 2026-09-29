Dolly proc wParam:DWORD

;Mouse Wheel sends either +120 or -120
;Depending on Wheel Rotating Direction
;Extract the Mouse Wheel Delta
mov eax,wParam
shr eax,16
movsx eax,ax

;Convert to float and store
cvtsi2ss xmm0,eax

mulss xmm0,DollySpeed

;Store the result
movss DollyMagnitude,xmm0

invoke CameraMove,DollyMagnitude,2 ;2 is for Camera's Local z axis

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
Dolly endp


