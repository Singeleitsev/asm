masm
model small
sub_bcd	macro	minuend,len_m, deduction,len_d, difference
local	temp,m1,m2,exit_m
;--------------------------------------------------------------------------------;
;sub_bcd minuend,len_m,deduction,len_d,difference - макрокоманда вычитания неупакованных BCD-чисел размером len_m и len_d байт и помещение результата в difference.
;Вход: minuend и deduction - адреса младших байт уменьшаемого и вычитаемого; len_m и len_d - длины уменьшаемого и вычитаемого в байтах.
;Выход: difference - адрес младшего байта поля разности. Длина поля difference должна быть не меньше длины уменьшаемого.
;Порядок следования байт - младший байт по младшему адресу (Intel).
;--------------------------------------------------------------------------------;
	push	si
;копируем уменьшаемое в difference:
	push	ds
	pop	es
	cld
	lea	si,minuend
	lea	di,difference
	mov	cx,len_m
	push	cx
rep	movsb
;копируем вычитаемое во врем. область temp:
	jmp	m1
temp	db	len_m dup (0)
m1:
	lea	si,deduction
	lea	di,cs:temp
	mov	cx,len_d
	push	cs
	pop	es
rep	movsb
	xor	si,si
	pop	cx
m2:	mov	al,minuend[si]
	sbb	al,cs:temp[si]
	aas
	mov	difference[si],al
	inc	si
	loop	m2
	jc	m3	;на обработку заема из старшего разряда
	jmp	exit_m
m3:	nop
exit_m:
	pop	si
	endm

.data
;значения в minuend и deduction нужно внести
min	db	9,3,4,5,9	;уменьшаемое
l_m=$-min		;длина в байтах значения minuend
ded	db	9,9,9,9	;вычитаемое
l_d=$- ded		;длина в байтах значения deduction
dif	db	l_m dup (0)

.stack	256
.486

.code
main:
	mov	dx,@data	
	mov	ds,dx	

	sub_bcd	min,l_m, ded,l_d, dif

	mov	ax,4c00h
	int	21h	
end	main		