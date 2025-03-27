;4D Rotation Matrix: no clock order

;zw-axis rotation
;x1 = x0*cosA-y0*sinA
;y1 = x0*sinA+y0*cosA
;z1 = z0
;w1 = w0

lea rcx,x4D ;xi
lea rdx,y4D ;yi
lea r8,da_R4_ZW ;Angle
call pRot4D ;Either Rot4D_256 or Rot4D_512

;yw-axis rotation
;x1 = x0*cosA-z0*sinA
;y1 = y0
;z1 = x0*sinA+z0*cosA
;w1 = w0

lea rcx,x4D ;xi
lea rdx,z4D ;zi
lea r8,da_R4_YW ;Angle
call pRot4D ;Either Rot4D_256 or Rot4D_512

;yz-axis rotation
;x1 = x0*cosA-w0*sinA
;y1 = y0
;z1 = z0
;w1 = x0*sinA+w0*cosA

lea rcx,x4D ;xi
lea rdx,w4D ;wi
lea r8,da_R4_YZ ;Angle
call pRot4D ;Either Rot4D_256 or Rot4D_512

;xw-axis rotation
;x1 = x0
;y1 = y0*cosA-z0*sinA
;z1 = y0*sinA+z0*cosA
;w1 = w0

lea rcx,y4D ;yi
lea rdx,z4D ;zi
lea r8,da_R4_XW ;Angle
call pRot4D ;Either Rot4D_256 or Rot4D_512

;xz-axis rotation
;x1 = x0
;y1 = y0*cosA-w0*sinA
;z1 = z0
;w1 = y0*sinA+w0*cosA

lea rcx,y4D ;yi
lea rdx,w4D ;wi
lea r8,da_R4_XZ ;Angle
call pRot4D ;Either Rot4D_256 or Rot4D_512

;xy-axis rotation
;x1 = x0
;y1 = y0
;z1 = z0*cosA-w0*sinA
;w1 = z0*sinA+w0*cosA

lea rcx,z4D ;z0
lea rdx,w4D ;w0
lea r8,da_R4_XY ;Angle
call pRot4D ;Either Rot4D_256 or Rot4D_512

