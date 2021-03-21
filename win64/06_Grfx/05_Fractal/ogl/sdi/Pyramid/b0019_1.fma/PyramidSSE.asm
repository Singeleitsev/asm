.modeSSE:
;Sierpinski Pyramid Algorithm
;P.x = (P.x + N.x)/2,
;P.y = (P.y + N.y)/2,
;P.z = (P.z + N.z)/2,
;where
;P.x, P.y, P.z - coordinates of Current Point
;N.x, N.y, N.z - coordinates of randomly selected Vertex

;Optimizing Algorithm for SSE computing
;P = (P + N)/2 = (P + N) * 0.5,
;where
;P - 4 variables of Point in 128 bits of xmm0
;N - 4 constants of Vertices from memory

;Broadcast 4 dword values of 0.5 to xmm5
movups xmm5, xword [broadcastHalf]

;Clean the Counter
xor rax,rax
mov [i],rax

.NewPointSSE:
;Generate Random Number in rax
;rdrand rax ;Instruction is too new
rdtsc ;Read Time Stamp Counter As A Random
;eax = Random Number

;Select one of four Vertices
;Divide random by 4
xor rdx,rdx ;Dividend High QWORD
;rax = Dividend Low QWORD
mov rcx,4 ;Divisor
div rcx
;rdx = Remainder = random[0 to 3]

;Multiply Random by Size of 20h Bytes
mov rax,rdx
mov rcx,20h
mul cx
;rax = Shift*Length

;Set Pointers to the Selected Attractor
mov rsi,A
add rsi,rax ;Coordinates Address
mov rdi,rsi
add rdi,10h ;Colors Address

;Compute
;xmm3 = (P + N) * 0.5
;xmm3 = xmm3 + xmmi
;xmm3 = xmm3 * xmm5
movups xmm0,xword [rsi]
addps xmm3,xmm0
mulps xmm3,xmm5
movups xword [P],xmm3

;xmm4 = (P + N) * 0.5
;xmm4 = xmm4 + xmmi
;xmm4 = xmm4 * xmm5
movups xmm0,xword [rdi]
addps xmm4,xmm0
mulps xmm4,xmm5
movups xword [P+10h],xmm4

invoke glColor3f,  float dword [P.r], float dword [P.g], float dword [P.b]
invoke glVertex3f, float dword [P.x], float dword [P.y], float dword [P.z]


;Check for Loop
inc [i]
cmp [i],1000h
jl .NewPointSSE ;Loop

jmp .skip
