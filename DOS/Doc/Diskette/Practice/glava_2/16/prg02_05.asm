;----------------------------------------------------------
;prg02_05.asm - программа на ассемблере демонстрации работы с неупорядоченной таблицей
;Вход: файл maket.txt с идентификаторами, среди которых присутствуют десятичные и шестнадцатеричные константы.
;Выход: вывод информации о десятичных константах на экран.
;----------------------------------------------------------
masm
model small
state_tab	struc
last_off	dw	0	;адрес первого байта за концом таблицы
elem_free	dw	0	;адрес первого свободного элемента (0ffffh - все занято)
ends
constant	struc
state	db	0	;поле состояния элемента таблицы
	db	02dh	;форматирование вывода на экран
key	db	10 dup (' ')	;ключ, он же значение константы
	db	02dh	;форматирование вывода на экран
line	db	2 dup (' ')	;строка файла, в которой встретилась константа
end_line	db	0dh,0ah,'$'	;для удобства вывода на экран
ends
.data
s_tab	state_tab	<>
tab	constant	19 dup (<>)
	constant	<8,>	;последний элемент таблицы - бит 3=1
end_tab=$-tab
filename	db	'maket.txt',0
handle	dw	0	;дескриптор файла
buf	db	240 dup (' ')
xlat_tab	db	0dh dup (00),0dh	;признак конца строки
	db	'0'-0eh dup (0)
	db	':'-'0'+1 dup ('0')		;признак цифры 0..9
	db	'H'-':' dup (0), ''	;признак буквы 'H'
	db	'h'-'H' dup (0), 'h'	;признак буквы 'h'
	db	0ffh-'h' dup (00)
cur_line	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;открываем файл
	mov	ah,3dh
	mov	dx,offset filename
	int	21h
	jc	exit	;ошибка (cf=1)
	mov	handle,ax
;читаем файл:
	mov	ah,3fh	;функция установки указателя
	mov	bx,handle
	mov	cx,240	;читаем максимум 240 байт
	lea	dx,buf
	int	21h
	jc	exit
	mov	cx,ax	;фактическая длина файла в cx
;инициализируем дескриптор таблицы s_tab
	lea	si,tab	;адрес таблицы в si
	mov	s_tab.elem_free,si	;первый элемент таблицы - свободен
	add	si,end_tab
	mov	s_tab.last_off,si	;адрес первого байта за концом таблицы
	lea	bx,xlat_tab
	lea	di,buf
;сканируем до первого пробела:
push	ds
pop	es
cycl1:
	mov	al, ' '
repne	scasb	;сканирование до первого пробела
	jcxz	displ	;цепочка отсканирована => таблица заполнена
push	cx
;классифицируем символ после пробела (команда xlat):
	mov	al,[di]
	xlat
	cmp	al, '0'	;первый символ после пробела - 0
	je	m1
	cmp	al,0dh	;первый символ после пробела - 0dh
	je	m2
;все остальное либо идентификаторы, либо неверно записанные числа
pop	cx
	jmp	cycl1
m1:
;первый символ после пробела - 0..9:
	mov	si,di	;откуда пересылать
	mov	al, ' '
push	di
repne	scasb	;сканирование до первого пробела
	mov	cx,di
	dec	cx
	sub	cx,si	;сколько пересылать
	lea	di,tab
	cmp	s_tab.elem_free,0ffffh	;есть свободные элементы ?
	je	displ	; свободных элементов нет
	mov	di,s_tab.elem_free	;адрес первого свободного элемента
push	di
	lea	di,[di].key
rep	movsb	;пересылаем в элемент таблицы
	dec	di
;Какого типа это константа?
	cmp	byte ptr [di],'h'
pop	di
	je	m4
	and	[di].state,0fbh	;десятичная константа
	jmp	$+5
m4:	or	[di].state,100b	;шестнадцатеричная константа
	mov	al,cur_line	;текущий номер строки в al
	aam	;преобразуем в символьное представление
	or	ah,030h
	mov	[di].line,ah
	or	al,030h
	mov	[di+1].line,al	;и в элемент таблицы
	or	[di].state,1b	;помечаем элемент как используемый
;теперь нужно поместить в поле s_tab.elem_free адрес нового свободного элемента
m5:	cmp	di,s_tab.last_off
	ja	displ
	add	di,type constant	;к следующему элементу
	test	[di].state,1b
	jnz	m5	;используется => к следующему элементу
	mov	s_tab.elem_free,di
pop	di
pop	cx
	jmp	cycl1
m2:	;увеличить номер строки
	inc	cur_line
	jmp	cycl1
displ:
;отображение на экране элементов таблицы
	lea	di,tab
m6:
	test	[di].state,100b
	jnz	m7
;выводим на экран строку
	mov	ah,9
	mov	dx,di
	int	21h
m7:
	add	di,type constant
	cmp	di,s_tab.last_off
	jb	m6
exit:
	mov	ax,4c00h
	int	21h
end	main
