;INPUT:
;xmm0 = xCam
;xmm1 = yCam
;xmm2 = zCam

CheckDistance proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
;push rbp
;mov rbp,rsp

;Stack Alignment Are Not Necessaty because
;There are no further Calls in this Procedure
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer


;ToDo: Check if Distance is more than 1000 m


;add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
;leave
ret
CheckDistance endp

;OUTPUT:
;xmm0 = xCam
;xmm1 = yCam
;xmm2 = zCam
