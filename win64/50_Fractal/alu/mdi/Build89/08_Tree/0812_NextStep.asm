;Search for Painted Pixels
lblTreeNextStep:

;Positions
;0 - PosRight (7;0;1)
;1 - PosRightTop (0;1;2)
;2 - PosTop (1;2;3)
;3 - PosLeftTop (2;3;4)
;4 - PosLeft (3;4;5)
;5 - PosLeftBottom (4;5;6)
;6 - PosBottom (5;6;7)
;7 - PosRightBottom (6;7;0)
;Directions
;0 - GoLeft (7;0;1)
;1 - GoLeftDown (0;1;2)
;2 - GoDown (1;2;3)
;3 - GoRightDown (2;3;4)
;4 - GoRight (3;4;5)
;5 - GoRightUp (4;5;6)
;6 - GoUp (5;6;7)
;7 - GoLeftUp (6;7;0)

;Select Random Direction of Three possible
;Generate Random Number in RAX
	rdrand rax
	xor rdx,rdx ;Dividend High QWORD
	;rax = Dividend Low QWORD
	mov rcx,3 ;Divisor
	div rcx
;RDX = Random Remainder in Range [0,2]
;Store it to R10
	mov r10,rdx

;Load Coordinates
	mov rsi,lpTreeX2 ;x
	mov edx,dword ptr [rsi] ;edx = x
	mov rax,lpTreeCX ;CenterX
	mov ebx, dword ptr [rax] ;ebx = cx
	mov rdi,lpTreeY2 ;y
	mov r8d,dword ptr [rdi] ;r8d = y
	mov rax,lpTreeCY ;CenterY
	mov ecx, dword ptr [rax] ;ecx = cy


;Define Location
lblTreeLocateHor:
	cmp edx,ebx ;x <> cx
	jl  lblTreeLocateLeft ;x < cx
	jg  lblTreeLocateRight ;x > cx
	jmp lblTreeLocateCX ;x = cx
lblTreeLocateLeft: ;x < cx
	cmp r8d,ecx ;y <> cy
	jl  lblTreePos3 ;PosLeftTop
	jg  lblTreePos5 ;PosLeftBottom
	jmp lblTreePos4 ;PosLeft
lblTreeLocateRight: ;x > cx
	cmp r8d,ecx ;y <> cy
	jl  lblTreePos1 ;PosRightTop
	jg  lblTreePos7 ;PosRightBottom
	jmp lblTreePos0 ;PosRight
lblTreeLocateCX: ;x = cx
	cmp r8d,ecx ;y <> cy
	jl  lblTreePos2 ;PosTop
	jg  lblTreePos6 ;PosBottom
	jmp lblTreeNewPoint ;PosCenter


;Select Direction
lblTreePos0: ;PosRight
	cmp r10,1 ;Get Random Direction
	jl lblTreeGo7 ;GoLeftUp
	je lblTreeGo0 ;GoLeft
	jg lblTreeGo1 ;GoLeftDown
lblTreePos1: ;PosRightTop
	cmp r10,1 ;Get Random Direction
	jl lblTreeGo0 ;GoLeft
	je lblTreeGo1 ;GoLeftDown
	jg lblTreeGo2 ;GoDown
lblTreePos2: ;PosTop
	cmp r10,1 ;Get Random Direction
	jl lblTreeGo1 ;GoLeftDown
	je lblTreeGo2 ;GoDown
	jg lblTreeGo3 ;GoRightDown
lblTreePos3: ;PosLeftTop
	cmp r10,1 ;Get Random Direction
	jl lblTreeGo2 ;GoDown
	je lblTreeGo3 ;GoRightDown
	jg lblTreeGo4 ;GoRight
lblTreePos4: ;PosLeft
	cmp r10,1 ;Get Random Direction
	jl lblTreeGo3 ;GoRightDown
	je lblTreeGo4 ;GoRight
	jg lblTreeGo5 ;GoRightUp
