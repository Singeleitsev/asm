SetSieveDataPointers:

;SIEVEDATA
;
;00h-i ;Iteration Counter
;
;lpSieveX = [lpSieveData+10h]
;0Ch-x[3];08h-x[2];04h-x[1];00h-x[0] ;x Coordinate
;
;lpSieveY = [lpSieveData+20h]
;0Ch-y[3];08h-y[2];04h-y[1];00h-y[0] ;y Coordinate
;
;lpSieveR = [lpSieveData+30h] ;Red Color goes first
;02h-b[0];01h-g[0];00h-r[0] ;Variables
;05h-b[1];04h-g[1];03h-r[1] ;Vertex 1
;08h-b[2];07h-g[2];06h-r[2] ;Vertex 2
;0Bh-b[3];0Ah-g[3];09h-r[3] ;Vertex 3
;
;Vertex Colors are loaded in wmSieveCreate
;Coordinates of Vertices are calculated in wmSieveSize
;Coordinates of Current Point are calculated in wmSievePaint

;Re-Load SIEVEDATA address
;lpSieveData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpSieveData,rax

	add rax,10h
        mov lpSieveX,rax
	add rax,10h
	mov lpSieveY,rax
	add rax,10h
	mov lpSieveR,rax
	inc rax
	mov lpSieveG,rax
	inc rax
	mov lpSieveB,rax

;Assembler would place the 'leave' instruction as Epilogue
	;leave
;if the 'ret' instruction was used
	;ret
	pop rax ;RAX = (RIP before call)
	jmp rax
