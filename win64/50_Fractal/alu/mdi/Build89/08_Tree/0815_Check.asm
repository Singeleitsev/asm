lblTreeCheckPoint:
;All-Around Check 
;At the Initial Position
;Left-to-Right Notation
;11;21;31
;12;22;32
;13;23;33
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
	jne lblTreeNewPoint
	;Clean Buffer
	mov rax,lpTreeCell
	mov byte ptr [rax],0
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
	mov rax,lpTreeCell
	inc byte ptr [rax]
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
	mov rax,lpTreeCell
	inc byte ptr [rax]
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
	mov rax,lpTreeCell
	inc byte ptr [rax]
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
	mov rax,lpTreeCell
	inc byte ptr [rax]
;[x2][y2]
	;Main Point
	;has been checked first

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
	mov rax,lpTreeCell
	inc byte ptr [rax]
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
	mov rax,lpTreeCell
	inc byte ptr [rax]
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
	mov rax,lpTreeCell
	inc byte ptr [rax]
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
	mov rax,lpTreeCell
	inc byte ptr [rax]

@@:
	mov rax,lpTreeCell
	;Next Step if Clear
	cmp byte ptr [rax],0
	je lblTreeNextStep
	;Re-Start if OverWhelmed
	cmp byte ptr [rax],4
	jg lblTreeNewPoint
	
;If there are 1-4 Points around
;Then Draw 
jmp lblTreeDrawPoint