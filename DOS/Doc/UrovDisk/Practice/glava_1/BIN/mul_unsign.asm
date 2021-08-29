;----------------------------------------------------------
;mul_unsign.asm - программа умножения чисел размером 1 байт без учета знака.
;Вход: multiplier1 и multiplier2 - множители размером 1 байт.
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
mul_unsign	proc
	mov	al,multiplier1
	mul	multiplier2
;оценить результат:
	jnc	no_carry	;нет переполнения - на no_carry
;обрабатываем ситуацию переполнения
	mov	product_h,ah	;старшая часть результата
no_carry:	mov	product_l,al	;младшая часть результата
	ret
mul_unsign	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	mul_unsign
	mov	ax,4c00h
	int	21h
end	main
