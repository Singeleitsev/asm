;Листинг 20.2. Исследование команд сравнения данных
.586p
masm
model	use16 small
.stack	100h
.data	;сегмент данных
;исходный массив
mas	dd	-2.0, 45.7, -9.4, 7.3, 60.3, -58.44, 890e7, -98746e3
mas_h_0	dd	8 dup (0)	;массив значений больше либо равных 0
i_mas_h_0	dd	0	;текущий индекс в mas_h_0
mas_l_0	dd	8 dup (0)	;массив значений меньших 0
i_mas_l_0	dd	0	;текущий индекс в mas_l_0
.code
main	proc	;начало процедуры main
	mov	ax, @data
	mov	ds, ax
	xor	esi, esi
	mov	cx, 8	;счетчик циклов
	finit	;приведение сопроцессора в начальное состояние
	fldz	;загрузка нуля в st(0)
cycl:
	fcom	mas[esi*4]	;сравнение нуля в st(0) с очередным элементом массива mas
	fstsw	ax	;сохранение swr в регистре ax
	sahf	;запись swr->ax-> регистр флагов
	jp	error	;переход по "плохому" операнду в команде fcom
	jc	hi_0	;переход, если mas[esi*4]>= 0 (mas[esi*4]>=st(0))
;пересылка операнда mas[esi*4] меньшего 0 в массив mas_l_0
	mov	eax, mas[esi*4]
	mov	edi, i_mas_l_0
	mov	mas_l_0[edi*4], eax
	inc	i_mas_l_0
	jmp	cycl_bst
hi_0:
;пересылка операнда mas[esi*4] большего или равного 0 в массив mas_h_0
	mov	eax, mas[esi*4]
	mov	edi, i_mas_h_0
	mov	mas_h_0[edi*4], eax
	inc	i_mas_h_0
cycl_bst:
	inc	si
	loop	cycl
error:
;здесь можно вывести сообщение об ошибке в задании операндов
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main
