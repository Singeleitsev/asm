lblTreeDrawPoint:

	sub rsp,20h
	mov rcx,hdc

	xor rdx,rdx
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi] ;x

	xor r8,r8
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi] ;y

	;xor r9,r9
	;mov rax,lpTreeR
	;mov r9d,dword ptr [rax] ;Color
	;rdrand r9
	;and r9,0FFFFFFh
	mov r9,0FF00h ;Green

	call SetPixel
	add rsp,20h

;Decrease Counter
	mov rax,lpTreeData
	dec dword ptr [rax]