lblTreePos5: ;PosLeftBottom
	cmp r10,1 ;Get Random Direction
	jl lblTreeGo4 ;GoRight
	je lblTreeGo5 ;GoRightUp
	jg lblTreeGo6 ;GoUp
lblTreePos6: ;PosBottom
	cmp r10,1 ;Get Random Direction
	jl lblTreeGo5 ;GoRightUp
	je lblTreeGo6 ;GoUp
	jg lblTreeGo7 ;GoLeft
lblTreePos7: ;PosRightBottom
	cmp r10,1 ;Get Random Direction
	jl lblTreeGo6 ;GoUp
	je lblTreeGo7 ;GoLeftUp
	jg lblTreeGo0 ;GoLeft


lblTreeGo0: ;GoLeft
	call lblTreeMoveLeft
	jmp lblTreeCheckPoint
lblTreeGo1: ;GoLeftDown
	call lblTreeMoveLeft
	call lblTreeMoveDown
	jmp lblTreeCheckPoint
lblTreeGo2: ;GoDown
	call lblTreeMoveDown
	jmp lblTreeCheckPoint
lblTreeGo3: ;GoRightDown
	call lblTreeMoveRight
	call lblTreeMoveDown
	jmp lblTreeCheckPoint
lblTreeGo4: ;GoRight
	call lblTreeMoveRight
	jmp lblTreeCheckPoint
lblTreeGo5: ;GoRightUp
	call lblTreeMoveRight
	call lblTreeMoveUp
	jmp lblTreeCheckPoint
lblTreeGo6: ;GoUp
	call lblTreeMoveUp
	jmp lblTreeCheckPoint
lblTreeGo7: ;GoLeftUp
	call lblTreeMoveLeft
	call lblTreeMoveUp
	jmp lblTreeCheckPoint


lblTreeMoveRight:
;Check for Margin Excess
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	;Margin Right
	mov rax,lpTreeMR
	mov ecx, dword ptr [rax]
	cmp edx,ecx ;x <> mr
	;Re-Start
	jge lblTreeNewPoint ;
	;Move
	mov rsi,lpTreeX1
	inc dword ptr [rsi]
	mov rsi,lpTreeX2
	inc dword ptr [rsi]
	mov rsi,lpTreeX3
	inc dword ptr [rsi]
	;ret
	pop rax
	jmp rax

lblTreeMoveLeft:
;Check for Margin Excess
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi]
	;Margin Left
	mov rax,lpTreeML
	mov ecx, dword ptr [rax]
	cmp edx,ecx ;x <> ml
	;Re-Start
	jle lblTreeNewPoint ;
	;Move
	mov rsi,lpTreeX1
	dec dword ptr [rsi]
	mov rsi,lpTreeX2
	dec dword ptr [rsi]
	mov rsi,lpTreeX3
	dec dword ptr [rsi]
	;ret
	pop rax
	jmp rax

lblTreeMoveDown:
;Check for Margin Excess
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	;Margin Bottom
	mov rax,lpTreeMB
	mov ecx, dword ptr [rax]
	cmp r8d,ecx ;y <> mb
	;Re-Start
	jge lblTreeNewPoint
	;Move
	mov rdi,lpTreeY1
	inc dword ptr [rdi]
	mov rdi,lpTreeY2
	inc dword ptr [rdi]
	mov rdi,lpTreeY3
	inc dword ptr [rdi]
	;ret
	pop rax
	jmp rax

lblTreeMoveUp:
;Check for Margin Excess
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi]
	;Margin Top
	mov rax,lpTreeMT
	mov ecx, dword ptr [rax]
	cmp r8d,ecx ;y <> mt
	;Re-Start
	jle lblTreeNewPoint
	;Move
	mov rdi,lpTreeY1
	dec dword ptr [rdi]
	mov rdi,lpTreeY2
	dec dword ptr [rdi]
	mov rdi,lpTreeY3
	dec dword ptr [rdi]
	;ret
	pop rax
	jmp rax


