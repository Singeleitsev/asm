finit

;Get Values

;cosU = COS(u)
;sinU = SIN(u)
fld dword [u]
fsincos
fst [cosU] ;do not pop
fdiv dword [two]
fstp dword [v4x1cosU2] ;Temporarily cosU/2
fstp [sinU]

;v4x1cosU2 = 1-(cosU/2)
fld1
fsub dword [v4x1cosU2] ;1-cosU/2
fmul dword [four]
fstp dword [v4x1cosU2]

;cosU2pi4 = COS(U/2+45)
;sinU2pi4 = SIN(U/2+45)
fld dword [u]
fdiv dword [two]
fadd dword [c1pi4]
fsincos
fstp dword [cosU2pi4]
fstp dword [sinU2pi4]

;cosV = cos(v)
;sinV = sin(v)
fld dword [v]
fsincos
fstp [cosV]
fstp [sinV]

;x1 = 6*cosU*(1+sinU) + v4x1cosU2*cosV*cosU2pi4
fld1
fadd dword [sinU]
fmul dword [cosU]
fmul dword [six]
fstp dword [p1.x] ;Temporarily

fld dword [v4x1cosU2]
fmul dword [cosV]
fmul dword [cosU2pi4]
fadd dword [p1.x]
fstp dword [p1.x]

;y1 = 16*sinU + v4x1cosU2*sinU2pi4*cosV
fld dword [c16]
fmul dword [sinU]
fstp dword [p1.y] ;Temporarily

fld dword [v4x1cosU2]
fmul dword [sinU2pi4]
fmul dword [cosV]
fadd dword [p1.y]
fstp dword [p1.y]

;z1 = v4x1cosU2*sinV
fld dword [v4x1cosU2]
fmul dword [sinV]
fstp dword [p1.z]



