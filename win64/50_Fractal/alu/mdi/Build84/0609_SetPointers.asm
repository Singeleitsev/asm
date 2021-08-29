SetGasketDataPointers:

;GASKETDATA
;
;00h-i ;Iteration Counter
;
;lpGasketX = [lpGasketData+10h]
;08h-x[2];04h-x[1];00h-x[0] ;x Coordinate
;14h-x[5];10h-x[4];0Ch-x[3]
;20h-x[8];1Ch-x[7];18h-x[6]
;
;lpGasketY = [lpGasketData+34h]
;08h-y[2];04h-y[1];00h-y[0] ;y Coordinate
;14h-y[5];10h-y[4];0Ch-y[3]
;20h-y[8];1Ch-y[7];18h-y[6]
;
;lpGasketR = [lpGasketData+58h]
;02h-b[0];01h-g[0];00h-r[0] ;Colors
;05h-b[1];04h-g[1];03h-r[1] ;Colors
;08h-b[2];07h-g[2];06h-r[2] ;Colors
;0Bh-b[3];0Ah-g[3];09h-r[3] ;Colors
;0Eh-b[4];0Dh-g[4];0Ch-r[4] ;Colors
;11h-b[5];10h-g[5];0Fh-r[5] ;Colors
;14h-b[6];13h-g[6];12h-r[6] ;Colors
;17h-b[7];16h-g[7];15h-r[7] ;Colors
;1Ah-b[8];19h-g[8];18h-r[8] ;Colors
;
;Vertex Colors are loaded in wmGasketCreate
;Coordinates of Vertices are calculated in wmGasketSize
;Coordinates of Current Point are calculated in wmGasketPaint

;Re-Load GASKETDATA address
;lpGasketData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpGasketData,rax

	add rax,10h
	mov lpGasketX,rax
	add rax,24h
	mov lpGasketY,rax
	add rax,24h
	mov lpGasketR,rax
	inc rax
	mov lpGasketG,rax
	inc rax
	mov lpGasketB,rax

;Assembler would place the 'leave' instruction as Epilogue
	;leave
;if the 'ret' instruction was used
	;ret
	pop rax
	jmp rax
