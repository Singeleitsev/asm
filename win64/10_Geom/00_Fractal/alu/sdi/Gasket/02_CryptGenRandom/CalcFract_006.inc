;----------------------------------------------------
;Макросы, которые вычисляют координаты точек фрактала
;Вход:
;x - абсцисса ранее нарисованной точки;
;y - ордината ранее нарисованной точки;
;x_A - абсцисса активного аттрактора;
;y_A - ордината активного аттрактора;
;Выход:
;x - абсцисса рисуемой точки;
;y - ордината рисуемой точки
;----------------------------------------------------
CalcSieve MACRO x,y,x_A,y_A
	;x = (x + x_A)/2
		mov rax,x
		add rax,x_A	;x = x + x_A
		shr rax,1	;x = x/2
		mov x,rax	;Store x
	;y = (y + y_A)/2
		mov rax,y
		add rax,y_A	;y = y + y_A
		shr rax,1	;y = y/2
		mov y,rax	;Store y
ENDM ;CalcSieve
;----------------------------------------------------
CalcGasket MACRO x,y,x_A,y_A
	;x = (x + 2*x_A) / 3
		xor rdx,rdx	;Dividend
		mov rcx,3	;Divisor
		mov rax,x
		add rax,x_A	;x = x + x_A
		add rax,x_A	;x = x + x_A
		div ecx		;x = x/3
		mov x,rax	;Store x
	;y = (y + 2*y_A) / 3
		xor rdx,rdx	;Dividend
		mov rcx,3	;Divisor
		mov rax,y
		add rax,y_A	;y = y + y_A
		add rax,y_A	;y = y + y_A
		div ecx		;y = y/3
		mov y,rax	;Store y
ENDM ;CalcGasket
;----------------------------------------------------