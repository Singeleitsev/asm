;invoke glBegin,GL_TRIANGLE_STRIP
invoke glBegin,GL_QUAD_STRIP

mov [Alpha],0

mov esi,[resol] ;Number of Vertices
mov [i],esi
inc [i] ;Extra Step

.MoebiusDrawTriangle:

 include 'MoebiusCalcVert.asm'
 include 'MoebiusCalcColor.asm'

 invoke glColor3f, float dword [p1.r], float dword [p1.g], float dword [p1.b]
 invoke glVertex3f, float dword [p1.x], float dword [p1.y], float dword [p1.z]
 ;invoke glColor3f, float dword [p2.r], float dword [p2.g], float dword [p2.b]
 invoke glVertex3f, float dword [p2.x], float dword [p2.y], float dword [p2.z]

;Alpha = Alpha+dA
 finit
 fld dword [Alpha] ;st0 = Alpha
 fadd dword [dA] ;st0 = Alpha+dA
 fstp dword [Alpha]

 dec [i]
 cmp [i],0
 jg .MoebiusDrawTriangle

invoke glEnd

