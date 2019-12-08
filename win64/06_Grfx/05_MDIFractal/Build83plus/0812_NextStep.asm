;Search for Painted Pixels
;Left-to-Right Notation
;11;21;31
;12;22;32
;13;23;33
lblTreeNextStep:

;Select Random Direction
;Generate Random Number in RAX
	rdrand rax
	bt rax,0
	jc lblTreeGoAcross

lblTreeGoAlong:
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	mov rax,lpTreeCX ;CenterX
	mov ecx, dword ptr [rax]
	cmp edx,ecx ;x <> cx
	jl lblTreeGoRight
	jg lblTreeGoLeft
	je lblTreeGoAcross

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
;[x2][y2]
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x3][y1]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX3
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY1
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x3][y2]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX3
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x3][y3]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX3
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY3
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
@@:
;All four Cells are empty
;the Point makes a Next Step
jmp lblTreeNextStep


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
;[x2][y2]
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x1][y1]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX1
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY1
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x1][y2]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX1
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x1][y3]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX1
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY3
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
@@:
;All four Cells are empty
;the Point makes a Next Step
jmp lblTreeNextStep



lblTreeGoAcross:
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	mov rax,lpTreeCY ;CenterY
	mov ecx, dword ptr [rax]
	cmp r8d,ecx ;y <> cy
	jl lblTreeGoDown
	jg lblTreeGoUp
	je lblTreeGoAlong

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
;[x2][y2]
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x1][y3]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX1
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY3
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x2][y3]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY3
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x3][y3]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX3
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY3
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
@@:
;All four Cells are empty
;the Point makes a Next Step
jmp lblTreeNextStep


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
;[x2][y2]
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x1][y1]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX1
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY1
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x2][y1]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY1
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
;[x3][y1]
@@:
	sub rsp,20h ;Reserve Stack
	mov rcx,hdc ;for GetPixel
	mov rsi,lpTreeX3
	mov edx,dword ptr [rsi]
	mov rdi,lpTreeY1
	mov r8d,dword ptr [rdi]
	call GetPixel
	add rsp,20h
	cmp rax,0 ;Black Pixel?
	je @f
	cmp rax,0FFFFFFFFh ;Error?
	je lblTreeNewPoint
	jmp lblTreeDrawPoint
@@:
;All four Cells are empty
;the Point makes a Next Step
jmp lblTreeNextStep


