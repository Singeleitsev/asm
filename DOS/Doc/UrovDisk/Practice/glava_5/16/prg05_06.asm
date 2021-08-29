;----------------------------------------------------------
;prg05_06.asm - программа ввода нескольких символов функцией 01h 21h
;----------------------------------------------------------
masm
model small
.stack	256
.486
.data
string	db	5 dup	(0)
len_string =$-string
adr_string	dd	string
.code
main:
	mov	ax,@data
	mov	ds,ax
	mov	cx,len_string
	les	di,adr_string
m1:
	mov	ah,01h
	int	21h
	cmp	al,0	;расширенный код???
	jne	m2
;обрабатываем расширенный код
;Е Е Е
	jmp	m3
m2:
	stosb	;формируем строку символов
m3:	loop	m1
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывани€ с номером 21h
end	main		;конец программы с точкой входа main
