DrawNgonVertices:

;Set NgonData Variable Pointers
;lpNgonData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetNgonDataPointers

;RAX = Counter = Number of Vertices
	mov rsi,lpNgonData ;N
	mov rdi,lpNgonIteration
	mov eax,dword ptr[rsi]
	mov dword ptr[rdi],eax
;RSI = x[i]
	mov rsi,lpNgonX
;RDI = y[i]
	mov rdi,lpNgonY

	sub rsp,20h ;call SetPixel

lblNgonNextVertex:
	add rsi,4 ;Next X
	add rdi,4 ;Next Y
;rcx = hDC
	mov rcx,hdc
;rdx = x_i
	xor rdx,rdx
	mov edx,dword ptr [rsi]
;r8 = y_i
	xor r8,r8
	mov r8d,dword ptr [rdi]
;r9 = Color
	xor r9,r9
	mov r9,0FFFFFFh ;White
	call SetPixel

;Check for Loop
	mov rax,lpNgonIteration
	dec dword ptr[rax]
	cmp dword ptr[rax],0 ;Skip the Last Cycle
jg lblNgonNextVertex

	add rsp,20h ;call SetPixel

;Assembler would place the 'leave' instruction as Epilogue
	;leave
;if the 'ret' instruction was used
	;ret
	pop rax
	jmp rax
