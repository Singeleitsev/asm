sub_sign_N	macro	minuend,deduction,N
local	cycl,m1
;----------------------------------------------------------
;sub_sign_N minuend,deduction,N - макрокоманда вычитани€ c учетом знака чисел размером N байт
;¬ход: minuend и deduction - уменьшаемое и вычитаемое, N - длина в байтах.
;ѕор€док следовани€ байт - старший байт по младшему адресу (не Intel).
;¬ыход: minuend - значение разности.
;----------------------------------------------------------
	push	si
	mov	cl,N
	mov	si,N-1
cycl:	mov	al,deduction[si]
	sbb	minuend[si],al
;	jnc	m1
;	neg	minuend[si]
m1:	dec	si
	loop	cycl
	pop	si
	endm
