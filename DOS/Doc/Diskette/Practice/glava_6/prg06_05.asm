;----------------------------------------------------------
;prg06_05.asm - программа ввода вещественных чисел.
;Вход: ввод с клавиатуры вещественного числа ? максимальное число состоит из 20 цифр (22 - с учетом 0d0ah).
;Выход: вещественное число в вершине стека сопроцессора - эквивалент своего исходного символьного представления.
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
push	ax
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
pop	ax
pop	cx
pop	si
	endm
.data
string	db	22 dup (0)	;максимальное число состоит из 20 цифр (22 - с учетом 0d0ah)
len_string=$-string
string_bin_dd	label	DWord
string_bin	db	10 dup (0)	;максимальное длина двоичного числа - 10 байт
len_string_bin=$-string_bin
carry	db	0	;перенос сложения последних байт
string_bin_w	db	len_string_bin+len_ten_bin dup (0)	;результат умножения для макроса mul_unsign_NM = len_string_bin+len_ten_bin байт
len_string_bin_w =$-string_bin_w
adr_string_bin	dd	string_bin
adr_string_bin_w	dd	string_bin_w
k	db	0	;перенос 0 Ј k < 255
b	dw	100h	;размер машинного слова
u_n	dw	0	;очередная цифра, введенная с клавиатуры
ten_bin	dd	10	;двоичное 10
len_ten_bin =$- ten_bin
ten	dd	10.0	;вещественное 10
.code
main:
	mov	ax,@data	;адрес сегмента данных в регистр ax
	mov	ds,ax	;ax в ds
	xor	edx,edx
;---------вводим вещественное число с клавиатуры---------------------------------------------
	mov	bx,0	;стандартный дескриптор - клавиатура
	mov	cx,len_string
	lea	dx,string	;формируем указатель на строку string
	mov	ah,3fh	;номер функции DOS
	int	21h
	jc	exit	;переход в случае ошибки
;в регистре AL - количество действительно введенных десятичных цифр
	mov	cx,ax
	sub	cx,2	; корректируем счетчик цикла (чтобы не учитывать 0d0ah, вводимые 3fh)
	jcxz	$+4	;число не было введено
	jmp	$+5
	jmp	exit
cont_1:	;правильное вещественное число (в формате xxx.xxxx) введено в строку string
;начинаем с преобразования дробной части и ее последней цифры:
	finit
	fld	ten	;10 ->st(0)
	fldz	;0->st(0), 10 ->st(1)
	lea	si,string	;формируем указатель на строку string (ds:si) для lodsb
	add	si,cx
	dec	si	;указатель на последний символ строки string
	std	;обработка строки string с конца
	xor	ax,ax
m1:
	lodsb
	cmp	al,"."
	je	m2	;переход, если встретился символ "."
	and	al,0fh	;преобразуем ASCII->BCD
	mov	u_n,ax
	fiadd	u_n	;складываем очередную цифру и значение в стеке сопроцессора
	fdiv	st(0),st(1)	;делим значение в вершине стека на 10
	dec	cx
	jmp	m1
m2:
;преобразуем целую часть
	sub	cx,2	;игнорируем символ плавающей точки в строке string и не умножаем на 10 последнюю цифру целой части
	jcxz	$+4	;однозначная целая часть
	jmp	$+5
	jmp	m3
	lea	si,string	;формируем указатель на строку string (ds:si)
	cld	;обработка целой части с начала строки
m4:
	lodsb
	and	al,0fh	;преобразуем ASCII->BCD
	add_unsign_N_1	string_bin,al, len_string_bin
;умножаем на 10 размером двойное слово
	mul_unsign_NM	string_bin, len_string_bin,ten_bin, len_ten_bin, string_bin_w
;--------копируем string_bin_w в string_bin----------------------------------
push	si
push	cx
	lds	si,adr_string_bin_w
	les	di,adr_string_bin
	mov	cx,len_string_bin_w
rep	movsb
pop	cx
pop	si
;----------------------------------------------------------------------------
	dec	cx
	jcxz	m3
	jmp	m4
m3:
	mov	al,[si]
	and	al,0fh
add_unsign_N_1	string_bin,al, len_string_bin
;результат преобразования в строке string_bin
;складываем его с содержимым вершины сопроцессора
	fiadd	string_bin_dd	;результат преобразования в сопроцессоре
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main
