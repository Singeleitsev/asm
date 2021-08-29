;----------------------------------------------------------
;add_unsign_N - процедура сложения чисел размером N байт без учета знака
;Вход: summand_1 и summand_2 - слагаемые, N - длина в байтах.
;Выход: summand_1 или carry+summand_1 - значение суммы, в зависимости от наличия переполнения.
;----------------------------------------------------------
.data
summand_1	db	?	;первое слагаемое
N=$-summand_1	;длина в байтах значений summand_1 и summand_2
carry	db	0	;перенос сложения последних байт
summand_2	db	?	;второе слагаемое
.code
add_unsign_N	proc
	mov	cl,N
	xor	si,si
cycl:	mov	al,summand_2[si]
	adc	summand_1[si],al
	inc	si
	loop	cycl
	jnc	end_p			;проверка на переполнение
	adc	carry,0
end_p:	ret
add_unsign_N	endp