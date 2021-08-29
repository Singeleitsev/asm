;Search for Painted Pixels
lblTreeNextStep:
;Load Coordinates
	mov rsi,lpTreeX2 ;x
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY2 ;y
	mov r8d,dword ptr [rdi]
	mov rax,lpTreeCX ;CenterX
	mov ebx, dword ptr [rax]
	mov rax,lpTreeCY ;CenterY
	mov ecx, dword ptr [rax]

;Possible 4 Directions:
;- Horizontal
;| Vertical
;\ Diagonal-1
;/ Diagonal-2

;Select Random Direction
;Generate Random Number in R9
	rdrand r9
	and r9,3
;Generated Random is now
;in range of [0,3]
	cmp r9b,0
	je lblTreeGoAlong ;-
	cmp r9b,1
	je lblTreeGoAcross ;|
	cmp r9b,2
	je lblTreeGoDiagonal1 ;\
	jmp lblTreeGoDiagonal2 ;/

;Set the Coordinate Change Table
;x, y - Affected Coordinates
;s - Sign
;  x s y s
;- 1 0 0 0
;| 0 0 1 0
;\ 1 0 1 0
;/ 1 1 1 0

lblTreeGoAlong:
	cmp edx,ebx ;x <> cx
	jl lblTreeGoRight
	jg lblTreeGoLeft
	je lblTreeGoAcross

lblTreeGoAcross:
	cmp r8d,ecx ;y <> cy
	jl lblTreeGoDown
	jg lblTreeGoUp
	je lblTreeGoAlong

lblTreeGoDiagonal1:
	cmp edx,ebx ;x <> cx
	cmp r8d,ecx ;y <> cy
	jl lblTreeGoRightDown
	jg lblTreeGoLeftUp
	je lblTreeGoAlong

lblTreeGoDiagonal2:
	cmp edx,ebx ;x <> cx
	cmp r8d,ecx ;y <> cy
	jl lblTreeGoRightDown
	jg lblTreeGoLeftUp
	je lblTreeGoAlong



lblTreeGoRight:
;Check for Margin Excess
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	;Margin Right
	mov rax,lpTreeMR
	mov ecx, dword ptr [rax]
	cmp edx,ecx ;x <> mr
	;Re-Start
	jge lblTreeNewPoint 
;Move Right!
	mov rsi,lpTreeX1
	inc dword ptr [rsi]
	mov rsi,lpTreeX2
	inc dword ptr [rsi]
	mov rsi,lpTreeX3
	inc dword ptr [rsi]
jmp lblTreeCheckPoint

lblTreeGoLeft:
;Check for Margin Excess
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	;Margin Left
	mov rax,lpTreeML
	mov ecx, dword ptr [rax]
	cmp edx,ecx ;x <> mL
	;Re-Start
	jle lblTreeNewPoint 
;Move Left!
	mov rsi,lpTreeX1
	dec dword ptr [rsi]
	mov rsi,lpTreeX2
	dec dword ptr [rsi]
	mov rsi,lpTreeX3
	dec dword ptr [rsi]
jmp lblTreeCheckPoint

lblTreeGoDown:
;Check for Margin Excess
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	;Margin Bottom
	mov rax,lpTreeMB
	mov ecx, dword ptr [rax]
	cmp r8d,ecx ;y <> mb
	;Re-Start
	jge lblTreeNewPoint 
;Move Down!
	mov rdi,lpTreeY1
	inc dword ptr [rdi]
	mov rdi,lpTreeY2
	inc dword ptr [rdi]
	mov rdi,lpTreeY3
	inc dword ptr [rdi]
jmp lblTreeCheckPoint

lblTreeGoUp:
;Check for Margin Excess
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	;Margin Top
	mov rax,lpTreeMT
	mov ecx, dword ptr [rax]
	cmp r8d,ecx ;y <> mt
	;Re-Start
	jle lblTreeNewPoint 
;Move Down!
	mov rdi,lpTreeY1
	dec dword ptr [rdi]
	mov rdi,lpTreeY2
	dec dword ptr [rdi]
	mov rdi,lpTreeY3
	dec dword ptr [rdi]
jmp lblTreeCheckPoint



