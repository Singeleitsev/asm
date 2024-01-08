proc KleinCalcColorProc

locals
 a dd ?
endl

mov rcx,p1.r ;Address

mov r12,rcx ;Red
add rcx,4
mov r13,rcx ;Green
add rcx,4
mov r14,rcx ;Blue

mov eax, dword [v]
mov dword [a], eax


finit

.KleinVertexColorLocate:
mov eax, dword [a]

cmp eax, 3F860A92h ;pi/3
jl .KleinVertexColorRule1

cmp eax, 40060A92h ;2*pi/3
jl .KleinVertexColorRule2

cmp eax, 40490FDBh ;pi
jl .KleinVertexColorRule3

cmp eax, 40860A92h ;4*pi/3
jl .KleinVertexColorRule4

cmp eax, 40A78D36h ;5*pi/3
jl .KleinVertexColorRule5

cmp eax, 40C90FDBh ;2*pi
jl .KleinVertexColorRule6

;Exceeding 2*pi
fld dword [a] ;st0 = a
fsub dword [c2pi] ;st0 = a-(2*pi)
fstp dword [a] ;New a
jmp .KleinVertexColorLocate


;Red to Yellow
.KleinVertexColorRule1:
mov dword [r12],1.0 ;Red
mov dword [r14],0.0 ;Blue
;Green Up
fld dword [a] ;st0 = a
fdiv dword [c1pi3] ;st0 = a/(pi/3)
fstp dword [r13] ;Green
jmp .KleinVertexColorEnd
 
;Yellow to Green
.KleinVertexColorRule2:
mov dword [r13],1.0 ;Green
mov dword [r14],0.0 ;Blue
;Red Down
fld dword [a] ;st0 = a
fsub dword [c1pi3] ;st0 = st0-pi/3
fdiv dword [c1pi3] ;st0 = st0/(pi/3)
fld1
fsub st0,st1 ;st0 = 1-st1
fstp dword [r12] ;Red
jmp .KleinVertexColorEnd
 
;Green to Cyan
.KleinVertexColorRule3:
mov dword [r12],0.0 ;Red
mov dword [r13],1.0 ;Green
;Blue Up
fld dword [a] ;st0 = a
fsub dword [c2pi3] ;st0 = st0-2*pi/3
fdiv dword [c1pi3] ;st0 = st0/(pi/3)
fstp dword [r14] ;Blue
jmp .KleinVertexColorEnd
 
;Cyan to Blue
.KleinVertexColorRule4:
mov dword [r12],0.0 ;Red
mov dword [r14],1.0 ;Blue
;Green Down
fld dword [a] ;st0 = a
fldpi 
fsubp ;st0 = st1-pi 
fdiv dword [c1pi3] ;st0 = st0/(pi/3) 
fld1 
fsub st0,st1 ;st0 = 1-st1 
fstp dword [r13] ;Green 
jmp .KleinVertexColorEnd 
 
;Blue to Purple 
.KleinVertexColorRule5: 
mov dword [r13],0.0 ;Green 
mov dword [r14],1.0 ;Blue 
;Red Up
fld dword [a] ;st0 = a
fsub dword [c4pi3] ;st0 = st0-4*pi/3
fdiv dword [c1pi3] ;st0 = st0/(pi/3)
fstp dword [r12] ;Red
jmp .KleinVertexColorEnd

;Purple to Red
.KleinVertexColorRule6:
mov dword [r12],1.0 ;Red
mov dword [r13],0.0 ;Green
;Blue Down
fld dword [a] ;st0 = a
fsub dword [c5pi3] ;st0 = st0-5*pi/3
fdiv dword [c1pi3] ;st0 = st0/(pi/3)
fld1
fsub st0,st1 ;st0 = 1-st1
fstp dword [r14] ;Blue
jmp .KleinVertexColorEnd


.KleinVertexColorEnd:
ret
endp 
 
