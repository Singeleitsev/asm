.modeX87:
;Sierpinski Pyramid Algorithm
;P.x = (P.x + N.x) / 2,
;P.y = (P.y + N.y) / 2,
;P.z = (P.z + N.z) / 2,
;where
;P.x, P.y, P.z - coordinates of Current Point
;N.x, N.y, N.z - coordinates of randomly selected Vertex

;Optimizing Algorithm for x87 computing
;P = (P + N) / 2
;where
;P - any of 8 variables of Point
;N - any of 8 constants of Vertices

;Clean the Counter
xor rax,rax
mov [i],rax

.NewPointX87:
;Generate Random Number in rax
;rdrand rax ;Instruction is too new
rdtsc ;Read Time Stamp Counter As A Random
;eax = Random Number

;Select one of four Vertices
xor rdx,rdx ;Dividend High QWORD
;rax = Dividend Low QWORD
mov rcx,4 ;Divisor
div rcx
;rdx = random[0 to 3]

;Multiply Random by Size of 20h Bytes
mov rax,rdx
mov rcx,20h
mul cx
;rax = Shift*Length

;Shift the Pointer to the Selected Attractor
mov rsi,A
add rsi,rax

;X-Coordinate
finit
;Load st(0) = P.x
fld dword [P.x] ;P.x = P.x
fadd dword [rsi+00h] ;P.x = P.x + N.x
fdiv dword [two] ;P.x = (P.x + N.x) / 2
;Store P.x = st(0)
fstp dword [P.x]

;Y-Coordinate
finit
;Load st(0) = P.y
fld dword [P.y] ;P.y = P.y
fadd dword [rsi+04h] ;P.y = P.y + N.y
fdiv dword [two] ;P.y = (P.y + N.y) / 2
;Store N.y = st(0)
fstp dword [P.y]

;Z-Coordinate
finit
;Load st(0) = P.z
fld dword [P.z] ;P.z = P.z
fadd dword [rsi+08h] ;P.z = P.z + N.z
fdiv dword [two] ;P.z = (P.z + N.z) / 2
;Store P.z = st(0)
fstp dword [P.z]

;Red
finit 
;Load st(0) = P.r
fld dword [P.r] ;P.r = P.r
fadd dword [rsi+10h] ;P.r = P.r + N.r
fdiv dword [two] ;P.r = (P.r + N.r) / 2
;Store P.r = st(0)
fstp dword [P.r]

;Green
finit 
;Load st(0) = P.g
fld dword [P.g] ;P.g = P.g
fadd dword [rsi+14h] ;P.g = P.g + N.g
fdiv dword [two] ;P.g = (P.g + N.g) / 2
;Store N.g = st(0)
fstp dword [P.g]

;Blue
finit 
;Load st(0) = P.b
fld dword [P.b] ;P.b = P.b
fadd dword [rsi+18h] ;P.b = P.b + N.b
fdiv dword [two] ;P.b = (P.b + N.b) / 2
;Store P.b = st(0)
fstp dword [P.b]

;.DrawX87:
invoke glColor3f,  float dword [P.r], float dword [P.g], float dword [P.b]
invoke glVertex3f, float dword [P.x], float dword [P.y], float dword [P.z]

;Check for Loop
inc [i]
cmp [i],1000h
jl .NewPointX87 ;Loop

jmp .skip

