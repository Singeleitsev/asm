.GasketModeX87:

mov rsi,P ;Address of Previous Point
mov rcx,8 ;Members of CustomPoint Structure

.GasketCalcX87:
 finit ;Clean
 fld dword [rsi] ;st(0) = P
 fadd dword [rdx] ;st(0) = P+N
 fadd dword [rdx] ;st(0) = P+2*N
 fdiv dword [three] ;st(0) = (P+2*N)/3
 fstp dword [rsi] ;P.x = st(0)
;Check for Loop
 add rsi,4 ;Next Member
 add rdx,4
 dec rcx
 cmp rcx,0
 jg .GasketCalcX87

jmp .GasketDraw