;AngleStep = 360/n = 2*pi/n
 fldpi ;st0 = pi
 fmul dword [two] ;st0 = 2*pi
 ;fidiv because n is an integer
 fidiv dword [n] ;st0 = 2*pi/N
 fstp dword [dA] ;dA = st0



;Compute Angular Positions of Vertices
 finit
 mov [i],0 ;Counter = 0
 mov r10,[n] ;Number of Vertices
;Angle Address
 mov r13,A00 ;Vertex Array Address
 add r13,0Ch ;Shift to A-Cell
;X-Coordinate Address
 mov r14,A00 ;Vertex Array Address
;Y-Coordinate Address
 mov r15,A00 ;Vertex Array Address
 add r15,4 ;Shift to Y-Cell

.nGonVertexCoord:
 fld dword [dA] ;st0 = dA
 ;fimul because n is an integer
 fimul dword [i] ;st0 = a[i]
 fst dword [r13] ;a[i] = st0
 fsincos ;st0 = cos(a) ;st1 = sin(a)
 fstp dword [r14] ;x[0] = st0
 fstp dword [r15] ;y[0] = st0
 ;Next Vertex
 add r13,20h
 add r14,20h
 add r15,20h
 ;Check for Loop
 inc [i]
 cmp [i],r10
 jl .nGonVertexCoord



;Compute Colors
 ;Initialize Pointers
 finit
 mov [i],0 ;Counter = 0
 mov r10,[n] ;Number of Vertices
 ;Angle Address
 mov r11,A00 ;Vertex Array Address
 add r11,0Ch ;Shift to A-Cell

.nGonVertexColor:
 ;Red
 mov r13,r11 ;A-Cell Address
 add r13,4 ;Shift to R-Cell
 ;Green
 mov r14,r13 ;R-Cell Address
 add r14,4 ;Shift to G-Cell
 ;Blue
 mov r15,r14 ;G-Cell Address
 add r15,4 ;Shift to B-Cell

 ;Locate the Vertex
 ;Case 1
 fld dword [r11] ;st0 = a[i]
 fld dword [c1pi3] ;st0 = pi/3
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .nGonVertexColorRule1 ;st0 > st1
 ;Case 2
 fld dword [r11] ;st0 = a[i]
 fld dword [c2pi3] ;st0 = 2*pi/3
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .nGonVertexColorRule2 ;st0 > st1
 ;Case 3
 fld dword [r11] ;st0 = a[i]
 fldpi ;st0 = pi
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .nGonVertexColorRule3 ;st0 > st1
 ;Case 4
 fld dword [r11] ;st0 = a[i]
 fld dword [c4pi3] ;st0 = 4*pi/3
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .nGonVertexColorRule4 ;st0 > st1
 ;Case 5
 fld dword [r11] ;st0 = a[i]
 fld dword [c5pi3] ;st0 = 5*pi/3
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .nGonVertexColorRule5 ;st0 > st1

 jmp .nGonVertexColorRule6


.nGonVertexColorRule1: ;Red
 mov dword [r13],1.0 ;Red
 mov dword [r15],0.0 ;Blue
 ;Green Up
 finit
 fld dword [r11] ;st0 = a[i]
 fdiv dword [c1pi3] ;st0 = a[i]/(pi/3)
 fstp dword [r14] ;Green
 jmp .nGonVertexColorLoop
 
.nGonVertexColorRule2: ;Yellow
 mov dword [r14],1.0 ;Green
 mov dword [r15],0.0 ;Blue
 ;Red Down
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c1pi3] ;st0 = st0-pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fld1
 fsub st0,st1 ;st0 = 1-st0
 fstp dword [r13] ;Red
 jmp .nGonVertexColorLoop
 
.nGonVertexColorRule3: ;Green
 mov dword [r13],0.0 ;Red
 mov dword [r14],1.0 ;Green
 ;Blue Up
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c2pi3] ;st0 = st0-2*pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fstp dword [r15] ;Blue
 jmp .nGonVertexColorLoop
 
.nGonVertexColorRule4: ;Cyan
 mov dword [r13],0.0 ;Red
 mov dword [r15],1.0 ;Blue
 ;Green Down
 finit
 fld dword [r11] ;st0 = a[i]
 fldpi
 fsubp ;st0 = st1-pi
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fld1
 fsub st0,st1 ;st0 = 1-st0
 fstp dword [r14] ;Green
 jmp .nGonVertexColorLoop
 
.nGonVertexColorRule5: ;Blue
 mov dword [r14],0.0 ;Green
 mov dword [r15],1.0 ;Blue
 ;Red Up
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c4pi3] ;st0 = st0-4*pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fstp dword [r13] ;Red
 jmp .nGonVertexColorLoop
 
.nGonVertexColorRule6: ;Purple
 mov dword [r13],1.0 ;Red
 mov dword [r14],0.0 ;Green
 ;Blue Down
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c5pi3] ;st0 = st0-5*pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fld1
 fsub st0,st1 ;st0 = 1-st0
 fstp dword [r15] ;Blue
 ;jmp .nGonVertexColorLoop


.nGonVertexColorLoop:
 add r11,20h ;Next Vertice
 inc [i]
 cmp [i],r10
 jl .nGonVertexColor

 ;xor eax,eax
 ;jmp .finish
