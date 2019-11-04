;----------------------------------------------------------
;prg05_03_01.asm - программа, помещающая символы в буфер клавиатуры
;----------------------------------------------------------
;prog_1.asm
masm
model small
.stack	256
.486
.data
str	db	"dfsh",0
.code
main:
	mov	ax,@data
	mov	ds,ax
	lea	di,str
	xor	cx,cx
m1:
	mov	ah,05h
	mov	cl,byte ptr [di]
	jcxz	exit
	int	16h
	inc	di
	jmp	m1
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main
