ResetScene proc
PROLOG 100h

;1.1. Restore the Projection Matrix
cld
lea rsi,mtxProjectionDefault
lea rdi,mtxProjectionVolatile
mov rcx,8 ;8 qwords
rep movsq

;1.2. Restore the Camera Matrix
lea rsi,mtxCameraDefault
lea rdi,mtxCameraVolatile
mov rcx,8 ;8 qwords
rep movsq

;1.3. Restore the Object Matrix
lea rsi,mtxObjectDefault
lea rdi,mtxObjectVolatile
mov rcx,8 ;8 qwords
rep movsq

;2.1. Set the Flag to Make the Esc Key Work by the Rule:
;First Esc Hit - Set the Entire Scene to the Default Position
;Second Esc Hit - Close the Window
mov isInitialPosition,1

;2.2. Set the Flag to ReDraw the Scene
mov isRefreshed,0

ResetScene_End:
EPILOG
ResetScene endp


