;----------------------------------------------------------
;mul_sign.asm - программа умножения чисел размером 1 байт c учетом знака
;Вход: multiplier1 и multiplier2 - множители со знаком размерностью 1 байт.
;Выход: product - значение произведения.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;значения в multiplier1 и multiplier2 нужно внести
product	label	word
product_l	label	byte
multiplier1	db	?	;множитель 1 (младшая часть произведения)
product_h	db	0	;старшая часть произведения
multiplier2	db	?	;множитель 2
.code
mul_sign	proc
	mov	al,multiplier1
	imul	multiplier2
;оценить результат:
	jnc	no_carry	;нет переполнения - на no_carry
;обрабатываем ситуацию переполнения
	mov	product_h,ah	;старшая часть результата, знак результата - старший бит product_h
no_carry:	mov	product_l,al	;младшая часть результата, product_h - расширение знака
	ret
mul_sign	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	mul_sign
	mov	ax,4c00h
	int	21h
end	main
