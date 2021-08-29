;----------------------------------------------------------
;prg09_05.asm - программа вычисления CRC-таблицы для полинома 04c11db7.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;CRC32-таблица для прямого табличного алгоритма вычисления CRC32
tabl_32_direct	dd	256 dup (0)
len_tabl_32_direct =$-tabl_32_direct
adr_tabl_32_direct	dd	tabl_32_direct
polinom	dd	04c11db7h
.code
main:
	mov	ax,@data	;адрес сегмента данных - в регистр ax
	mov	ds,ax	;ax в ds
	les	di,adr_tabl_32_direct
	add	di,len_tabl_32_direct-4
	std	;идем назад по таблице
	mov	cx,255
	mov	ebx,polinom
m1:
	xor	eax,eax
	shrd	eax,ecx,8
	push	cx	;вложенные циклы
	mov	cx,8
m2:	shl	eax,1
	jnc	m3	;старшие разряды не равны - выполняем сдвиг (частное нас не интересует)
;старшие разряды равны - выполняем XOR:
	xor	eax,ebx	;ax XOR polinom
m3:	loop	m2
	pop	cx
	stosd
	loop	m1
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main 
