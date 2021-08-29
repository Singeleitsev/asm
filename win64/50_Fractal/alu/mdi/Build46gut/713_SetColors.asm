;Load Vertex Colors

;Vertex Counters
	xor rdx,rdx ;Dividend
	xor rax,rax ;Dividend
	mov rbx,lpNgonData
	mov eax,dword ptr[rbx] ;Dividend = N
	mov rcx,3 ;Divisor = 3
	div rcx
	mov rbx,lpIteration
	mov dword ptr [rbx],eax ;Quotient
	mov rbx,lpBuffer
	mov dword ptr [rbx],eax ;Quotient
	add dword ptr [rbx],edx ;Remainder


;RDI = Color Address
	mov rdi,lpNgonR


lblSetVertex1Color: ;Red
;ColorStep1 = 0FFh/Iterations
	xor rdx,rdx ;Dividend
	mov rax,0FFh ;Dividend
	xor rcx,rcx ;Divisor
	mov rbx,lpIteration
	mov ecx,dword ptr[rbx] ;Divisor = N/3
	div rcx
;RSI = ColorStep
	mov rsi,rax
;RDX = Current Red = 0FFh
	add rdi,3 ;r[1]
	mov rdx,0FFh
	mov byte ptr [rdi],dl
;R8 = Current Green = 0
	inc rdi ;g[1]
	xor r8,r8
	mov byte ptr [rdi],0
;R9 = Current Blue = 0
	inc rdi ;b[1]
	xor r9,r9
	mov byte ptr [rdi],0
;Set Counter 1
	xor rcx,rcx
	mov rbx,lpIteration
	mov ecx, dword ptr [rbx]
	dec rcx ;First Vertex is already set
	cmp rcx,0
	je lblSetVertex2Color
lblNgonColorStep1:
	;Red = Red-ColorStep
	inc rdi ;r[i]
	sub rdx,rsi
	mov byte ptr [rdi],dl
	;Green = Green+ColorStep
	inc rdi ;g[i]
	add r8,rsi
	mov byte ptr [rdi],r8b
	;Blue = 0
	inc rdi ;b[i]
	mov byte ptr [rdi],0
	;Vertex Counter
	dec rcx
	cmp rcx,0
jg lblNgonColorStep1


lblSetVertex2Color: ;Green
;ColorStep2 = 0FFh/Iterations
	xor rdx,rdx ;Dividend
	mov rax,0FFh ;Dividend
	xor rcx,rcx ;Divisor
	mov rbx,lpIteration
	mov ecx,dword ptr[rbx] ;Divisor = N/3
	div rcx
;RSI = ColorStep
	mov rsi,rax
;RDX = Current Red = 0
	inc rdi ;r[i]
	;xor rdx,rdx
	mov byte ptr [rdi],0
;R8 = Current Green = 0FFh
	inc rdi ;g[i]
	mov r8,0FFh
	mov byte ptr [rdi],r8b
;R9 = Current Blue = 0
	inc rdi ;b[i]
	xor r9,r9
	mov byte ptr [rdi],0
;Set Counter 2
	xor rcx,rcx
	mov rbx,lpIteration
	mov ecx, dword ptr [rbx]
	dec rcx ;First Vertex is already set
	cmp rcx,0
	je lblSetVertex3Color
lblNgonColorStep2:
	;Red = 0
	inc rdi ;r[i]
	mov byte ptr [rdi],0
	;Green = Green-ColorStep
	inc rdi ;g[i]
	sub r8,rsi
	mov byte ptr [rdi],r8b
	;Blue = Blue+ColorStep
	inc rdi ;b[i]
	add r9,rsi
	mov byte ptr [rdi],r9b
	;Vertex Counter
	dec rcx
	cmp rcx,0
jg lblNgonColorStep2


lblSetVertex3Color: ;67% Green 33% Blue
;ColorStep3 = 0FFh/(Iterations + Remainder)
	xor rdx,rdx ;Dividend
	mov rax,0FFh ;Dividend
	xor rcx,rcx ;Divisor
	mov rbx,lpBuffer
	mov ecx,dword ptr[rbx] ;Divisor = N/3
	div rcx
;RSI = ColorStep
	mov rsi,rax
;RDX = Current Red = 0
	inc rdi ;r[i]
	xor rdx,rdx
	mov byte ptr [rdi],0
;R8 = Current Green = 0
	inc rdi ;g[i]
	;xor r8,r8
	mov byte ptr [rdi],0
;R9 = Current Blue = 0FFh
	inc rdi ;b[i]
	mov r9,0FFh
	mov byte ptr [rdi],r9b
;Set Counter 3
	xor rcx,rcx
	mov rbx,lpBuffer
	mov ecx, dword ptr [rbx]
	dec rcx ;First Vertex is already set
	cmp rcx,0
	je lblEndSetColors
lblNgonColorStep3:
	;Red = Red+ColorStep
	inc rdi ;r[i]
	add rdx,rsi
	mov byte ptr [rdi],dl
	;Green = 0
	inc rdi ;g[i]
	mov byte ptr [rdi],0
	;Blue = Blue-ColorStep
	inc rdi ;b[i]
	sub r9,rsi
	mov byte ptr [rdi],r9b
	;Vertex Counter
	dec rcx
	cmp rcx,0
jg lblNgonColorStep3

lblEndSetColors:

