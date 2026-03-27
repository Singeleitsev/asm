;Tolerance
;eps dd 38d1b717h ;epsilon = 1e-3 = f32_ONE_THOUSANDTH
eps dd 358637bdh ;epsilon = 1e-6 = f32_ONE_MILLIONTH
;eps dd 322bcc77h ;epsilon = 1e-8


align 16

;LineLine

; Case 1 – Intersection at (0.25, -0.5, 1)
; Line1: (-1.25, -1.5, 1.5) - (5.5, 3, -0.75)
; Line2: (3.75, -2.5, 2.5) - (-6.75, 3.5, -2)
x0_01 dd 0bfa00000h ; -1.25f
y0_01 dd 0bfc00000h ; -1.5f
z0_01 dd 3fc00000h ; 1.5f
w0_01 dd 0
x1_01 dd 40b00000h ; 5.5f
y1_01 dd 40400000h ; 3.0f
z1_01 dd 0bf400000h ; -0.75f
w1_01 dd 0
x2_01 dd 40700000h ; 3.75f
y2_01 dd 0c0200000h ; -2.5f
z2_01 dd 40200000h ; 2.5f
w2_01 dd 0
x3_01 dd 0c0d80000h ; -6.75f
y3_01 dd 40600000h ; 3.5f
z3_01 dd 0c0000000h ; -2.0f
w3_01 dd 0

; Case 2 - Skew lines
; Line1: (-1.25, -1.5, 1.5) - (5.5, 3, -0.75)
; Line2: (-0.5, 1.25, 0.75) - (2.5, 1.25, 0.75)
x0_02 dd 0bfa00000h ; -1.25f
y0_02 dd 0bfc00000h ; -1.5f
z0_02 dd 3fc00000h ; 1.5f
w0_02 dd 0
x1_02 dd 40b00000h ; 5.5f
y1_02 dd 40400000h ; 3.0f
z1_02 dd 0bf400000h ; -0.75f
w1_02 dd 0
x2_02 dd 0bf000000h ; -0.5f
y2_02 dd 3fa00000h ; 1.25f
z2_02 dd 3f400000h ; 0.75f
w2_02 dd 0
x3_02 dd 40200000h ; 2.5f
y3_02 dd 3fa00000h ; 1.25f
z3_02 dd 3f400000h ; 0.75f
w3_02 dd 0

;Case 3 – Collinear lines
;Line1: (-1.25, -1.5, 1.5) - (5.5, 3, -0.75)
;Line2: (12.25, 7.5, -3) - (19, 12, -5.25)
x0_03 dd 0bfa00000h ; -1.25f
y0_03 dd 0bfc00000h ; -1.5f
z0_03 dd 3fc00000h ; 1.5f
w0_03 dd 0
x1_03 dd 40b00000h ; 5.5f
y1_03 dd 40400000h ; 3.0f
z1_03 dd 0bf400000h ; -0.75f
w1_03 dd 0
x2_03 dd 41440000h ; 12.25f  (49/4)
y2_03 dd 40f00000h ; 7.5f     (30/4)
z2_03 dd 0c0400000h ; -3.0f   (-12/4)
w2_03 dd 0
x3_03 dd 41980000h ; 19.0f    (76/4)
y3_03 dd 41400000h ; 12.0f    (48/4)
z3_03 dd 0c0a80000h ; -5.25f  (-21/4)
w3_03 dd 0

; Case 4 – Parallel lines (distinct)
; Line1: (-1.25, -1.5, 1.5) - (5.5, 3, -0.75)
; Line2: (-1.25, 0.5, 1.5) - (5.5, 5.0, -0.75)
x0_04 dd 0bfa00000h ; -1.25f
y0_04 dd 0bfc00000h ; -1.5f
z0_04 dd 3fc00000h ; 1.5f
w0_04 dd 0
x1_04 dd 40b00000h ; 5.5f
y1_04 dd 40400000h ; 3.0f
z1_04 dd 0bf400000h ; -0.75f
w1_04 dd 0
x2_04 dd 0bfa00000h ; -1.25f
y2_04 dd 3f000000h ; 0.5f
z2_04 dd 3fc00000h ; 1.5f
w2_04 dd 0
x3_04 dd 40b00000h ; 5.5f
y3_04 dd 40a00000h ; 5.0f
z3_04 dd 0bf400000h ; -0.75f
w3_04 dd 0

; Case 5 – Near-parallel, numerically unstable (B1)
; Line1: (-1.25, -1.5, 1.5) - (5.5, 3, -0.75)
; Line2: (0, 0, 0) - (6.75, 4.5, -2.24)
x0_05 dd 0bfa00000h ; -1.25f
y0_05 dd 0bfc00000h ; -1.5f
z0_05 dd 3fc00000h ; 1.5f
w0_05 dd 0
x1_05 dd 40b00000h ; 5.5f
y1_05 dd 40400000h ; 3.0f
z1_05 dd 0bf400000h ; -0.75f
w1_05 dd 0
x2_05 dd 00000000h ; 0.0f
y2_05 dd 00000000h ; 0.0f
z2_05 dd 00000000h ; 0.0f
w2_05 dd 0
x3_05 dd 40d80000h ; 6.75f
y3_05 dd 40900000h ; 4.5f
z3_05 dd 0c01f5c29h ; -2.24f (approx hex for -2.24)
w3_05 dd 0

;PlaneLine

; Case 6 – Line goes through triangle (plane: z=0 triangle, line passes through interior)
; Plane points (z=0 triangle)
; P0: (0,0,0)
; P1: (1,0,0)
; P2: (0,1,0)
; Line from (0.5,0.5,1) to (0.5,0.5,-1)
x0_06 dd 00000000h ; 0.0f
y0_06 dd 00000000h ; 0.0f
z0_06 dd 00000000h ; 0.0f
w0_06 dd 0
x1_06 dd 3f800000h ; 1.0f
y1_06 dd 00000000h ; 0.0f
z1_06 dd 00000000h ; 0.0f
w1_06 dd 0
x2_06 dd 00000000h ; 0.0f
y2_06 dd 3f800000h ; 1.0f
z2_06 dd 00000000h ; 0.0f
w2_06 dd 0
x3_06 dd 3f000000h ; 0.5f
y3_06 dd 3f000000h ; 0.5f
z3_06 dd 3f800000h ; 1.0f
w3_06 dd 0
x4_06 dd 3f000000h ; 0.5f
y4_06 dd 3f000000h ; 0.5f
z4_06 dd 0bf800000h ; -1.0f
w4_06 dd 0

; Case 7 – Parallel
x0_07 dd 0
y0_07 dd 0
z0_07 dd 0
w0_07 dd 0
x1_07 dd 0
y1_07 dd 0
z1_07 dd 0
w1_07 dd 0
x2_07 dd 0
y2_07 dd 0
z2_07 dd 0
w2_07 dd 0
x3_07 dd 0
y3_07 dd 0
z3_07 dd 0
w3_07 dd 0
x4_07 dd 0
y4_07 dd 0
z4_07 dd 0
w4_07 dd 0
