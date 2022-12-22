
;Store Previous Values
;x0 = x1
mov eax, dword [x1]
mov eax, dword [x0]
;y0 = y1
mov eax, dword [y1]
mov eax, dword [y0]
;z0 = z1
mov eax, dword [z1]
mov eax, dword [z0]

;3D Rotation Matrix: anti-clockwise order(xy,yz,zx)
finit

;z-axis rotation
;x1 = x0*cosA-y0*sinA
;y1 = x0*sinA+y0*cosA
;z1 = z0

fld dword [a3D_Rxy]
fsincos
fmul dword [x0]
fstp dword [x0cosA]
fmul dword [y0]
fstp dword [y0sinA]
fld dword [x0cosA]
fsub dword [y0sinA]
fstp dword [x1]

fld dword [a3D_Rxy]
fsincos
fmul dword [y0]
fstp dword [y0cosA]
fmul dword [x0]
fst dword [x0sinA]
fadd dword [y0cosA]
fstp dword [y1]

;x-axis rotation
;x1 = x0
;y1 = y0*cosA-z0*sinA
;z1 = y0*sinA+z0*cosA

fld dword [a3D_Ryz]
fsincos
fmul dword [y0]
fstp dword [y0cosA]
fmul dword [z0]
fstp dword [z0sinA]
fld dword [y0cosA]
fsub dword [z0sinA]
fstp dword [y1]

fld dword [a3D_Rxy]
fsincos
fmul dword [z0]
fstp dword [z0cosA]
fmul dword [y0]
fst dword [y0sinA]
fadd dword [z0cosA]
fstp dword [z1]

;y-axis rotation
;x1 = x0*cosA+z0*sinA
;y1 = y0
;z1 = -x0*sinA+z0*cosA

fld dword [a3D_Rxz]
fsincos
fmul dword [x0]
fstp dword [x0cosA]
fmul dword [z0]
fst dword [z0sinA]
fadd dword [x0cosA]
fstp dword [x1]

fld dword [a3D_Rxz]
fsincos
fmul dword [z0]
fstp dword [z0cosA]
fmul dword [x0]
fstp dword [x0sinA]
fld dword [z0cosA]
fsub dword [x0sinA]
fstp dword [z1]

;4D Rotation Matrix: no clock order
finit

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