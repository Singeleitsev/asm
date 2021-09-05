;Alpha = Alpha+dA
fld dword [Alpha] ;st0 = Alpha
fadd dword [dA] ;st0 = Alpha+dA
fst dword [Alpha]
fst dword [p1.a] ;a1
fstp dword [p2.a] ;a2

;Beta = Alpha/2
fld dword [Alpha]
fdiv dword [two] ;<-- Spin
fstp dword [Beta]

;r1cosA, r1sinA
fld dword [Alpha]
fsincos ;st0 = cos(a) ;st1 = sin(a)
fmul dword [r1] ;st0 = r1*cos(a)
fstp dword [r1cosA]
fmul dword [r1] ;st0 = r1*sin(a)
fstp dword [r1sinA]

;r2cosB, r2sinB
fld dword [Beta]
fsincos ;st0 = cos(b) ;st1 = sin(b)
fmul dword [r2] ;st0 = r2*cos(b)
fstp dword [r2cosB]
fmul dword [r2] ;st0 = r2*sin(b)
fstp dword [r2sinB]

;x1 = r1*COS(Alpha)+r2*COS(Beta)
fld dword [r1cosA]
fadd dword [r2cosB]
fstp dword [p1.x] ;x1

;x2 = r1*COS(Alpha)-r2*COS(Beta)
fld dword [r1cosA]
fsub dword [r2cosB]
fstp dword [p2.x] ;x2

;y1 = r1*SIN(Alpha)
fld dword [r1sinA]
fst dword [p1.y] ;y1

;y2 = r1*SIN(Alpha)
fstp dword [p2.y] ;y2 = y1

;z1 = r2*SIN(Beta)
fld dword [r2sinB]
fstp dword [p1.z] ;z1

;z2 = -r2*SIN(Beta)
fldz
fsub dword [r2sinB]
fstp dword [p2.z] ;z2

