;----------------------------------------------------------
;prg02_06.asm - программа на ассемблере демонстрации работы с упорядоченной таблицей
;Вход: 10 слов, вводимых с клавиатуры. Длина слов - не более 20 символов.
;Выход: вывод на экран элемента таблицы, содержащего первое из слов длиной 5 символов, удаление этого элемента из таблицы и вставка в нее нового слова, введенного с клавиатуры.
;----------------------------------------------------------
masm
model small
element_tab	struc
len	db	0	;длина слова
simv_id	db	20 dup (20h)	;само слово
ends
buf_0ah	struc
len_buf	db	24	;длина buf_0ah
len_in	db	0	;действительная длина введенного слова (без учета 0dh)
buf_in	db	21 dup (20h)	;буфер для ввода (с учетом 0dh)
ends
s_movsb	macro	out_str,in_str,len_movs
;макрос пересылки строк:
;in_str - откуда
;out_str - куда
;len_movs - сколько пересылать
push	cx
push	si
push	di
	lea	si,in_str	;откуда пересылать
	lea	di,out_str	;куда пересылать
	mov	cx,len_movs	;сколько пересылать
rep	movsb	;пересылаем строку
pop	di
pop	si
pop	cx
	ENDM
.data
;таблица обязательно д.б. расположена в начале сегмента данных,
;если это не так, то необходимо изменить программу
tab	element_tab	10 dup (<>)
len_tab=$-tab
buf	buf_0ah	<>
key	db	5
prev	element_tab	<>	;предыдущий элемент
x	element_tab	<>	;временная переменная для сортировки
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;вводим слова с клавиатуры
	lea	di,tab
	lea	si,buf.buf_in
	mov	cx,10
	lea	dx,buf
	mov	ah,0ah
push	ds
pop	es
m1:
push	cx	;1
push	si	;2
push	di	;3
	int	21h
	mov	cl,buf.len_in
	mov	[di].len,cl	;длина слова -> tab.length
	add	di,simv_id
rep	movsb	;пересылка слова в элемент таблицы
pop	di	;3
pop	si	;2
pop	cx	;1
	add	di,type element_tab
	loop	m1
;упорядочиваем таблицу методом пузырьковой сортировки
;внешний цикл - по i
n=10
	mov	cx,n-1
	mov	si,1
@@cycl1:
push	cx	;-1-
	mov	cx,n
	sub	cx,si	;количество повторений внутреннего цикла
push	si	;-2- временно сохраним i - теперь j=n
	mov	si,n-1
@@cycl2:
push	si	;-3-
	mov	ax,type element_tab
	mul	si
	mov	si,ax
	mov	di,si
	sub	di,type element_tab	;в di адрес предыдущей записи
	mov	al,[di].len
	cmp	[si].len,al	;сравниваем последующий с предыдущим
	ja	@@m1
;обмениваем
	s_movsb	x,[di],<type element_tab>	;x=mas[j-1]
	s_movsb	[di],[si],<type element_tab>	;mas[j-1]=mas[j]
;mas[j]=x
push	cx
	mov	cx,type element_tab	;сколько пересылать
	mov	di,si
	lea	si,x	;откуда пересылать
rep	movsb	;пересылаем строку
pop	cx
@@m1:
pop	si	;-3-
	dec	si	;цикл по j с декрементом n-i раз
	loop	@@cycl2
pop	si	;2
	inc	si
pop	cx	;1
	dec	cx
	jcxz	m2
	jmp	@@cycl1
m2:
;ищем элемент путем двоичного поиска
;в si и di индексы первого и последнего элементов последней просматриевой части последовательности:
	mov	si,0
	mov	di,n-1
;получим центральный индекс:
cont_search:
	cmp	si,di	;проверка на окончание (неуспешное):si>di
	ja	exit
	mov	bx,si
	add	bx,di
	shr	bx,1	;делим на 2
push	bx	;1
	mov	ax,type element_tab
	mul	bx
	mov	bx,ax
	mov	al,key	;искомое значение в ax
	cmp	[bx].len,al	;сравниваем с искомым значением
	je	@@m4	;искомое значение найдено
	ja	@@m3	;[bx].len>k
;[bx].len<k:
pop	bx	;1
	mov	si,bx
	inc	si
	jmp	cont_search
@@m3:
pop	bx	;1
	mov	di,bx
	dec	di
	jmp	cont_search
@@m4:
	mov	ax,type element_tab
	mul	si
	mov	si,ax
;конец поиска - в si адрес элемента таблицы со словом длиной 5 байт
;выводим его на экран
;преобразуем длину в символьный вид:
	mov	al,[si].len
	xor	cx,cx
	mov	cl,al	;длина для movsb
	aam
	or	ax,03030h	;в ax длина в символьном виде
	mov	buf.len_buf,ah
	mov	buf.len_in,al
push	si	;-1- сохраним указатель на эту запись
	add	si,simv_id
	lea	di,buf.buf_in
rep	movsb
	mov	byte ptr [di],'$'	;конец строки для вывода 09h (int 21h)
;теперь выводим:
	lea	dx,buf
	mov	ah,09h
	int	21h
;удаляем запись
pop	si	;-1- восстановим указатель на удаляемую запись
	mov	di,si
	add	si,type element_tab
	mov	cx,len_tab
	sub	cx,si	;в cx сколько пересылать
rep	movsb
;обнуляем последнюю запись
	xor	al,al
	mov	cx,type element_tab
rep	stosb
;вводим слово с клавиатуры:
insert:
;вводим словo с клавиатуры
	lea	dx,buf
	mov	ah,0ah
	int	21h
;с помощью линейного поиска ищем место вставки, в котором выполняется условие buf.len_in=<[si].len
	lea	si,tab
	mov	al,buf.len_in
@@m5:
	cmp	al,[si].len
	jbe	@@m6
;	jb	@@m7
	add	si,type element_tab
	jmp	@@m5
;@@m7:
;	sub	si,type element_tab
@@m6:
push	si	;-1- сохраняем место вставки
;раздвигаем таблицу, последний элемент теряется
	add	si,type element_tab
	mov	cx,len_tab
	sub	cx,si	;сколько пересылать
std
	lea	si,tab
	add	si,len_tab
	mov	di,si
	sub	si,type element_tab
rep	movsb
cld
;формируем и вставляем новый элемент
pop	di	;-1- восстанавливаем место вставки
;обнуляем место вставки
push	di	;-1-
	xor	al,al
	mov	cx,type element_tab
rep	stosb
pop	di	;-1-
	lea	si,buf.buf_in
	mov	cl,buf.len_in
	mov	[di].len,cl
	add	di,simv_id
rep	movsb
exit:
	mov	ax,4c00h
	int	21h
end	main
