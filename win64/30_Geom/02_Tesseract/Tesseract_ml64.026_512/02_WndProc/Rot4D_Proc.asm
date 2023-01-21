
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

vbroadcastss zmm0, dword ptr [cosA]
vmovups zmm1, zmmword ptr [r10] ;x0...x15
vmulps zmm2,zmm1,zmm0 ;xi*cosA

lea r11,v1
add r11,rdx ;Load Second Coordinate

vbroadcastss zmm3, dword ptr [sinA]
vmovups zmm4, zmmword ptr [r11] ;y0...y7
vmulps zmm5,zmm4,zmm3 ;yi*sinA

vsubps zmm6,zmm4,zmm5 ;xi*cosA-yi*sinA

lea r12,v2
add r12,rcx ;Store First Coordinate

vmovups zmmword ptr [r12],zmm6 ;x0...x7

lea r13,v1
add r13,rcx ;Load First Coordinate

vbroadcastss zmm7, dword ptr [sinA]
vmovups zmm8, zmmword ptr [r13] ;x0...x7
vmulps zmm9,zmm8,zmm7 ;xi*sinA

lea r14,v1
add r14,rdx ;Load Second Coordinate

vbroadcastss ymm10, dword ptr [cosA]
vmovups zmm11, zmmword ptr [r14] ;y0...y7
vmulps zmm12,zmm11,zmm10 ;yi*cosA

vaddps zmm13,zmm11,zmm12 ;xi*sinA+yi*cosA

lea r15,v2
add r15,rdx ;Store First Coordinate

vmovups zmmword ptr [r15],zmm13 ;y0...y7

;pop rdi
;pop rsi
;pop rdx
;pop rcx

;leave   
ret

Rot4D_Proc endp
