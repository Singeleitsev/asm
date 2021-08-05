;AngleStep = 360/n = 2*pi/n
fldpi ;st0 = pi
fmul dword [two] ;st0 = 2*pi
;fidiv because n is an integer
fidiv dword [n] ;st0 = 2*pi/n
fstp dword [dA] ;dA = st0


;Total Number of Latitudinal Sections
;m = int(n-1)/2
mov rax,qword [n]
dec rax ;n-1
shr rax,1 ;int(n-1)/2
mov qword [m],rax

;Number of Vertices in Latitudinal Sections
;mn = m*n
mov rax,qword [m]
mul qword [n]
mov qword [mn],rax

;Add North Pole to Number of Vertices
inc qword [mn]

;South Pole exists only if
;there is even Number of Vertices
mov rax,qword [n]
not rax ;Inverse
and rax,1 ;Select the Last Bit
add qword [mn],rax


;Set Pointers
;Angle Address
mov r12,V ;Vertex Array Address
add r12,0Ch ;Shift to A-Cell
;X-Coordinate Address
mov r13,V ;Vertex Array Address
;Y-Coordinate Address
mov r14,V ;Vertex Array Address
add r14,4 ;Shift to Y-Cell
;Z-Coordinate Address
mov r15,V ;Vertex Array Address
add r15,8 ;Shift to Z-Cell


;North Pole
mov dword [r12],0.0 ;Angle
mov dword [r13],0.0 ;X-Coord
mov dword [r14],0.0 ;Y-Coord
mov dword [r15],1.0 ;Z-Coord

;Latitudinal Sections
mov rax,qword [m]
mov qword [j],rax ;Counter = m
add r12,20h ;Next Angle
add r13,20h ;Next X
add r14,20h ;Next Y
add r15,20h ;Next Z

.BallNextZ:
mov rax,qword [n]
mov qword [i],rax ;Counter = n
;zj = cos(dA*j)
;Scale Factor = sin(dA*j)
finit
fld dword [dA] ;st0 = dA
;fimul because n is an integer
fimul dword [j] ;st0 = a[j]
fsincos ;st0 = cos(a) ;st1 = sin(a)
fstp dword [zPosition] ;zj = cos(a)
fstp dword [zFactor] ;k = sin(a)

.BallNextXY:
;xi = cos(dA*i)
;yi = sin(dA*i)
fld dword [dA] ;st0 = dA
;fimul because n is an integer
fimul dword [i] ;st0 = a[i]
fst dword [r12] ;a[i] = st0
fsincos ;st0 = cos(a) ;st1 = sin(a)
fmul dword [zFactor] ;st0 = k*cos(a)
fstp dword [r13] ;x[0] = k*cos(a)
fmul dword [zFactor] ;st0 = k*sin(a)
fstp dword [r14] ;y[0] = sin(a)
mov eax,dword[zPosition]
mov dword [r15],eax
;Next Vertex
add r12,20h ;Next Angle
add r13,20h ;Next X
add r14,20h ;Next Y
add r15,20h ;Next Z
;Next Vertex
dec [i]
cmp [i],0
jg .BallNextXY

;Next Latitudinal Section
;Check for Loop
dec [j]
cmp [j],0
jg .BallNextZ


;South Pole exists only if
;there is even Number of Vertices
;Parity Check
mov rax,qword [n]
bt rax,0 ;Check the Last Bit
jc .BallCalcVertEnd ;Skip if 1

;South Pole
mov dword [r12],0.0 ;Angle
mov dword [r13],0.0 ;X-Coord
mov dword [r14],0.0 ;Y-Coord
mov dword [r15],-1.0 ;Z-Coord

.BallCalcVertEnd:
