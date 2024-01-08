finit

;Locate the Vertex
;Case 1    
fld dword [Alpha] ;st0 = a1    
fld dword [c1pi3] ;st0 = pi/3    
fcompp ;Compare st0 with st1 and pop    
fstsw ax    
fwait    
sahf    
ja .SeifertVertexColorRule1 ;st0 > st1    
;Case 2    
fld dword [Alpha] ;st0 = a1    
fld dword [c2pi3] ;st0 = 2*pi/3    
fcompp ;Compare st0 with st1 and pop    
fstsw ax    
fwait    
sahf    
ja .SeifertVertexColorRule2 ;st0 > st1    
;Case 3    
fld dword [Alpha] ;st0 = a1    
fldpi ;st0 = pi    
fcompp ;Compare st0 with st1 and pop    
fstsw ax    
fwait    
sahf    
ja .SeifertVertexColorRule3 ;st0 > st1    
;Case 4    
fld dword [Alpha] ;st0 = a1    
fld dword [c4pi3] ;st0 = 4*pi/3    
fcompp ;Compare st0 with st1 and pop    
fstsw ax    
fwait    
sahf    
ja .SeifertVertexColorRule4 ;st0 > st1    
;Case 5    
fld dword [Alpha] ;st0 = a1    
fld dword [c5pi3] ;st0 = 5*pi/3    
fcompp ;Compare st0 with st1 and pop    
fstsw ax    
fwait    
sahf    
ja .SeifertVertexColorRule5 ;st0 > st1    
   
jmp .SeifertVertexColorRule6    
   
;Red to Yellow    
.SeifertVertexColorRule1:    
mov dword [p1.r],1.0 ;Red    
mov dword [p1.b],0.0 ;Blue    
;Green Up    
finit    
fld dword [Alpha] ;st0 = a1    
fdiv dword [c1pi3] ;st0 = a1/(pi/3)    
fstp dword [p1.g] ;Green    
jmp .SeifertVertexColorCounterpart    
   
;Yellow to Green    
.SeifertVertexColorRule2:    
mov dword [p1.g],1.0 ;Green    
mov dword [p1.b],0.0 ;Blue    
;Red Down    
finit    
fld dword [Alpha] ;st0 = a1    
fsub dword [c1pi3] ;st0 = st0-pi/3    
fdiv dword [c1pi3] ;st0 = st0/(pi/3)    
fld1    
fsub st0,st1 ;st0 = 1-st1    
fstp dword [p1.r] ;Red    
jmp .SeifertVertexColorCounterpart    
   
;Green to Cyan    
.SeifertVertexColorRule3:    
mov dword [p1.r],0.0 ;Red    
mov dword [p1.g],1.0 ;Green    
;Blue Up    
finit    
fld dword [Alpha] ;st0 = a1    
fsub dword [c2pi3] ;st0 = st0-2*pi/3    
fdiv dword [c1pi3] ;st0 = st0/(pi/3)    
fstp dword [p1.b] ;Blue    
jmp .SeifertVertexColorCounterpart    
   
;Cyan to Blue    
.SeifertVertexColorRule4:    
mov dword [p1.r],0.0 ;Red    
mov dword [p1.b],1.0 ;Blue    
;Green Down    
finit    
fld dword [Alpha] ;st0 = a1    
fldpi    
fsubp ;st0 = st1-pi    
fdiv dword [c1pi3] ;st0 = st0/(pi/3)    
fld1    
fsub st0,st1 ;st0 = 1-st1    
fstp dword [p1.g] ;Green    
jmp .SeifertVertexColorCounterpart    
   
;Blue to Purple    
.SeifertVertexColorRule5:    
mov dword [p1.g],0.0 ;Green    
mov dword [p1.b],1.0 ;Blue    
;Red Up    
finit    
fld dword [Alpha] ;st0 = a1    
fsub dword [c4pi3] ;st0 = st0-4*pi/3    
fdiv dword [c1pi3] ;st0 = st0/(pi/3)    
fstp dword [p1.r] ;Red    
jmp .SeifertVertexColorCounterpart    
   
;Purple to Red    
.SeifertVertexColorRule6:    
mov dword [p1.r],1.0 ;Red    
mov dword [p1.g],0.0 ;Green    
;Blue Down    
finit    
fld dword [Alpha] ;st0 = a1    
fsub dword [c5pi3] ;st0 = st0-5*pi/3    
fdiv dword [c1pi3] ;st0 = st0/(pi/3)    
fld1    
fsub st0,st1 ;st0 = 1-st1    
fstp dword [p1.b] ;Blue    
;jmp .SeifertVertexColorCounterpart    
   
.SeifertVertexColorCounterpart:    
;Not needed - Color is the same as [p1]    
;mov r13d,dword [p1.r] ;Red    
;mov dword [p2.r],r13d    
;mov r14d,dword [p1.g] ;Green    
;mov dword [p2.g],r14d    
;mov r15d,dword [p1.b] ;Blue    
;mov dword [p2.b],r15d    
   
   
   
   
