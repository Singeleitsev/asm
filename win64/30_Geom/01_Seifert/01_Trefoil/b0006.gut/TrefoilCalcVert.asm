finit
;Get Values

;cos(t), sin(t)
fld dword [Alpha]
fsincos
fmul dword [r1] ;Custom Scale
fstp dword [cosT]
fmul dword [r1] ;Custom Scale
fstp dword [sinT]

;2*cos(2*t), 2*sin(2*t)
fld dword [Alpha]
fmul dword [two]
fsincos
fmul dword [two]
fmul dword [r1] ;Custom Scale
fstp dword [v2cos2T]
fmul dword [r1] ;Custom Scale
fmul dword [two]
fstp dword [v2sin2T]

;r2*cos(1.5*t), r2*sin(1.5*t)
fld dword [Alpha]
fmul dword [c1_5]
fsincos
fmul dword [r2]
fstp dword [r2cos3T2]
fmul dword [r2]
fstp dword [r2sin3T2]

;-sin(3*t)
fldz
fld dword [Alpha]
fmul dword [three]
fsin
fsub st0,st1 ;st0 = st0-st1
fmul dword [r1] ;Custom Scale
fstp [v_sin3T]

;Get Coordinates

;x1 = sin(t)+2*sin(2*t)+r2*cos(1.5*t)
fld dword [sinT]
fadd dword [v2sin2T]
fadd dword [r2cos3T2]
fstp dword [p1.x] ;x1

;x2 = sin(t)+2*sin(2*t)-r2*cos(1.5*t)
fld dword [sinT]
fadd dword [v2sin2T]
fsub dword [r2cos3T2]
fstp dword [p2.x] ;x1

;y1 = y2 = cos(t)-2*cos(2*t)
fld dword [cosT]
fsub dword [v2cos2T]
fst dword [p1.y] ;y1
fstp dword [p2.y] ;y2

;z1 = -sin(3*t) + r2*sin(1.5*t)
fld dword [v_sin3T]
fadd dword [r2sin3T2]
fstp dword [p1.z] ;z1

;z2 = -sin(3*t) - r2*sin(1.5*t)
fld dword [v_sin3T]
fsub dword [r2sin3T2]
fstp dword [p2.z] ;z2


