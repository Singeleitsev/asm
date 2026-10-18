.BallModeX87:

mov rsi,P ;Address of Previous Point
mov rcx,4 ;Members of CustomPoint Structure

.BallCalcX87:
;Coordinates
 finit
 fld dword [rsi] ;st0 = P
 fadd dword [rdx] ;st0 = P+N
 fadd dword [rdx] ;st0 = P+2*N
 fdiv dword [three] ;st0 = (P+2*N)/3
 fst dword [rsi] ;P = st0

;Color
 fabs
 fstp dword [rsi+10h]

;Check for Loop
 add rsi,4 ;Next Member
 add rdx,4
 dec rcx
 cmp rcx,0
 jg .BallCalcX87

jmp .BallDraw

