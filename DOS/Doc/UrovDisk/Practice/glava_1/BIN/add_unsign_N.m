.data
;summand_1	db	?	;первое слагаемое
;N=$-summand_1		;длина в байтах значений summand_1 и summand_2
;carry	db	0	;перенос сложения последних байт
;summand_2	db	?	;второе слагаемое
.code
;старший байт по младшему адресу
add_unsign_N	macro	carry,summand_1,summand_2,N
local	cycl,end_p
;----------------------------------------------------------
;add_unsign_N carry,summand_1,summand_2,N ? макрокоманда сложения без учета знака чисел размером N байт
;Вход: summand_1 и summand_2 - слагаемые, N - длина в байтах.
;Порядок следования байт - старший байт по младшему адресу (не Intel).
;Выход: summand_1 или carry+summand_1 - значение суммы, в зависимости от наличия переполнения.
;----------------------------------------------------------
	mov	cl,N
	mov	si,N-1
cycl:	mov	al,summand_2[si]
	adc	summand_1[si],al
	dec	si
	loop	cycl
	jnc	end_p
	adc	carry,0
end_p:	nop
	endm
