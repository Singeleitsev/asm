.PyramidModeX87:

mov rsi,P ;Address of Previous Point
mov rcx,8 ;Members of CustomPoint Structure

.PyramidCalcX87:
 finit ;Clean
 fld dword [rsi] ;st(0) = P
 fadd dword [rdx] ;st(0) = P+N
 fdiv dword [two] ;st(0) = (P+N) / 2
 fstp dword [rsi] ;P = st(0)
;Check for Loop
 add rsi,4 ;Next Member
 add rdx,4
 dec rcx
 cmp rcx,0
 jg .PyramidCalcX87

jmp .PyramidDraw