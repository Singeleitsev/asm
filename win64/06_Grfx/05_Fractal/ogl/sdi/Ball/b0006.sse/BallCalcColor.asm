;Compute Colors
 ;Initialize Pointers
 finit
 mov [i],0 ;Counter = 0
 mov r10,[mn] ;Number of Vertices
 ;Angle Address
 mov r11,V ;Vertex Array Address
 add r11,0Ch ;Shift to A-Cell

.BallVertexColor:
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
 ja .BallVertexColorRule1 ;st0 > st1
 ;Case 2
 fld dword [r11] ;st0 = a[i]
 fld dword [c2pi3] ;st0 = 2*pi/3
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .BallVertexColorRule2 ;st0 > st1
 ;Case 3
 fld dword [r11] ;st0 = a[i]
 fldpi ;st0 = pi
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .BallVertexColorRule3 ;st0 > st1
 ;Case 4
 fld dword [r11] ;st0 = a[i]
 fld dword [c4pi3] ;st0 = 4*pi/3
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .BallVertexColorRule4 ;st0 > st1
 ;Case 5
 fld dword [r11] ;st0 = a[i]
 fld dword [c5pi3] ;st0 = 5*pi/3
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .BallVertexColorRule5 ;st0 > st1
 ;Case 6
 jmp .BallVertexColorRule6


.BallVertexColorRule1: ;Red
 mov dword [r13],1.0 ;Red
 mov dword [r15],0.0 ;Blue
 ;Green Up
 finit
 fld dword [r11] ;st0 = a[i]
 fdiv dword [c1pi3] ;st0 = a[i]/(pi/3)
 fstp dword [r14] ;Green
 jmp .BallVertexColorLoop
 
.BallVertexColorRule2: ;Yellow
 mov dword [r14],1.0 ;Green
 mov dword [r15],0.0 ;Blue
 ;Red Down
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c1pi3] ;st0 = st0-pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fld1
 fsub st0,st1 ;st0 = 1-st1
 fstp dword [r13] ;Red
 jmp .BallVertexColorLoop
 
.BallVertexColorRule3: ;Green
 mov dword [r13],0.0 ;Red
 mov dword [r14],1.0 ;Green
 ;Blue Up
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c2pi3] ;st0 = st0-2*pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fstp dword [r15] ;Blue
 jmp .BallVertexColorLoop
 
.BallVertexColorRule4: ;Cyan
 mov dword [r13],0.0 ;Red
 mov dword [r15],1.0 ;Blue
 ;Green Down
 finit
 fld dword [r11] ;st0 = a[i]
 fldpi
 fsubp ;st0 = st1-pi
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fld1
 fsub st0,st1 ;st0 = 1-st1
 fstp dword [r14] ;Green
 jmp .BallVertexColorLoop
 
.BallVertexColorRule5: ;Blue
 mov dword [r14],0.0 ;Green
 mov dword [r15],1.0 ;Blue
 ;Red Up
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c4pi3] ;st0 = st0-4*pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fstp dword [r13] ;Red
 jmp .BallVertexColorLoop
 
.BallVertexColorRule6: ;Purple
 mov dword [r13],1.0 ;Red
 mov dword [r14],0.0 ;Green
 ;Blue Down
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c5pi3] ;st0 = st0-5*pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fld1
 fsub st0,st1 ;st0 = 1-st1
 fstp dword [r15] ;Blue
 ;jmp .BallVertexColorLoop


.BallVertexColorLoop:
 add r11,20h ;Next Vertice
 inc [i]
 cmp [i],r10
 jl .BallVertexColor

