;----------------------------------------------------------
;prg09_08.asm - программа вычисления таблицы для зеркального алгоритма CRC32 и полинома 0EDB88320h.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;CRC32-таблица для зеркального табличного алгоритма вычисления CRC32
tabl_32_mirror	dd	256 dup (0)
len_tabl_32_mirror=$-tabl_32_mirror
adr_tabl_32_mirror	dd	tabl_32_mirror
polinom	dd	0EDB88320h
.code
main:
	mov	ax,@data	;адрес сегмента данных - в регистр ax
	mov	ds,ax	;ax в ds
	les	di,adr_tabl_32_mirror
	add	di,len_tabl_32_mirror-4
	std	;идем назад по таблице
	mov	cx,255
	mov	ebx,polinom
m1:
	xor	eax,eax
	mov	al,cl	;индекс в таблице для вычисления CRC
	push	cx	;вложенные циклы
	mov	cx,8
m2:	shr	eax,1
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
