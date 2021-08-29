;prg14_22.asm
MASM
MODEL	small
.stack	100h
.code
	public	_sum_asm
_sum_asm	proc	c near adr_mas:word,len_mas:word
	mov	ax,0
	mov	cx,len_mas	;длину массива - в cx
	mov	si,adr_mas	;адрес массива - в si
cycl:	add	ax,[si]	;сложение аккумулятора с элементом массива
	add	si,2	;адресовать следующий элемент массива
	loop	cycl
	ret	;возврат из функции, результат - в ax
_sum_asm	endp
end

