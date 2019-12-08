DrawNgon:

;Set NgonData Variable Pointers
;lpNgonData = (lpNgonRECTDATA) GetWindowLong (hwnd, 0)
	call SetNgonDataPointers

;Set Counter
;0FFFFh = 65,535 Points
;1FFFFh = 131,072 Points
;7FFFFh = 524,287 Points
;0FFFFFh = 1,048,575 points
	mov rax,lpNgonIteration
	mov dword ptr [rax],0FFFFh

lblNgonNewPoint:
;x = (x + 2*x_A)/3,
;y = (y + 2*y_A)/3,
;where
;x,y - coordinates of Point
;x_A,y_A - coordinates
;of randomly selected Vertex

;Generate Random Number in rax
	rdrand rax


;Select Vertex
	xor rdx,rdx ;Dividend High QWORD
	;rax = Random = Dividend Low QWORD
	mov rsi,lpNgonData ;N
	xor rcx,rcx
	mov ecx,dword ptr [rsi] ;Divisor = N
	div rcx
;RDX = Random Remainder in Range 0 to N-1
;Store it to RBX
;because RDX will be used in SetPixel
	mov rbx,rdx


;Multiply Random by Size of 4 Bytes
	shl rbx,2


;Load Previous x[0] to RAX
;It can't be loaded directly to RDX
;because of division operations below
;x[0] = [lpNgonX] = Variable
	mov rsi,lpNgonX ;x[0]
	xor rax,rax
	mov eax,dword ptr [rsi]
;x = (x + 2*x_A) / 3
;Shift the Pointer to First Vertex x[1]
	add rsi,4 ;x[1]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random twice
	add eax,dword ptr [rsi]
	add eax,dword ptr [rsi]
;x = x/3
	xor rdx,rdx ;Dividend
	mov rcx,3 ;Divisor
	div rcx
;Store New x[0]
;x[0] = [lpNgonX] = Variable
	mov rsi,lpNgonX ;x[0]
	mov dword ptr [rsi],eax


;Load Previous y[0] to RAX
;It can't be loaded directly to R8
;because of division operations below
;y[0] = [lpNgonY] = Variable
	mov rsi,lpNgonY ;y[0]
	xor rax,rax
	mov eax,dword ptr [rsi]
;y = (y + 2*y_A) / 3
;Shift the Pointer to First Vertex y[1]
	add rsi,4 ;y[1]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random twice
	add eax,dword ptr [rsi]
	add eax,dword ptr [rsi]
;y = y/3
	xor rdx,rdx ;Dividend
	mov rcx,3 ;Divisor
	div rcx
;Store New y[0]
;y[0] = [lpNgonY] = Variable
	mov rsi,lpNgonY ;y[0]
	mov dword ptr [rsi],eax


;Restore original Random to Size of 1 Byte
	shr rbx,2 ;Divide by 4
;And multiply it by Step of 3 Bytes
	mov rax,rbx
	add rbx,rax
	add rbx,rax


;BLUE
;Load Previous b[0] to RAX
;b[0] = [lpNgonB] = Variable
	mov rsi,lpNgonB ;b[0]
	xor rax,rax ;Calculate in AX
	mov al,byte ptr [rsi]
;b = (b + 2*b_A)/3
;Shift the Pointer to First Vertex b[1]
	add rsi,3 ;b[1]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random twice
	xor rcx,rcx ;Use to avoid OverFlow
	mov cl,byte ptr [rsi]
	add ax,cx
	add ax,cx
;b = b/3
	xor rdx,rdx ;Dividend
	mov rcx,3 ;Divisor
	div rcx
;Store New b[0]
;b[0] = [lpNgonB] = Variable
	mov rsi,lpNgonB ;b[0]
	mov byte ptr [rsi],al
;Load New b[0] to R9
	xor r9,r9
	mov r9b,al

;GREEN
;Load Previous g[0] to RAX
;g[0] = [lpNgonG] = Variable
	mov rsi,lpNgonG ;g[0]
	xor rax,rax ;Calculate in AX
	mov al,byte ptr [rsi]
;g = (g + 2*g_A)/3
;Shift the Pointer to First Vertex g[1]
	add rsi,3 ;g[1]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random twice
	xor rcx,rcx ;Use to avoid OverFlow
	mov cl,byte ptr [rsi]
	add ax,cx
	add ax,cx
;g = g/3
	xor rdx,rdx ;Dividend
	mov rcx,3 ;Divisor
	div rcx
;Store New g[0]
;g[0] = [lpNgonG] = Variable
	mov rsi,lpNgonG ;g[0]
	mov byte ptr [rsi],al
;Load New g[0] to R9
	shl r9,8 ;Prepare empty space
	add r9b,al


;RED
;Load Previous r[0] to RAX
;r[0] = [lpNgonR] = Variable
	mov rsi,lpNgonR ;r[0]
	xor rax,rax ;Calculate in AX
	mov al,byte ptr [rsi]
;r = (r + 2*r_A)/3
;Shift the Pointer to First Vertex g[1]
	add rsi,3 ;r[1]
;Shift to Active Vertex
	add rsi,rbx
;Add Generated Random twice
	xor rcx,rcx ;Use to avoid OverFlow
	mov cl,byte ptr [rsi]
	add ax,cx
	add ax,cx
;r = r/3
	xor rdx,rdx ;Dividend
	mov rcx,3 ;Divisor
	div rcx
;Store New r[0]
;r[0] = [lpNgonR] = Variable
	mov rsi,lpNgonR ;r[0]
	mov byte ptr [rsi],al
;Load New r[0] to R9
	shl r9,8 ;Prepare empty space
	add r9b,al


;lblNgonDraw:
	sub rsp,20h
	mov rcx,hdc

	xor rdx,rdx
	mov rsi,lpNgonX ;x[0]
	mov edx,dword ptr [rsi]

	xor r8,r8
	mov rsi,lpNgonY ;y[0]
	mov r8d,dword ptr [rsi]

	;mov rsi,lpNgonR
	;mov r9d,dword ptr [rsi] ;Color
	;and r9,0FFFFFFh

	;mov r9,0FFh ;Red

	call SetPixel
	add rsp,20h

;Check for Loop
	mov rax,lpNgonIteration
	dec dword ptr [rax]
	cmp dword ptr [rax],0
;Loop
	jg lblNgonNewPoint

;Assembler would place the 'leave' instruction as Epilogue
	;leave
;if the 'ret' instruction was used
	;ret
	pop rax
	jmp rax

