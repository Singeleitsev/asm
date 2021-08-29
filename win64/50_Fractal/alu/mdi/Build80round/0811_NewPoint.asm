;Select Random Coordinates

lblTreeNewX:
	rdrand rax ;Dividend Low DQWord
	xor rdx,rdx ;Clean Dividend High DQWord
	xor rcx,rcx ;Clean Divisor
	mov rbx,lpTreeMW ;Margin Width
	mov ecx,dword ptr [rbx]
	div ecx
	;RDX = Random Remainder in Range 0 to (mw-1)
	;Shift to Margin Left
	mov rax,lpTreeML
	add edx, dword ptr [rax]
	;Store New Point X
	mov rsi,lpTreeX2
	mov dword ptr [rsi],edx
	;x1 = x2 - 1
	mov rax,lpTreeX1
	mov dword ptr [rax],edx
	dec dword ptr [rax]
	;x3 = x2 + 1
	mov rax,lpTreeX3
	mov dword ptr [rax],edx
	inc dword ptr [rax]	

lblTreeNewY:
	rdrand rax ;Dividend Low DQWord
	xor rdx,rdx ;Clean Dividend High DQWord
	xor rcx,rcx ;Clean Divisor
	mov rbx,lpTreeMH ;Margin Height
	mov ecx,dword ptr [rbx]
	div ecx
	;RDX = Random Remainder in Range 0 to (mh-1)
	;Shift to Margin Top
	mov rax,lpTreeMT
	add edx, dword ptr [rax]
	;Store New Point Y
	mov rdi,lpTreeY2
	mov dword ptr [rdi],edx
	;y1 = y2 - 1
	mov rax,lpTreeY1
	mov dword ptr [rax],edx
	dec dword ptr [rax]
	;y3 = y2 + 1
	mov rax,lpTreeY3
	mov dword ptr [rax],edx
	inc dword ptr [rax]	

;All-Around Check 
;at the Initial Position
;Left-to-Right Notation
;11;21;31
;12;22;32
;13;23;33
;[x1][y1]
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
	;Re-Start if clear
	cmp byte ptr [rax],0
	je lblTreeNewPoint
	;Re-Start if overWhelmed
	cmp byte ptr [rax],4
	jg lblTreeNewPoint
	
;If there are 1-4 Points around
;Then Draw 
jmp lblTreeDrawPoint
	

