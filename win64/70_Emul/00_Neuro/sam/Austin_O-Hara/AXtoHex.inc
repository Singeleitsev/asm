  ;converts [inbin1] to [outhex1 & outhex2]


HexOut:
;        mov ax, [inbin1]
	mov bx, ax     ;store for later
	and ax, 15 + 256*15	      ; nibble 1 + 3
	cmp al, 10
	jl num1
	add al, 55
	jmp let1
num1:	add al, 48
let1:	cmp ah, 10
	jl num2
	add ah, 55
	jmp let2
num2:	add ah, 48
let2:	xchg bx, ax	      ; nibble 1 and 3 now in bx
	and ax, 16*15 + 16*256*15	    ; nibble 2 + 4
	shr ax, 4
	cmp al, 10
	jl num3
	add al, 55     ;A to F
	jmp let3
num3:	add al, 48     ;0 to 9
let3:	cmp ah, 10
	jl num4
	add ah, 55
	jmp let4
num4:	add ah, 48
let4:
       xchg  bl, ah	      ; nibble 1 and 3 now in bx
;      mov [outhex1], bx
;       mov [outhex2], ax
	ret