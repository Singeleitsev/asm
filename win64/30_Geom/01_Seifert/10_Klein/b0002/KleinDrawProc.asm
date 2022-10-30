proc KleinDrawProc

;FOR v = dV TO 360 STEP dV
mov eax, [dV]
mov [v],eax

.KleinDrawV:

;FOR u = dU TO 360 STEP dU
mov eax, [dU_]
mov [u],eax

.KleinDrawU:

 mov rcx,p1 ;Address
 call KleinCalcVertProc

 ;Right
 ;u = u+dU
 fld dword [u]
 fadd dword [dU_]
 fstp dword [u]

 mov rcx,p2 ;Address
 call KleinCalcVertProc

 ;Up
 ;v = v+dV
 fld dword [v]
 fadd dword [dV]
 fstp dword [v]

 mov rcx,p3 ;Address
 call KleinCalcVertProc

 ;Left
 ;u = u-dU
 fld dword [u]
 fsub dword [dU_]
 fstp dword [u]

 ;mov rcx,p4 ;Address
 ;call KleinCalcVertProc

 ;Down
 ;v = v-dV
 fld dword [v]
 fsub dword [dV]
 fstp dword [v]
 
 call KleinCalcColorProc

 invoke glColor3f, float dword [p1.r], float dword [p1.g], float dword [p1.b]
 invoke glVertex3f, float dword [p1.x], float dword [p1.y], float dword [p1.z]

 ;invoke glColor3f, float dword [p2.r], float dword [p2.g], float dword [p2.b]
 invoke glVertex3f, float dword [p2.x], float dword [p2.y], float dword [p2.z]

 ;invoke glColor3f, float dword [p3.r], float dword [p3.g], float dword [p3.b]
 invoke glVertex3f, float dword [p3.x], float dword [p3.y], float dword [p3.z]

 ;invoke glColor3f, float dword [p4.r], float dword [p4.g], float dword [p4.b]
 ;invoke glVertex3f, float dword [p4.x], float dword [p4.y], float dword [p4.z]

;U = U+dU
 finit
 fld dword [u]
 fadd dword [dU_]
 fstp dword [u]

 ;mov eax, [dU_]
 ;mov eax, [c8pi15] ;96 degrees
 ;mov eax, 40490FDBh ;pi
 mov eax, [c2pi] ;360 degrees
 cmp [u],eax
 jl .KleinDrawU

;V = V+dV
 finit
 fld dword [v]
 fadd dword [dV]
 fstp dword [v]

 ;mov eax,40c7f1e6h ;358 degrees
 mov eax, [c2pi] ;360 degrees
 ;mov eax, [c4pi] ;720 degrees
 cmp [v],eax
 jl .KleinDrawV

ret
endp

