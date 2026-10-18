.GasketRdRand:

;Generate Random Number in rax
 rdrand rax

;Select Vertex
 xor rdx,rdx ;Dividend High QWORD
;rax = Dividend Low QWORD
 mov rcx,[n] ;Divisor
 div rcx
;rdx = random[0 to (n-1)]

;Turn Random into Address
;The CustomPoint Structure's size is 32 bytes
 shl rdx,5 ;Multiply the Obtained Random by 32
;Add Base Address to Obtained Random Shift
 add rdx,V ;fasm allows this
;rdx = Address of a Random Point

;jmp lblGasketCalcMode