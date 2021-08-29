;--------------------------------------------------------------------------------;
;fact.asm - программа вычисления факториала с использованием рекурсивной процедуры
;--------------------------------------------------------------------------------;
masm
model small
.stack	256
.486
.data
r_fact	dw	0
.code
fact	proc
push	bp
	mov	bp,sp
	mov	cx,[bp+4]
	mov	ax,cx
	mul	r_fact
	mov	r_fact,ax
	dec	cx
	jcxz	end_p
push	cx
	call	fact
end_p:
	mov	sp,bp
	pop	bp
	ret
fact	endp
main:
	mov	ax,@data	;адрес сегмента данных в регистр ax
	mov	ds,ax	;ax в ds
	mov	r_fact,1
push	5
	call	fact
exit:	;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main
