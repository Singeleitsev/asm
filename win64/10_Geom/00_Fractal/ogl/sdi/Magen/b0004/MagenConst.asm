;Numeric Constants
two dd 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0
three dd 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0, 3.0

;Attractor Vertices
A00 CustomPoint 0.5, 0.0, -0.5, 0.0, 1.0, 0.0, 0.0, 0.0 ;Red
A01 CustomPoint 0.5, 0.5, -0.5, 0.0, 1.0, 0.5, 0.0, 0.0 ;Orange
A02 CustomPoint 0.0, 0.5, -0.5, 0.0, 1.0, 1.0, 0.0, 0.0 ;Yellow
A03 CustomPoint -0.5, 0.5, -0.5, 0.0, 0.0, 1.0, 0.0, 0.0 ;Green
A04 CustomPoint -0.5, 0.0, -0.5, 0.0, 0.0, 1.0, 1.0, 0.0 ;Cyan
A05 CustomPoint -0.5, -0.5, -0.5, 0.0, 0.0, 0.0, 1.0, 0.0 ;Blue
A06 CustomPoint 0.0, -0.5, -0.5, 0.0, 0.5, 0.0, 1.0, 0.0 ;Magenta
A07 CustomPoint 0.5, -0.5, -0.5, 0.0, 1.0, 0.0, 0.5, 0.0 ;Pink

A08 CustomPoint 0.5, 0.5, 0.0, 0.0, 1.0, 0.5, 0.0, 0.0 ;Orange
A09 CustomPoint -0.5, 0.5, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0 ;Green
A10 CustomPoint -0.5, -0.5, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0 ;Blue
A11 CustomPoint 0.5, -0.5, 0.0, 0.0, 1.0, 0.0, 0.5, 0.0 ;Pink

A12 CustomPoint 0.5, 0.0, 0.5, 0.0, 1.0, 0.0, 0.0, 0.0 ;Red
A13 CustomPoint 0.5, 0.5, 0.5, 0.0, 1.0, 0.5, 0.0, 0.0 ;Orange
A14 CustomPoint 0.0, 0.5, 0.5, 0.0, 1.0, 1.0, 0.0, 0.0 ;Yellow
A15 CustomPoint -0.5, 0.5, 0.5, 0.0, 0.0, 1.0, 0.0, 0.0 ;Green
A16 CustomPoint -0.5, 0.0, 0.5, 0.0, 0.0, 1.0, 1.0, 0.0 ;Cyan
A17 CustomPoint -0.5, -0.5, 0.5, 0.0, 0.0, 0.0, 1.0, 0.0 ;Blue
A18 CustomPoint 0.0, -0.5, 0.5, 0.0, 0.5, 0.0, 1.0, 0.0 ;Magenta
A19 CustomPoint 0.5, -0.5, 0.5, 0.0, 1.0, 0.0, 0.5, 0.0 ;Pink

;CutPlane is Defined by 3 points: A00, A09, A18
;A00
;x1 dd 0.5
;y1 dd 0.0
;z1 dd -0.5
;A09
;x2 dd -0.5
;y2 dd 0.5
;z2 dd 0.0
;A18
;x3 dd 0.0
;y3 dd -0.5
;z3 dd 0.5

;Quotients for Plane Equation
;A = y1*(z2-z3) + y2*(z3-z1) + y3*(z1-z2) = 0.75
;B = z1*(x2-x3) + z2*(x3-x1) + z3*(x1-x2) = 0.75
;C = x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2) = 0.75
;D = x1*(y3*z2 - y2*z3) + x2*(y1*z3 - y3*z1) + x3*(y2*z1 - y1*z2) = 0

;Normal Vector N = (A,B,C) = (0.75,0.75,0.75)
N CustomPoint 0.75, 0.75, 0.75, 0.0, 0.0, 0.0, 0.0, 0.0
nX CustomPoint 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
nY CustomPoint 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
nZ CustomPoint 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0
nX1 CustomPoint 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
nY1 CustomPoint 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
nZ1 CustomPoint 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0
nX2 CustomPoint 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
nY2 CustomPoint 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
nZ2 CustomPoint 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0





