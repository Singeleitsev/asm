;lblDrawNGonVertices:

;Get NgonData Variable Pointers
;lpNgonData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	include 711_SetPointers.asm

;RAX = Counter
	mov rsi,lpNgonData ;N
	mov rdi,lpIteration
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
	mov rax,lpIteration
	dec dword ptr[rax]
	cmp dword ptr[rax],0 ;Skip the Last Cycle
jg lblNgonNextVertex

	add rsp,20h ;call SetPixel

;Return
	;jmp lpBuffer