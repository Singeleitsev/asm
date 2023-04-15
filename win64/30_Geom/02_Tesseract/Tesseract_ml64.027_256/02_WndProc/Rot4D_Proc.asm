
;Shifts of Addresses for the Affected Coordinates:
;From 'TesseractCalcVert.asm'
;[x0] = 0, [y0] = 40h, [z0] = 80h, [w0] = 0Ch

;In0: rcx = Shift of Address for the First Affected Coordinate. Address = [v1]+rcx
;In1: rdx = Shift of Address for the Second Affected Coordinate. Address = [v1]+rdx
;In2: r8 = Angle of Rotation, Degrees
;Out:  Filled Array of Affected Coordinates, v2

;======================================================
Rot4D_Proc proc uses rcx rdx r8 r10 r11 r12 r13 r14 r15
;======================================================

;push rbp
;mov rbp,rsp

;Align the Stack by 10h
;sub rsp,8

;push rcx
;push rdx
;push rsi
;push rdi

finit
fld dword ptr [r8] ;Angle
fsincos
fstp dword ptr [cosA]
fstp dword ptr [sinA]

lea r10,v1
add r10,rcx ;Load First Coordinate

vbroadcastss ymm0, dword ptr [cosA]
vmovups ymm1, ymmword ptr [r10] ;x0...x7
vmulps ymm2,ymm1,ymm0 ;xi*cosA
vmovups ymm3, ymmword ptr [r10+20h] ;x8...x15
vmulps ymm4,ymm3,ymm0 ;xi*cosA

lea r11,v1
add r11,rdx ;Load Second Coordinate

vbroadcastss ymm5, dword ptr [sinA]
vmovups ymm6, ymmword ptr [r11] ;y0...y7
vmulps ymm7,ymm6,ymm5 ;yi*sinA
vmovups ymm8, ymmword ptr [r11+20h] ;y8...y15
vmulps ymm9,ymm8,ymm5 ;yi*sinA

vsubps ymm10,ymm2,ymm7 ;xi*cosA-yi*sinA
vsubps ymm11,ymm4,ymm9 ;xi*cosA-yi*sinA

lea r12,v2
add r12,rcx ;Store First Coordinate

vmovups ymmword ptr [r12],ymm10 ;x0...x7
vmovups ymmword ptr [r12+20h],ymm11 ;x8...x15

lea r13,v1
add r13,rcx ;Load First Coordinate

;vbroadcastss ymm5, dword ptr [sinA]
vmovups ymm1, ymmword ptr [r13] ;x0...x7
vmulps ymm2,ymm1,ymm5 ;xi*sinA
vmovups ymm3, ymmword ptr [r13+20h] ;x8...x15
vmulps ymm4,ymm3,ymm5 ;xi*sinA

lea r14,v1
add r14,rdx ;Load Second Coordinate

;vbroadcastss ymm0, dword ptr [cosA]
vmovups ymm6, ymmword ptr [r14] ;y0...y7
vmulps ymm7,ymm6,ymm0 ;yi*cosA
vmovups ymm8, ymmword ptr [r14+20h] ;y8...y15
vmulps ymm9,ymm8,ymm0 ;yi*cosA

vaddps ymm10,ymm2,ymm7 ;xi*sinA+yi*cosA
vaddps ymm11,ymm4,ymm9 ;xi*sinA+yi*cosA

lea r15,v2
add r15,rdx ;Store First Coordinate

vmovups ymmword ptr [r15],ymm10 ;y0...y7
vmovups ymmword ptr [r15+20h],ymm11 ;y8...y15

;pop rdi
;pop rsi
;pop rdx
;pop rcx

;leave   
ret

Rot4D_Proc endp
