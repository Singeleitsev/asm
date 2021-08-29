;----------------------------------------------------------
;prg05_08.asm - программа посимвольного вывода строки функцией 02h int 21h
;----------------------------------------------------------
masm
model small
.stack	256
.486
.data
string	db	"Строка для вывода функцией 02h"
len_string=$-string
.code
main:
	mov	ax,@data
	mov	ds,ax
;выводим строку string на экран
	mov	cx,len_string	;длину строки
	lea	si,string	;адрес строки
	mov	ah,02h
m1:	mov	dl,byte ptr	[si]
	int	21h
	inc	si
	loop	m1
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main
