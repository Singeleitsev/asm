;----------------------------------------------------------
;prg05_02.asm - программа на ассемблере для ввода строки с использований функции ввода символа 10h
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
	mov	ah,010h
	int	16h
	stosb
	loop	m1
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main
