;Compute Colors

;Set Pointers
;Angle Address
mov r12,V ;Vertex Array Address
add r12,0Ch ;Shift to A-Cell
;Red Address
mov r13,V ;Vertex Array Address
add r13,10h ;Shift to R-Cell
;Green Address
mov r14,V ;Vertex Array Address
add r14,14h ;Shift to G-Cell
;Blue Address
mov r15,V ;Vertex Array Address
add r15,18h ;Shift to B-Cell

;North Pole
mov dword [r13],0.0 ;R-Coord
mov dword [r14],0.0 ;G-Coord
mov dword [r15],1.0 ;B-Coord


;Blue Gradient
mov rax,qword [m]
mov qword [j],rax ;Counter = m
add r12,20h ;Next Angle
add r13,20h ;Next X
add r14,20h ;Next Y
add r15,20h ;Next Z

.BallNextB:
mov rax,qword [n]
mov qword [i],rax ;Counter = n
;b = abs(cos(dA*j))
finit
fld dword [dA] ;st0 = dA
;fimul because n is an integer
fimul dword [j] ;st0 = a[j]
fcos ;st0 = cos(a)
fabs ;st0 = abs(cos(a))
fstp dword [zPosition] ;b = abs(cos(a))


.BallNextRG:
 ;Set Blue
 mov eax,dword [zPosition]
 mov dword [r15],eax

 ;Locate the Vertex
 ;Case 1
 fld dword [r12] ;st0 = a[i]
 fld dword [c1pi2] ;st0 = pi/2
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .BallVertexColorRule1 ;st0 > st1
 ;Case 2
 fld dword [r12] ;st0 = a[i]
 fldpi ;st0 = pi
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .BallVertexColorRule2 ;st0 > st1
 ;Case 3
 fld dword [r12] ;st0 = a[i]
 fld dword [c3pi2] ;st0 = 3*pi/2
 fcompp ;Compare st0 with st1 and pop
 fstsw ax
 fwait
 sahf
 ja .BallVertexColorRule3 ;st0 > st1
 ;Case 4
 jmp .BallVertexColorRule4

.BallVertexColorRule1: ;Red
 ;Red Down
 finit
 fld dword [r12] ;st0 = a[i]
 fdiv dword [c1pi2] ;st0 = st0/(pi/2)
 fld1
 fsub st0,st1 ;st0 = 1-st1
 fstp dword [r13] ;Red
 ;Green Up
 finit
 fld dword [r12] ;st0 = a[i]
 fdiv dword [c1pi2] ;st0 = a[i]/(pi/2)
 fstp dword [r14] ;Green
 jmp .BallVertexRGLoop
 
.BallVertexColorRule2: ;Green
 ;Red Up
 finit
 fld dword [r12] ;st0 = a[i]
 fsub dword [c1pi2] ;st0 = st0-pi/2
 fdiv dword [c1pi2] ;st0 = a[i]/(pi/2)
 fstp dword [r13] ;Red
 ;Green Down
 finit
 fld dword [r12] ;st0 = a[i]
 fsub dword [c1pi2] ;st0 = st0-pi/2
 fdiv dword [c1pi2] ;st0 = st0/(pi/2)
 fld1
 fsub st0,st1 ;st0 = 1-st1
 fstp dword [r14] ;Green
 jmp .BallVertexRGLoop

.BallVertexColorRule3: ;Red
 ;Red Down
 finit
 fldpi
 fld dword [r12] ;st0 = a[i]
 fsub st0,st1 ;st0 = st0-pi
 fdiv dword [c1pi2] ;st0 = st0/(pi/2)
 fld1
 fsub st0,st1 ;st0 = 1-st1
 fstp dword [r13] ;Red
 ;Green Up
 finit
 fldpi
 fld dword [r12] ;st0 = a[i]
 fsub st0,st1 ;st0 = st0-pi
 fdiv dword [c1pi2] ;st0 = a[i]/(pi/2)
 fstp dword [r14] ;Green
 jmp .BallVertexRGLoop
 
.BallVertexColorRule4: ;Green
 ;Red Up
 finit
 fld dword [r12] ;st0 = a[i]
 fsub dword [c3pi2] ;st0 = st0-3*pi/2
 fdiv dword [c1pi2] ;st0 = a[i]/(pi/2)
 fstp dword [r13] ;Red
 ;Green Down
 finit
 fld dword [r12] ;st0 = a[i]
 fsub dword [c3pi2] ;st0 = st0-3*pi/2
 fdiv dword [c1pi2] ;st0 = st0/(pi/2)
 fld1
 fsub st0,st1 ;st0 = 1-st1
 fstp dword [r14] ;Green
 jmp .BallVertexRGLoop

;Next Vertex
.BallVertexRGLoop:
add r12,20h ;Next Angle
add r13,20h ;Next R
add r14,20h ;Next G
add r15,20h ;Next B
;Check for Loop
dec [i]
cmp [i],0
jg .BallNextRG

;Next Blue Gradient
;Check for Loop
dec [j]
cmp [j],0
jg .BallNextB


;South Pole exists only if
;there is even Number of Vertices
;Parity Check
mov rax,qword [n]
bt rax,0 ;Check the Last Bit
jc .BallCalcVertColorEnd ;Skip if 1

;South Pole
mov dword [r12],0.0 ;Angle
mov dword [r13],0.0 ;R-Coord
mov dword [r14],0.0 ;G-Coord
mov dword [r15],1.0 ;B-Coord

.BallCalcVertColorEnd: