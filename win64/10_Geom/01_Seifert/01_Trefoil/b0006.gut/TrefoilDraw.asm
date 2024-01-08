;AngleStep = 360/n = 2*pi/n
finit
fldpi ;st0 = pi
fmul dword [two] ;st0 = 2*pi
;fidiv because n is an integer
fidiv dword [n] ;st0 = 2*pi/n
fstp dword [dA] ;dA = st0

invoke glBegin,GL_TRIANGLE_STRIP

mov rsi,[n] ;Number of Vertices
mov [i],rsi
inc [i] ;Extra Step

.TrefoilDrawTriangle:

 include 'TrefoilCalcVert.asm'
 include 'TrefoilCalcColor.asm'

 invoke glColor3f, float dword [p1.r], float dword [p1.g], float dword [p1.b]
 invoke glVertex3f, float dword [p1.x], float dword [p1.y], float dword [p1.z]
 ;invoke glColor3f, float dword [p2.r], float dword [p2.g], float dword [p2.b] ;Not needed - Color is the same as [p1]
 invoke glVertex3f, float dword [p2.x], float dword [p2.y], float dword [p2.z]

;Alpha = Alpha+dA
finit
fld dword [Alpha]
fadd dword [dA]
fst dword [Alpha]
;fst dword [p1.a] ;a1
;fstp dword [p2.a] ;a2

 dec [i]
 cmp [i],0
 jg .TrefoilDrawTriangle

invoke glEnd

