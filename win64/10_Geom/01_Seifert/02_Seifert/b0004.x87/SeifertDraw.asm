;invoke glBegin,GL_POINTS
invoke glBegin,GL_LINE_STRIP
;invoke glBegin,GL_TRIANGLE_STRIP

mov [Alpha],0

mov esi,[resol] ;Number of Vertices
mov [i],esi
add [i],2 ;Extra Steps

.SeifertDrawTriangle:

 include 'SeifertCalcVert.asm'
 include 'SeifertCalcColor.asm'

 invoke glColor3f, float dword [p1.r], float dword [p1.g], float dword [p1.b]
 invoke glVertex3f, float dword [p1.x], float dword [p1.y], float dword [p1.z]
;Not needed - Color is the same as [p1]
 ;invoke glColor3f, float dword [p2.r], float dword [p2.g], float dword [p2.b] 
 ;invoke glVertex3f, float dword [p2.x], float dword [p2.y], float dword [p2.z]

;Alpha = Alpha+dA
 finit
 fld dword [Alpha]
 fadd dword [dA]
 fstp dword [Alpha]

 dec [i]
 cmp [i],0
 jg .SeifertDrawTriangle

invoke glEnd

