;----------------------------------------------------------
;prg06_04.asm - программа ввода целых десятичных чисел из диапазона 0..µ.
;Вход: ввод с клавиатуры числа в десятичной системе счисления длиной до 20 цифр.
;Выход: двоичное число-результат преобразования в области памяти string_bin.
;----------------------------------------------------------
masm
model small
.486
.stack	256
add_unsign_N_1	macro	summand_1, summand_2, N
local	cycl, end_p, end_o
;--------------------------------------------------------------------------------;
;add_unsign_N_1 - сложение числа summand_1 размером N байт с однобайтовым числом summand_2 без учета знака (Intel)
;Вход: summand_1 и summand_2 - слагаемые, N - длина summand_1 в байтах.
;Выход: summand_1 или carry+summand_1 - значение суммы, в зависимости от наличия переполнения.
;--------------------------------------------------------------------------------;
push	cx
push	si
push	ax
	mov	cx,N
	xor	si,si
	mov	al,summand_2
	adc	summand_1[si],al
	dec	cx
	jcxz	end_o	;если длина summand_1 равна 1, то на проверку на переполнение и выход
	xor	al,al
cycl:	inc	si
	adc	summand_1[si],al	;все остальные байты складываем с нулем
	loop	cycl
end_o:	jnc	end_p	;проверка на переполнение
	adc	carry,0
end_p:
pop	ax
pop	si
pop	cx
	endm
mul_unsign_NM	macro	u,i,v,j,w
local	m2,m4,m6
;--------------------------------------------------------------------------------;
;mul_unsign_NM macro	u,i,v,j,w - макрокоманда умножения N-байтного числа на число размером M байт
;(порядок - младший байт по младшему адресу (Intel))
;Вход: U - адрес первого множителя; i - длина U; V - адрес второго множителя; j - длина V; W - адрес области размерностью i+j байт, куда необходимо поместить произведение; b=256 - размерность машинного слова.
;Выход: W - произведение размерностью i+j байт.
;--------------------------------------------------------------------------------;
	push	si
	push	cx
;очистим w
	push	ds
	pop	es
	xor	al,al
	lea	di,w
	mov	cx,i+j
rep	stosb
	xor	bx,bx	;j=0..m-1
	mov	cx,j
m2:
	push	cx	;вложенные циклы
	cmp	v[bx],0
	je	m6
	xor	si,si	;i=0..n-1
	mov	cx,i
	mov	k,0
m4:
	mov	al,u[si]
	mul	byte ptr v[bx]
	xor	dx,dx
	mov	dl,w[bx+si]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - временная переменная
	push	dx
	xor	dx,dx
	div	b	;t mod b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si],ah
	inc	si
	loop	m4
	mov	al,k
	mov	w[bx+si],al
m6:
	inc	bx
	pop	cx
	loop	m2
	pop	cx
	pop	si
	endm
.data
string	db	22 dup (0)	;максимальное число состоит из 20 цифр (22 - с учетом 0d0ah)
len_string=$-string
ten	dd	10
string_bin	db	10 dup (0)	;максимальная длина двоичного числа - 10 байт
len_string_bin=$-string_bin
carry	db	0	;перенос сложения последних байт
adr_string_bin	dd	string_bin
string_bin_w	db	len_string_bin+1 dup (0)	;результат умножения для макроса mul_unsign_NM = len_string_bin+1 байт
len_string_bin_w =$-string_bin_w
adr_string_bin_w	dd	string_bin_w
k	db	0	;перенос 0 Ј k < 255
b	dw	100h	;размер машинного слова
.code
main:
	mov	ax,@data	;адрес сегмента данных - в регистр ax
	mov	ds,ax	;ax в ds
	xor	edx,edx
;---------вводим десятичное число с клавиатуры---------------------------------------------
	mov	bx,0	;стандартный дескриптор - клавиатура
	mov	cx,len_string
	lea	dx,string	;формируем указатель на строку string
	mov	ah,3fh	;номер функции DOS
	int	21h
	jc	exit	;переход в случае ошибки
;в регистре AL - количество действительно введенных десятичных цифр
	mov	ecx,eax
	sub	ecx,2	; корректируем счетчик цикла (чтобы не учитывать 0d0ah, вводимые 3fh)
	jcxz	$+4	;число не было введено
	jmp	$+5	
	jmp	exit
cont_1:	dec	ecx	;не умножать на 10 последнюю цифру числа
	jcxz	$+4	;однозначное число
	jmp	$+5
	jmp	m2
	lea	si,string	;формируем указатель на строку string
	xor	eax,eax	;eax:=0
m1:
	xor	edx,edx
	mov	dl,[si]
	and	dl,0fh	;преобразуем ASCII->BCD
add_unsign_N_1	string_bin,dl, len_string_bin
;умножаем на 10
	mul_unsign_NM	string_bin, len_string_bin,ten,1, string_bin_w
;--------копируем string_bin_w в string_bin----------------------------------
	cld
push	si
push	cx
	lds	si,adr_string_bin_w
	les	di,adr_string_bin
	mov	cx,len_string_bin_w
rep	movsb
pop	cx
pop	si
;----------------------------------------------------------------------------
	inc	si
	dec	cx
	jcxz	m2
	jmp	m1
m2:
	mov	dl,[si]
	and	dl,0fh
add_unsign_N_1	string_bin,dl, len_string_bin
;результат преобразования - в строке string_bin
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main
