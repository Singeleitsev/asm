finit

;Get Values

;Alpha EQU t

;r1cosT = r1*COS(t)
;r1sinT = r1*SIN(t)
fld dword [Alpha]
fsincos
fmul dword [r1]
fstp dword [r1cosT]
fmul dword [r1]
fstp dword [r1sinT]

;r2x2cosMT = r2*2*COS(m*t)
;r2x2sinMT = r2*2*SIN(m*t)
fld dword [Alpha]
fimul dword [m] ;integer
fsincos
fmul dword [two]
fmul dword [r2]
fstp dword [r2x2cosMT]
fmul dword [two]
fmul dword [r2]
fstp dword [r2x2sinMT]

;r2x2sinNT = r2*2*SIN(n*t)
fld dword [Alpha]
fimul dword [n] ;integer
fsin
fmul dword [two]
fmul dword [r2]
fstp dword [r2x2sinNT]

;Beta = n*t/2
fld dword [Alpha]
fimul dword [n] ;integer
fdiv dword [two]
fstp [Beta]

;r3cosB = r3*COS(Beta)
;r3sinB = r3*SIN(Beta)
fld dword [Beta]
fsincos
fmul dword [r3]
fstp [r3cosB]
fmul dword [r3]
fstp [r3sinB]

;Middle Line Coordinates

;x1 = r1cosT + r2x2cosMT
fld dword [r1cosT]
fadd dword [r2x2cosMT]
fst [p1.x]
fstp [p2.x]
;y1 = r1sinT - r2x2sinMT
fld dword [r1sinT]
fsub dword [r2x2sinMT]
fst [p1.y]
fstp [p2.y]
;z1 = r2x2sinNT
fld dword [r2x2sinNT]
fst [p1.z]
fstp [p2.z]

;Shift to Edges

;;x1L = x1 - r3cosB
;fld dword [p1.x]
;fsub dword [r3cosB]
;fstp dword [p1.x]
;;y1L = y1
;;nop
;;z1L = z1 - r3sinB
;fld dword [p1.z]
;fsub dword [r3sinB]
;fstp dword [p1.z]

;;x1R = x1 + r3cosB
;fld dword [p2.x]
;fadd dword [r3cosB]
;fstp dword [p2.x]
;;y1R = y1
;;nop
;;z1R = z1 + r3sinB
;fld dword [p2.z]
;fadd dword [r3sinB]
;fstp dword [p2.z]


