InitCaps proc

;42dc0000h = 110.0 mm
;0c2dc0000 = -110.0 mm
;42f00000h = 120.0 mm
;0c2f00000h = -120.0 mm
;0c1200000h = -10.0 mm

;3f800000h = 1.0
;3f3504f3h = sin(45) = 0.70710678
;0bf3504f3h = sin(45) = -0.70710678

;0 - Top
invoke SetVN,00, 42dc0000h,42dc0000h,0, 0,0,3f800000h
invoke SetVN,01, 0c2dc0000h,42dc0000h,0, 0,0,3f800000h
invoke SetVN,02, 0c2dc0000h,0c2dc0000h,0, 0,0,3f800000h
invoke SetVN,03, 42dc0000h,0c2dc0000h,0, 0,0,3f800000h
;1 - North
invoke SetVN,04, 42f00000h,42f00000h,0c1200000h, 0,3f3504f3h,3f3504f3h
invoke SetVN,05, 0c2f00000h,42f00000h,0c1200000h, 0,3f3504f3h,3f3504f3h
invoke SetVN,06, 0c2dc0000h,42dc0000h,0, 0,3f3504f3h,3f3504f3h
invoke SetVN,07, 42dc0000h,42dc0000h,0, 0,3f3504f3h,3f3504f3h
;2 - West
invoke SetVN,08, 0c2f00000h,42f00000h,0c1200000h, 0bf3504f3h,0,3f3504f3h
invoke SetVN,09, 0c2f00000h,0c2f00000h,0c1200000h, 0bf3504f3h,0,3f3504f3h
invoke SetVN,10, 0c2dc0000h,0c2dc0000h,0, 0bf3504f3h,0,3f3504f3h
invoke SetVN,11, 0c2dc0000h,42dc0000h,0, 0bf3504f3h,0,3f3504f3h
;3 - South
invoke SetVN,12, 0c2f00000h,0c2f00000h,0c1200000h, 0,0bf3504f3h,3f3504f3h
invoke SetVN,13, 42f00000h,0c2f00000h,0c1200000h, 0,0bf3504f3h,3f3504f3h
invoke SetVN,14, 42dc0000h,0c2dc0000h,0, 0,0bf3504f3h,3f3504f3h
invoke SetVN,15, 0c2dc0000h,0c2dc0000h,0, 0,0bf3504f3h,3f3504f3h
;4 - East
invoke SetVN,16, 42f00000h,0c2f00000h,0c1200000h, 3f3504f3h,0,3f3504f3h
invoke SetVN,17, 42f00000h,42f00000h,0c1200000h, 3f3504f3h,0,3f3504f3h
invoke SetVN,18, 42dc0000h,42dc0000h,0, 3f3504f3h,0,3f3504f3h
invoke SetVN,19, 42dc0000h,0c2dc0000h,0, 3f3504f3h,0,3f3504f3h

xor eax,eax
ret
InitCaps endp