;----------------------------------------------------------
;sub_sign_N - процедура вычитани€ чисел размером N байт с учетом знака
;¬ход: minuend и deduction - уменьшаемое и вычитаемое, N - длина в байтах.
;¬ыход: minuend - значение разности.
;----------------------------------------------------------
.data
;значени€ в minuend и deduction нужно внести
minuend	db	?	;уменьшаемое
len_minuend=$-minuend	;длина в байтах уменьшаемого и вычитаемого
carry	db	0	;расширение знака
deduction	db	?	;вычитаемое
.code
sub_sign_N	proc
	mov	cx,len_minuend
	mov	si,0
@@m1:	mov	al,deduction[si]
	sbb	minuend[si],al
	inc	si
	loop	@@m1
;оценить результат:
	jnc	no_carry	;нет заема
;обрабатываем ситуацию заема из старшего разр€да - получаем модуль (если нужно)
N=len_minuend+1
	mov	carry,0ffh
	call	calc_abs
	jmp	end_p
no_carry:	jns	no_sign
;обрабатываем ситуацию получени€ отрицательного результата - получаем модуль (если нужно)
N=len_minuend
	call	calc_abs
	jmp	end_p
no_sign:
	jno	no_overflow
;обрабатываем ситуацию переполнени€ - получаем модуль (если нужно)
;расширить результат знаком - получаем модуль (если нужно):
N=len_minuend+1
	mov	carry,0ffh
	call	calc_abs
no_overflow:
end_p:
	ret
sub_sign_N	endp
