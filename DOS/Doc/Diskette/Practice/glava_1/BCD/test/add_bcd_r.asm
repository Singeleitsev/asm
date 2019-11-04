masm
model small
add_bcd_r	macro	summand_1,len_1,summand_2,len_2,sum
local	m1,m2,m3
;--------------------------------------------------------------------------------;
;add_bcd_r summand_1,len_1,summand_2,len_2,sum - макрокоманда сложения неупакованных BCD-чисел размером len_1 и len_2 байт и помещение результата в sum.
;Вход: summand_1 и summand_2 - адреса младших байт слагаемых; len_1 и len_2 - длины слагаемых в байтах.
;Выход: sum - адрес младшего байта поля суммы. Желательно, чтобы это поле имело длину на единицу больше, чем длина самого длинного слагаемого.
;Порядок следования байт - старший байт по младшему адресу (не Intel).
;--------------------------------------------------------------------------------;
	push	si
	push	bx
	mov	ax,len_1
	cmp	ax,len_2
	jna	m2
	mov	cx,len_1	;длина большего для сложения (см. ниже)
	push	cx
	mov	cx,len_2	;длина меньшего для сложения (см. ниже)
	push	cx
	mov	cx,ax
	lea	bx,summand_1	;адрес большего источника для сложения
	lea	si,summand_2-1	;адрес меньшего источника для movsb
add	si,len_2	;смещение конца меньшего
mov	ax,len_1
push	bx
mov	bx,ax
	jmp	m3
m2:
	mov	cx,len_2	;длина большего для сложения (см. ниже)
	push	cx
	mov	cx,len_1	;длина меньшего для сложения (см. ниже)
	push	cx
	mov	cx,len_2
	lea	bx,summand_2	;адрес большего источника для сложения
	lea	si,summand_1-1	;адрес меньшего источника для movsb
	add	si,len_1	;смещение конца меньшего
mov	ax,len_2
push	bx
mov	bx,ax
m3:
;заполняем sum нулями - длина определена выше:
cld
	push	ds
	pop	es
	xor	al,al
	lea	di,sum
rep	stosb
;пересылка меньшего (по длине) BCD-числа в sum:
std
;адрес источника см. выше
lea	di,sum[bx]
pop	bx
	pop	cx	;длина была определена выше и соотв. меньшему BCD-числу
rep	movsb
	pop	cx	;цикл по большему
mov	si,cx
m1:	mov	al,[bx][si-1]
	adc	al,sum[si]
	aaa
	mov	sum[si],al
	dec	si
	loop	m1
	adc	sum[si],0
	pop	bx
	pop	si
	endm

.data
sum_1	db	9,3,4,5,9	;значения в summand_1 и summand_2 нужно внести
l_1=$-sum_1
sum_2	db	9,9,9,9
l_2=$-sum_2
sum	db	6 dup (0)	;n=max(len_1,len_2)+1

.stack	256
.486

.code
main:
	mov	dx,@data	
	mov	ds,dx	

	add_bcd_r	sum_1,l_1,sum_2,l_2,sum

	mov	ax,4c00h
	int	21h	
end	main		