CameraMoveStraightProc proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;Straight Walk
;dxCamY = dStep * sin(aXY_Cam * f32_PI_OVER_180)
;dyCamY = dStep * cos(aXY_Cam * f32_PI_OVER_180)
fld aXY_Cam
fmul f32_PI_OVER_180
fsincos
fmul dStep
fstp dyCam ;cos to dy
fmul dStep
fstp dxCam ;sin to dx

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
CameraMoveStraightProc endp

CameraMoveSideProc proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;Side Walk
;dxCamX = dStep * sin((360-aXY_Cam) * f32_PI_OVER_180)
;dyCamX = dStep * cos((360-aXY_Cam) * f32_PI_OVER_180)
fld f32_360
fsub aXY_Cam
fmul f32_PI_OVER_180
fsincos
fmul dStep
fstp dxCam ;cos to dx
fmul dStep
fstp dyCam ;sin to dy

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
CameraMoveSideProc endp