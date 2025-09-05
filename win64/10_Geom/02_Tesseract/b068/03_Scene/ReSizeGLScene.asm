;======================================================
ReSizeGLScene proc ;SceneWidth:QWORD, SceneHeight:QWORD
;======================================================

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;wView3D = min(wScreen/2,hScreen)
;hView3D = wView3D

;xView3D = 0
;yView3D =(hScreen-hView3D)/2

;wViewXY = min((wScreen-wView3D)/2,hScreen/3)
;hViewXY = wViewXY

;xViewXY = wView3D
;xViewXZ = xViewXY
;xViewXW = xViewXY

;xViewWY = wView3D + wViewXY
;xViewYZ = xViewWY
;xViewZW = xViewWY

;yViewXY =(hScreen-3*hViewXY)/2
;yViewWY = yViewXY

;yViewXZ = yViewXY+hViewXY
;yViewYZ = yViewXZ

;yViewXW = yViewXZ + hViewXY
;yViewZW = yViewXW

;Normal Exit

mov rax,1
add rsp,100h

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret
ReSizeGLScene endp

