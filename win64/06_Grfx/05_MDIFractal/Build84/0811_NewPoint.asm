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
	add edx,dword ptr [rax]
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
	add edx,dword ptr [rax]
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

jmp lblTreeCheckPoint

	