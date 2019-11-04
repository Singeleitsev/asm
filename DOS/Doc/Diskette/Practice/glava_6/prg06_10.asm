;----------------------------------------------------------
;prg06_10.asm - программа вывода вещественного числа короткого формата (32 бита).
;Вход: выводимое значение - в поле float32.
;Выход: вывод вещественного числа короткого формата на экран
;----------------------------------------------------------
%TITLE "выделение мантиссы из короткого формата (32бита) положительного вещественного числа"
;программа написана студентом Пашковым Алексеем
.586
masm
model   use16 small
.stack  256h
.data
dec_bin_mant32	dt	0	;мантисса в двоично-десятичном представлении
dec_bin_har32	dt	0	;характеристика в двоично-десятичном представлении
cwr	dw	0	;переменная для сохранения состояния рег. cwr
ten	dw	10	;константа равная 10
float32	dd	1.2345678e12	;значение вещ. числа размером в 32 бита для вывода
mant32	dd	0	;мантисса в двоичном представлении
har32	dd	0	;характеристика - вещ. формат в двоичном представлении
int_har32	dd	0	;характеристика - целое в двоичном представлении
number	db	0
char	db	0
cursor_column	db	0
cursor_line	db	0
number_of_digits	db	9
flag	db	0
.code
next_cursor_column	proc	;процедура сдвига курсора на одну позицию вправо
;обязательно наличие в программе процедур:;read_cursor_position, set_cursor_position
        next_cursor_column proc
                push	ax

                call		read_cursor_position
                inc		cursor_column
                call		set_cursor_position

                pop     	ax
                ret
next_cursor_column	endp
set_cursor_position	proc	;процедура позиционирования курсора
;входные параметры
;db cursor_line - строка
;db cursor_column - колонка
		push	ax
		push	dx
		
                mov		ah,02h
                mov		dh,cursor_line
                mov		dl,cursor_column
                int		10h

                pop		dx
                pop     	ax
                ret
set_cursor_position	endp
read_cursor_position	proc	;процедура определения текущей позиции курсора 
;выходные данные
;db cursor_line - строка
;db cursor_column - колонка
        	push	ax
        	push    	bx
		push    	dx
		
		mov		ah,03h
		mov		bh,00h
		int		10h
		
		mov		cursor_line,dh
		mov		cursor_column,dl
		
		pop		dx
		pop		bx
		pop 		ax
		ret
read_cursor_position	endp
print_char	proc	;процедура вывода символа с учетом цвета 
;входные параметры
;char - выводимый символ
                push	ax
                push	dx

                mov		al,char		;заносим в al цифру
                mov		ah,09h          ;номер процедуры BIOS
                mov		bl,0Fh          ;выбор цвета
                mov		cx,01h          ;количество повторений
                int		10h             ;вызов процедуры BIOS

                pop		dx
                pop		ax
                ret
print_char	endp
positive_har	proc
;выделение мантиссы из короткого формата (32бита) и ее преобразование в двоично-десятичный формат (для положительной характеристики
;результат в st(0))
	fimul	ten
	sub	int_har32,6
lab_p_h:
fidiv	ten
	cmp	int_har32,0
	dec	int_har32
	jg	lab_p_h
	ret
positive_har	endp
;------------------------------------------------------------------------
negative_har	proc
;выделение мантиссы из короткого формата (32бита) и ее преобразование в двоично-десятичный формат (для отрицательной характеристики результат в st(0))
	fidiv	ten
	sub	int_har32,7
lab_n_h:
	fimul	ten
	cmp	int_har32,0
	inc	int_har32
	jl	lab_n_h
	ret
negative_har	endp
;-----------------------------------------------------------------------
;вывод вещественного числа (32бита) в десятичном виде
fprint32	proc
	pusha
