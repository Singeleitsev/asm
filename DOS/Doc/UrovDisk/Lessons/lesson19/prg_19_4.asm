Листинг 20.4. Исследование вещественных арифметических команд
.586p
masm
model	use16 small
.stack	100h
.data	;сегмент данных
;исходный массив
i	equ	10
y	dq	0
.code	
main	proc
	mov	ax, @data
	mov	ds, ax
	finit	;приведение сопроцессора в начальное состояние
	fld1	;st(0)=1!
	fld1	;st(0)=i=1, st(1)=1!
	fst	y
	mov	cx, i-1	;первый элемент уже вычислили
cycl:
	fld1
	faddp
	fmul	st(1), st(0)	;st(0)=i=2, 3.., st(1)=i!
	fld1	
	fdiv	st(0), st(2)	;1/i!
	fadd	y	;накопление суммы
	fstp	y	;сохранение суммы
	loop	cycl
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main

