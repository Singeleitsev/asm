

;x0 = x1
mov eax, dword [x1]
mov eax, dword [x0]
;y0 = y1
mov eax, dword [y1]
mov eax, dword [y0]

finit
;fld dword [A]
fsincos

fst dword [cosA]
fmul dword [x0]
fstp dword [x0cosA]

fst dword [sinA]
fmul dword [x0]
fstp dword [x0sinA]






3D Rotation Matrix: anti-clockwise order(xy,yz,zx)

;z-axis rotation
;x1 = x0*cosA-y0*sinA
;y1 = x0*sinA+y0*cosA
;z1 = z0

x-axis rotation
;x1 = x0
;y1 = y0*cosA-z0*sinA
;z1 = y0*sinA+z0*cosA

;y-axis rotation
;x1 = x0*cosA+z0*sinA
;y1 = y0
;z1 = -x0*sinA+z0*cosA

;4D Rotation Matrix: no clock order

;zw-axis rotation
;x1 = x0*cosA-y0*sinA
;y1 = x0*sinA+y0*cosA
;z1 = z0
;w1 = w0

;yw-axis rotation
;x1 = x0*cosA-z0*sinA
;y1 = y0
;z1 = x0*sinA+z0*cosA
;w1 = w0

;yz-axis rotation
;x1 = x0*cosA-w0*sinA
;y1 = y0
;z1 = z0
;w1 = x0*sinA+w0*cosA

;xw-axis rotation
;x1 = x0
;y1 = y0*cosA-z0*sinA
;z1 = y0*sinA+z0*cosA
;w1 = w0

;xz-axis rotation
;x1 = x0
;y1 = y0*cosA-w0*sinA
;z1 = z0
;w1 = y0*sinA+w0*cosA

;xy-axis rotation
;x1 = x0
;y1 = y0
;z1 = z0*cosA-w0*sinA
;w1 = z0*sinA+w0*cosA