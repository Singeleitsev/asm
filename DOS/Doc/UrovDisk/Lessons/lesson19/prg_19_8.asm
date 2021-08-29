;Листинг 20.8. Вычисление выражения z=(sqrt(|x|)-y)2
.586p
masm
model	use16 small
.stack	100h
.data	;сегмент данных
;исходный данные:
x	dd	-29e-4
y	dq	4.6
z	dd	0
.code
main	proc
	mov	ax,@data
	mov	ds,ax
	finit	;приведение сопроцессора в начальное состояние
	fld	x	;st(0)=x
	fabs	;st(0)=|x|
	fsqrt
	fsub	y	;st(0)=sqrt|x|-y
;корень придется вычислять через умножение
	fst	st(1)
	fmul
	fst	z
exit:
	mov	ax,4c00h
	int	21h
main	endp
end	main

