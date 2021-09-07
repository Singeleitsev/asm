DrawTree:

;Re-Set TreeData Variable Pointers
;lpTreeData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetTreeDataPointers

;Draw Initial Point
	sub rsp,20h
	mov rcx,hdc

	xor rdx,rdx
	mov rsi,lpTreeCX
	mov edx,dword ptr [rsi] ;x

	xor r8,r8
	mov rdi,lpTreeCY
	mov r8d,dword ptr [rdi] ;y

	;mov rbx,lpTreeR
	;mov r9d,dword ptr [rbx] ;Color
	;and r9,0FFFFFFh
	mov r9,0FFh ;Red

	call SetPixel
	add rsp,20h

;Set Counter
;0FFFFh = 65,535 Points
;1FFFFh = 131,072 Points
;7FFFFh = 524,287 Points
;0FFFFFh = 1,048,575 points
	mov rax,lpTreeData
	mov dword ptr [rax],0FFFFh

lblTreeNewPoint:
	include 0811_NewPoint.asm

	include 0812_NextStep.asm
	
	include 0813_DrawPoint.asm
	
	include 0814_Inflate.asm

	include 0815_Check.asm

;Check for Loop
lblTreeLoopCheck:
	mov rax,lpTreeData
	;dec dword ptr [rax] ;Decreases in DrawPoint
	cmp dword ptr [rax],0
	jg lblTreeNewPoint ;Loop

;Assembler would place the 'leave' instruction as Epilogue
	;leave
;if the 'ret' instruction was used
	;ret
	pop rax
	jmp rax
