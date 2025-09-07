;=============
Rot4D_All proc
;=============

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

;Since this Proc doesn't call further Proc's
;There is no need for the Stack Alignment
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

;4D Rotation Matrix: no clock order

;zw-HyperAxis rotation
;x1 = x0*cosA-y0*sinA
;y1 = x0*sinA+y0*cosA
;z1 = z0
;w1 = w0

lea rcx,x4D ;xi
lea rdx,y4D ;yi
lea r8,da_R4_ZW ;Angle
call pRot4D_One ;Either Rot4D_One_256 or Rot4D_512

;yw-HyperAxis rotation
;x1 = x0*cosA-z0*sinA
;y1 = y0
;z1 = x0*sinA+z0*cosA
;w1 = w0

lea rcx,x4D ;xi
lea rdx,z4D ;zi
lea r8,da_R4_YW ;Angle
call pRot4D_One ;Either Rot4D_One_256 or Rot4D_512

;yz-HyperAxis rotation
;x1 = x0*cosA-w0*sinA
;y1 = y0
;z1 = z0
;w1 = x0*sinA+w0*cosA

lea rcx,x4D ;xi
lea rdx,w4D ;wi
lea r8,da_R4_YZ ;Angle
call pRot4D_One ;Either Rot4D_One_256 or Rot4D_512

;xw-HyperAxis rotation
;x1 = x0
;y1 = y0*cosA-z0*sinA
;z1 = y0*sinA+z0*cosA
;w1 = w0

lea rcx,y4D ;yi
lea rdx,z4D ;zi
lea r8,da_R4_XW ;Angle
call pRot4D_One ;Either Rot4D_One_256 or Rot4D_512

;xz-HyperAxis rotation
;x1 = x0
;y1 = y0*cosA-w0*sinA
;z1 = z0
;w1 = y0*sinA+w0*cosA

lea rcx,y4D ;yi
lea rdx,w4D ;wi
lea r8,da_R4_XZ ;Angle
call pRot4D_One ;Either Rot4D_One_256 or Rot4D_512

;xy-HyperAxis rotation
;x1 = x0
;y1 = y0
;z1 = z0*cosA-w0*sinA
;w1 = z0*sinA+w0*cosA

lea rcx,z4D ;z0
lea rdx,w4D ;w0
lea r8,da_R4_XY ;Angle
call pRot4D_One ;Either Rot4D_One_256 or Rot4D_512

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret

Rot4D_All endp

