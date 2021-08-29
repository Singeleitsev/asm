;----------------------------------------------------------
;prg09_03.asm - программа вычисления содержимого таблицы на основе полинома 1021h степени 16.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;CRC-таблица
tabl_16	dw	256 dup (0)
len_tabl_16=$-tabl_16
adr_tabl_16	dd	tabl_16
polinom	dw	1021h
.code
main:
	mov	ax,@data	;адрес сегмента данных - в регистр ax
	mov	ds,ax	;ax в ds
	les	di,adr_tabl_16
	add	di,len_tabl_16-2
	std	;идем назад по таблице
	mov	cx,255
	mov	bx,polinom
m1:
	xor	ax,ax
	mov	ah,cl	;индекс в таблице для вычисления CRC
	push	cx	;вложенные циклы
	mov	cx,8
m2:	shl	ax,1
	jnc	m3	;старшие разряды не равны - выполняем сдвиг (частное нас не интересует)
;старшие разряды равны - выполняем XOR:
	xor	ax,bx	;ax XOR polinom
m3:	loop	m2
	pop	cx
	stosw
	loop	m1
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main 
