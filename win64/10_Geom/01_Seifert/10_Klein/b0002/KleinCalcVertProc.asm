proc KleinCalcVertProc

locals
 cosV dd ?
 sinV dd ?
 v4x1cosV2 dd ?
 cosV2pi4 dd ?
 sinV2pi4 dd ?
 cosU dd ?
 sinU dd ?
endl

;Input: p address in rcx
mov r12,rcx ;p.x
add rcx,4
mov r13,rcx ;p.y
add rcx,4
mov r14,rcx ;p.z

finit

;Get Values


;cosV = COS(v)
;sinV = SIN(v)

fld dword [v]
fsincos
fst [cosV] ;do not pop
fdiv dword [two]
fstp dword [v4x1cosV2] ;Temporarily cosV/2
fstp [sinV]


;v4x1cosV2 = 4*(1-(cosV/2))

fld1
fsub dword [v4x1cosV2] ;1-cosV/2
fmul dword [four]
fstp dword [v4x1cosV2]


;cosV2pi4 = COS(v/2+45)
;sinV2pi4 = SIN(v/2+45)

fld dword [v]
fdiv dword [two]
fadd dword [c1pi4]
fsincos
fstp dword [cosV2pi4]
fstp dword [sinV2pi4]


;cosU = cos(u)
;sinU = sin(u)

fld dword [u]
fsincos
fstp [cosU]
fstp [sinU]


;x = 6*cosV*(1+sinV) + v4x1cosV2*cosV2pi4*cosU

fld1
fadd dword [sinV]
fmul dword [cosV]
fmul dword [six]
fstp dword [r12] ;Temporarily p.x

fld dword [v4x1cosV2]
fmul dword [cosV2pi4]
fmul dword [cosU]
fadd dword [r12]
fstp dword [r12]


;y = 16*sinV + v4x1cosV2*sinV2pi4*cosU

fld dword [c16]
fmul dword [sinV]
fstp dword [r13] ;Temporarily p.z

fld dword [v4x1cosV2]
fmul dword [sinV2pi4]
fmul dword [cosU]
fadd dword [r13]
;fchs ;Change Sign
fstp dword [r13]


;z = v4x1cosV2*sinU

fld dword [v4x1cosV2]
fmul dword [sinU]
fstp dword [r14]


;Scale

fld dword [r12]
fmul dword [s]
fstp dword [r12]

fld dword [r13]
fmul dword [s]
fstp dword [r13]

fld dword [r14]
fmul dword [s]
fstp dword [r14]


ret
endp

