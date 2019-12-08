DrawSieve:

;Re-Set SIEVEDATA Pointers
;lpSieveData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetSieveDataPointers

	;mov rax,lpSieveData
	;Spell64rax hwnd, szRAX, szSieveTitle

;Set Counter
;0FFFFh = 65,535 Points
;1FFFFh = 131,072 Points
;7FFFFh = 524,287 Points
;0FFFFFh = 1,048,575 points
	mov rax,lpSieveData
	mov dword ptr [rax],0FFFFh

lblSieveNewPoint:
;x = (x + x_A)/2,
;y = (y + y_A)/2,
;where
;x,y - coordinates of Point
;x_A,y_A - coordinates
;of randomly selected Vertex

;Generate Random Number in rax
	rdrand rax


;Select Vertex
	xor rdx,rdx ;Dividend High QWORD
	;rax = Dividend Low QWORD
	mov rcx,3 ;Divisor
	div rcx
;RDX = Random Remainder in Range 0 to 2
;Store it to RBX
;because RDX will be used in SetPixel
	mov rbx,rdx


;Multiply Random by Size of 4 Bytes
	shl rbx,2


;Load Previous x[0] to RDX
;x[0] = [lpSieveX] = Variable
	mov rsi,lpSieveX ;x[0]
	xor rdx,rdx
	mov edx,dword ptr [rsi]
;x = x + x_A
;Shift the Pointer to First Vertex x[1]
	add rsi,4 ;x[1]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random
	add edx,dword ptr [rsi]
;x = x/2
	shr rdx,1
;Store New x[0]
;x[0] = [lpSieveX] = Variable
	mov rsi,lpSieveX ;x[0]
	mov dword ptr [rsi],edx


;Load Previous y[0] to R8
;y[0] = [lpSieveY] = Variable
	mov rsi,lpSieveY ;y[0]
	xor r8,r8
	mov r8d,dword ptr [rsi]
;y = y + y_A
;Shift the Pointer to First Vertex y[1]
	add rsi,4 ;y[1]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random
	add r8d,dword ptr [rsi]
;y = y/2
	shr r8,1
;Store New y[0]
;y[0] = [lpSieveY] = Variable
	mov rsi,lpSieveY ;y[0]
	mov dword ptr [rsi],r8d


;Restore original Random to Size of 1 Byte
	shr rbx,2 ;Divide by 4
;And multiply it by Step of 3 Bytes
	mov rax,rbx
	add rbx,rax
	add rbx,rax

;BLUE
;Load Previous b[0] to RAX
;b[0] = [lpSieveB] = Variable
	mov rsi,lpSieveB ;b[0]
	xor rax,rax ;Calculate in AX
	mov al,byte ptr [rsi]
;b = b + b_A
;Shift the Pointer to First Vertex b[1]
	add rsi,3 ;b[1] = [lpSieveB+3]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random
	xor rcx,rcx ;Use to avoid OverFlow
	mov cl,byte ptr [rsi]
	add ax,cx
;b = b/2
	shr rax,1
;Store New b[0]
;b[0] = [lpSieveB] = Variable
	mov rsi,lpSieveB ;b[0]
	mov byte ptr [rsi],al
;Load New b[0] to R9
	xor r9,r9
	mov r9b,al

;GREEN
;Load Previous g[0] to RAX
;g[0] = [lpSieveG] = Variable
	mov rsi,lpSieveG ;g[0]
	xor rax,rax ;Calculate in AX
	mov al,byte ptr [rsi]
;g = g + g_A
;Shift the Pointer to First Vertex g[1]
	add rsi,3 ;g[1] = [lpSieveG+3]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random
	xor rcx,rcx ;Use to avoid OverFlow
	mov cl,byte ptr [rsi]
	add ax,cx
;g = g/2
	shr rax,1
;Store New g[0]
;g[0] = [lpSieveG] = Variable
	mov rsi,lpSieveG ;g[0]
	mov byte ptr [rsi],al
;Load New g[0] to R9
	shl r9,8 ;Prepare empty space
	add r9b,al

;RED
;Load Previous r[0] to RAX
;r[0] = [lpSieveR] = Variable
	mov rsi,lpSieveR ;r[0]
	xor rax,rax ;Calculate in AX
	mov al,byte ptr [rsi]
;r = r + r_A
;Shift the Pointer to First Vertex g[1]
	add rsi,3 ;r[1] = [lpSieveR+3]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random twice
	xor rcx,rcx ;Use to avoid OverFlow
	mov cl,byte ptr [rsi]
	add ax,cx
;r = r/2
	shr rax,1
;Store New r[0]
;r[0] = [lpSieveR] = Variable
	mov rsi,lpSieveR ;r[0]
	mov byte ptr [rsi],al
;Load New r[0] to R9
	shl r9,8 ;Prepare empty space
	add r9b,al


;lblSieveDraw:
	sub rsp,20h
	mov rcx,hdc

	;xor rdx,rdx
	;mov rsi,lpSieveX
	;mov edx,dword ptr [rsi] ;x

	;xor r8,r8
	;mov rsi,lpSieveY
	;mov r8d,dword ptr [rsi] ;y

	;mov rsi,lpSieveR
	;mov r9d,dword ptr [rsi] ;Color
	;and r9,0FFFFFFh

	call SetPixel
	add rsp,20h

;Check for Loop
	mov rsi,lpSieveData
	dec dword ptr [rsi] ;I
	cmp dword ptr [rsi],0
jg lblSieveNewPoint ;Loop

;Assembler would place the 'leave' instruction as Epilogue
	;leave
;if the 'ret' instruction was used
	;ret
	pop rax
	jmp rax