;установка размера мантиссы в 24 бита
	fstcw	cwr
	and	cwr,1111000011111111b
	or	cwr,1111000011111111b
	fldcw	cwr
	fld	float32	;загрузка 32-bit числа в стек сопроцессора
	fxtract	;выделение мантиссы(st0) и характеристики(st1)
	fstp	mant32	;запоминаем мантиссу
	fist	har32	;запоминаем характеристику
;перевод двоичн. характеристики в дес. характеристику
	fldlg2	;загрузка десят лог двух
	fimul	har32	;умножение двоичной хар-ки на log10(2)
	frndint	;округление
	fistp	int_har32	;сохранение десетяч характеристики
	fild	int_har32
	fbstp	dec_bin_har32	;сохранение двоично-десятичного значения харктеристики
;выбор процедуры по выделению мантиссы
	fld	float32
	cmp	har32,0
	jge	case1
	call	negative_har	;вызвать процедуру преобразования мантиссы, если хар-ка отрицательная
	jmp	end_case
case1:
	call	positive_har	;вызвать процедуру преобразования мантиссы, если хар-ка положительная
end_case:
	fbstp	dec_bin_mant32	;сохранение двоично-десятичного представления мантиссы
;вывод на экран вещественного числа
	lea	si,dec_bin_mant32
	add	si,9
	mov	al,[si]
;вывод знака числа
	cmp	al,0
	je	zero
	mov	char,"-"
	call	print_char
	call	next_cursor_column
;данный фрагмент пропускает байты с нулевым содержимым до первого байта со значащей цифрой 
zero:
	dec	si
	dec	number_of_digits
	mov	al,[si]
	cmp	al,0
	jne	first_zero	;найден первый байт со значением, отличным от нуля
	jmp	zero	;байт имеет нулевое значение - продолжаем поиск
;просмотр полубайтов первого найденного байта с ненулевым значением
first_zero:
	and	al,11110000b
	cmp	al,0
	je	second_digit	;если старший полубайт байта равен нулю, начинаем вывод со второго байта
	jmp	first_digit	;если старший полубайт байта не равен нулю, начинаем вывод с первого байта
;начало цикла вывода мантиссы
print_digits:
	dec	si
	dec	number_of_digits	;индекс выводимого байта
	mov	al,[si]
;вывод первого полубайта, содержащего цифру
first_digit:
	and	al,11110000b
	shr	al,4
	add	al,30h
	mov	char,al
	call	print_char
	call	next_cursor_column
;если выводимая цифра первая, то выводим после нее точку
	cmp	flag,0
	jne	second_digit
	mov	char,"."
	call	print_char
	call	next_cursor_column
	inc	flag
;вывод второго полубайта, содержащего цифру
second_digit:
	mov	al,[si]
	and	al,00001111b
	add	al,30h
	mov	char,al
	call	print_char
	call	next_cursor_column
;если выводимая цифра первая, то выводим после нее точку
	cmp	flag,0
	jne	nonfirst_digit
	mov	char,"."
	call	print_char
	call	next_cursor_column
	inc	flag
nonfirst_digit:
	cmp	number_of_digits,0
	jne	print_digits
	mov	flag,0
;вывод характиристики числа
	mov	char,"E"
	call	print_char
	call	next_cursor_column
	lea	si,dec_bin_har32
;вывод знака числа
	add	si,9
	mov	al,[si]
	cmp	al,0
	je	print_har
	mov	char,"-"
	call	print_char
	call	next_cursor_column
;значения характеристики
print_har:
	sub	si,9
	mov	al,[si]
;вывод первой цифры характеристики
	and	al,11110000b
	shr	al,4
	add	al,30h
	mov	char,al
	call	print_char
	call	next_cursor_column
;вывод второй цифры характеристики
	mov	al,[si]
	and	al,00001111b
	add	al,30h
	mov	char,al
	call	print_char
	call	next_cursor_column
	mov	flag,0
	popa
	ret
fprint32	endp

main	proc
	mov	ax,@data
	mov	ds,ax
	call	fprint32
exit:
	mov	ax,4c00h
	int	21h
main	endp
end	main
