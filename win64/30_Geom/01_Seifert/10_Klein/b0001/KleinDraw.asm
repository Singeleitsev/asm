invoke glBegin,GL_POINTS
;invoke glBegin,GL_LINE_STRIP
;invoke glBegin,GL_TRIANGLE_STRIP

mov eax, [m1pi2]
mov [u],eax ;-pi/2

mov esi,[rU] ;Vertical Resolution
mov [i],esi
add [i],2 ;Extra Steps

.KleinDrawU:

mov [v],0

mov esi,[rV] ;Vertical Resolution
mov [j],esi
add [j],2 ;Extra Steps

.KleinDrawV:

 include 'KleinCalcVert.asm'
 include 'KleinCalcColor.asm'

 invoke glColor3f, float dword [p1.r], float dword [p1.g], float dword [p1.b]
 invoke glVertex3f, float dword [p1.x], float dword [p1.y], float dword [p1.z]
;Not needed - Color is the same as [p1]
 ;invoke glColor3f, float dword [p2.r], float dword [p2.g], float dword [p2.b] 
 ;invoke glVertex3f, float dword [p2.x], float dword [p2.y], float dword [p2.z]

;V = V+dV
 finit
 fld dword [v]
 fadd dword [dV]
 fstp dword [v]

 dec [j]
 cmp [j],0
 jg .KleinDrawV

;U = U+dU
 finit
 fld dword [u]
 fadd dword [dU_]
 fstp dword [u]

 dec [i]
 cmp [i],0
 jg .KleinDrawU

invoke glEnd

