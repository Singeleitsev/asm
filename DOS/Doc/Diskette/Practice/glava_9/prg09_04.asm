;----------------------------------------------------------
;prg09_04.asm - программа вычисления CRC с использованием прямого табличного алгоритма.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;исходная битовая последовательность в символах
bit_string	db	"6476c8"
len_bit_string=$-bit_string
adr_bit_string	dd	bit_string
;CRC-таблица
tabl_16	dw	256 dup (0)
len_tabl_16=$-tabl_16
adr_tabl_16	dd	tabl_16
polinom	dw	1021h
.code
main:
	mov	ax,@data	;адрес сегмента данных - в регистр ax
	mov	ds,ax	;ax в ds
;-------------расчитываем CRC-таблицу---------------------------------
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
;-------------закончили расчет CRC-таблицы----------------------------
	xor	ax,ax
	xor	bx,bx
	lds	si,adr_bit_string
	mov	cx,len_bit_string
m4:
	mov	bl,ah
	shl	ax,8
	xor	bl,[si]
	xor	ax,tabl_16[bx]
	inc	si
	loop	m4
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main 
