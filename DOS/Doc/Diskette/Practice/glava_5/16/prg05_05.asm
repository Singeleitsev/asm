;----------------------------------------------------------
;prg05_05.asm - программа для работы с окном на экране
;----------------------------------------------------------
masm
model small
.stack	256
.486
.data
string	db	"dfsh3453637869шогаерввапв"
len_string =$-string
adr_string	dd	string
.code
main:
	mov	ax,@data
	mov	ds,ax
	xor	dx,dx
	mov	cx,25
;----------------------------------------------------------------
m1:
	mov	al,1	;после вывода - курсор в конец строки
	xor	bh,bh	;номер видеостраницы
	mov	bl,7	;атрибут
push	cx
	mov	cx,len_string	;длина выводимой строки
	les	bp,adr_string	;адрес строки в пару ES:BP
	mov	ah,13h
	int	10h
	inc	dh	;строка начала вывода
	inc	dl	;столбец начала вывода
pop	cx
	loop	m1
;определяем и прокручиваем окно вверх
	mov	al,4	;4 строки
	mov	bh,0
;	mov	bh,01000000b	;красный фон
	mov	ch,5
	mov	cl,5
	mov	dh,10
	mov	dl,30
	mov	ah,06h
	int	10h
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main
