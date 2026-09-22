ResetScene proc

;1.1. Restore the Projection Matrix
cld
lea esi,mtxProjectionDefault
lea edi,mtxProjectionVolatile
mov ecx,16 ;16 dwords
rep movsd

;2.1. Restore the Camera Matrix
lea esi,mtxCameraDefault
lea edi,mtxCameraVolatile
mov ecx,16 ;16 dwords
rep movsd

;3.1. Restore the Object Matrix
lea esi,mtxObjectDefault
lea edi,mtxObjectVolatile
mov ecx,16 ;16 dwords
rep movsd

;4.1. Set the Flag to Make the Esc Key Work by the Rule:
;First Esc Hit - Set the Entire Scene to the Default Position
;Second Esc Hit - Close the Window
mov isInitialPosition,1

;4.2. Set the Flag to ReDraw the Scene
mov isRefreshed,0

ResetScene_End:
ret
ResetScene endp

