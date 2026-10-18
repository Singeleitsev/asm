;AngleStep = 360/n = 2*pi/n
 fldpi ;st0 = pi
 fmul dword [two] ;st0 = 2*pi
 ;fidiv because n is an integer
 fidiv dword [n] ;st0 = 2*pi/N
 fstp dword [dA] ;dA = st0

;Angle Address
 mov r11,V ;Vertex Array Address
 add r11,0Ch ;Shift to A-Cell
;X-Coordinate Address
 mov r13,V ;Vertex Array Address
;Y-Coordinate Address
 mov r14,V ;Vertex Array Address
 add r14,4 ;Shift to Y-Cell

;Set Counters
 mov [i],0 ;Counter = 0
 mov r10,[n] ;Number of Vertices
 finit

.nGonVertexCoord:
 fld dword [dA] ;st0 = dA
 ;fimul because n is an integer
 fimul dword [i] ;st0 = a[i]
 fst dword [r11] ;a[i] = st0
 fsincos ;st0 = cos(a) ;st1 = sin(a)
 fstp dword [r13] ;x[0] = st0
 fstp dword [r14] ;y[0] = st0
 ;Next Vertex
 add r11,20h ;Next Angle
 add r13,20h ;Next X
 add r14,20h ;Next Y
 ;Check for Loop
 inc [i]
 cmp [i],r10
 jl .nGonVertexCoord

