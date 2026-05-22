;INPUT:
;xmm0 = xCam
;xmm1 = yCam
;xmm2 = zCam

CheckDistance proc

;Prologue:
push rbp
mov rbp,rsp

;Stack Alignment Are Not Necessaty because
;There are no further Calls in this Procedure
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer


;ToDo: Check if Distance is more than 1000 m


lbl_CheckDistance_End:
;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

;Epilogue:
leave
ret
CheckDistance endp

;OUTPUT:
;xmm0 = xCam
;xmm1 = yCam
;xmm2 = zCam
