;Листинг 20.3. Исследование целочисленных арифметических команд
.586p
masm
model	use16 small
.stack	100h
.data	;сегмент данных
;исходный массив
a	dw	0
x	dw	8
y	dw	4
u	dt	0
.code
main	proc
	mov	ax, @data
	mov	ds, ax
	finit	;приведение сопроцессора в начальное состояние
	fild	a	;загрузка значение a в st(0)
	fxam	;определяем тип а
	fstsw	ax	;сохранение swr в регистре ax
	sahf	;запись swr->ax-> регистр флагов
	jc	no_null
	jp	no_null
	jnz	no_null
;вычисление формулы u=x+y:
	fild	x
	fiadd	y
	fbstp	u
	jmp	exit
no_null:
;вычисление формулы u=x-y/a:
	fild	x
	fisub	y
	fidiv	a
	fbstp	u
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main

