.SpongeRdRand:

;Generate Random Number in rax
rdrand rax

;Select Vertex
xor rdx,rdx ;Dividend High QWORD
;rax = Dividend Low QWORD
mov rcx,20 ;Divisor
div rcx
;rdx = random[0 to 19]

;Turn Random into Address
;The CustomPoint Structure's size is 32 bytes
shl rdx,5 ;Multiply the Obtained Random by 32
;Add Base Address to Obtained Random Shift
add rdx,A00 ;fasm considers this as an Address
;rdx = Address of a Random Point

push rdx

;Generate Random Number in rax
rdrand rax

;Select Vertex
xor rdx,rdx ;Dividend High QWORD
;rax = Dividend Low QWORD
mov rcx,3 ;Divisor
div rcx
;rdx = random[0 to 19]

;Turn Random into Address
;The CustomPoint Structure's size is 32 bytes
shl rdx,5 ;Multiply the Obtained Random by 32
;Add Base Address to Obtained Random Shift
add rdx,nX ;fasm considers this as an Address
;rdx = Address of a Random Point
mov rax,rdx

pop rdx

;jmp lblSpongeCalcMode