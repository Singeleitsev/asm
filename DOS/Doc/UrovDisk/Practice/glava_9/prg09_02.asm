;----------------------------------------------------------
;prg09_02.asm - программа демонстрации прямого алгоритма вычисления CRC (сторона-приемник).
;----------------------------------------------------------
masm
model small
.stack	256
.486
.data
;исходная битовая последовательность в символах
bit_string	db	"6476c8",35h,0dah
len_bit_string=$-bit_string
adr_bit_string	dd	bit_string
polinom	dw	4003h
.code
main:
	mov	ax,@data	;адрес сегмента данных - в регистр ax
	mov	ds,ax	;ax в ds
	xor	ax,ax
	lds	si,adr_bit_string
	mov	cx,len_bit_string
	mov	bx,polinom
	shl	ebx,16	;подготовим polinom к XOR с EAX
m1:	push	cx	;вложенные циклы
	mov	cx,8
	lodsb
m2:	shl	eax,1
	jnc	m3	;старшие разряды не равны - выполняем сдвиг (частное нас не интересует)
;старшие разряды равны - выполняем XOR:
	xor	eax,ebx	;eax(31..16) XOR polinom
m3:	loop	m2
	pop	cx
	loop	m1
;вдвигаем нулевые биты числом N
	mov	cl,24+1	; N=16 (степень полинома) + 8 (т. к. работаем в eax)+1(для loop)
m4:	shl	eax,1
	jnc	m5	;старшие разряды не равны - выполняем сдвиг (частное нас не интересует)
;старшие разряды равны - выполняем XOR:
	xor	eax,ebx	;eax(31..16) XOR polinom
m5:	loop	m4
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main 
