.PyramidRdRand:

;Generate Random Number in rax
 rdrand rax

;Select Vertex
 xor rdx,rdx ;Dividend High QWORD
;rax = Dividend Low QWORD
 mov rcx,5 ;Divisor
 div rcx
;rdx = random[0 to 4]

;Turn Random into Address
;The CustomPoint Structure's size is 32 bytes
 shl rdx,5 ;Multiply the Obtained Random by 32
;Add Base Address to Obtained Random Shift
 add rdx,A ;fasm allows this
;rdx = Address of a Random Point

;jmp lblPyramidCalcMode