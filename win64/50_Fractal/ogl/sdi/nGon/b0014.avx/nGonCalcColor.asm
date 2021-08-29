;Angle Address
mov r11,V ;Vertex Array Address
add r11,0Ch ;Shift to A-Cell
;Red Address
 mov r13,V ;Vertex Array Address
 add r13,10h ;Shift to R-Cell
;Green Address
 mov r14,V ;Vertex Array Address
 add r14,14h ;Shift to G-Cell
;Blue Address
 mov r15,V ;Vertex Array Address
 add r15,18h ;Shift to B-Cell

;Set Counters
mov [i],0 ;Counter = 0
mov r10,[n] ;Number of Vertices
finit

.nGonVertexColor:
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

;Red to Yellow
.nGonVertexColorRule1:
 mov dword [r13],1.0 ;Red
 mov dword [r15],0.0 ;Blue
 ;Green Up
 finit
 fld dword [r11] ;st0 = a[i]
 fdiv dword [c1pi3] ;st0 = a[i]/(pi/3)
 fstp dword [r14] ;Green
 jmp .nGonVertexColorLoop

;Yellow to Green
.nGonVertexColorRule2:
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

;Green to Cyan
.nGonVertexColorRule3:
 mov dword [r13],0.0 ;Red
 mov dword [r14],1.0 ;Green
 ;Blue Up
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c2pi3] ;st0 = st0-2*pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fstp dword [r15] ;Blue
 jmp .nGonVertexColorLoop

;Cyan to Blue
.nGonVertexColorRule4:
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

;Blue to Purple
.nGonVertexColorRule5:
 mov dword [r14],0.0 ;Green
 mov dword [r15],1.0 ;Blue
 ;Red Up
 finit
 fld dword [r11] ;st0 = a[i]
 fsub dword [c4pi3] ;st0 = st0-4*pi/3
 fdiv dword [c1pi3] ;st0 = st0/(pi/3)
 fstp dword [r13] ;Red
 jmp .nGonVertexColorLoop

;Purple to Red
.nGonVertexColorRule6:
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
 add r11,20h ;Next Angle
 add r13,20h ;Next Red
 add r14,20h ;Next Green
 add r15,20h ;Next Blue
 inc [i]
 cmp [i],r10
 jl .nGonVertexColor


