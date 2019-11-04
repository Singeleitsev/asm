;--------------------------------------------------------------------------------;
;prg4_67_f.asm - поиск строки P в строке S. Длина S фиксирована.
;Вход: S и P - массивы символов размером N и M байт (M=<N).
;Выход: сообщение о количестве вхождений строки P в строку S.
;--------------------------------------------------------------------------------;
masm
model small
.data
;задаем массив S
s	db	"Ax, какой был яркий день! Лодка, солнце, блеск и тень, и везде цвела сирень."
Len_S=$-s
	Db	"$"
mes	db	"Вхождений строки - "
;задаем массив P - аргумент поиска
p	db	"ень"
Len_P=$-p
	db	" - "
Count	db	0,"$"	;счетчик вхождений P в S
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
push	ds
pop	es
	cld
	mov	cx,len_s
	lea	di,s
	mov	al,p	;P[0]->al
next_search:
	lea	si,p
	inc	si	;на следующий символ
repne	scasb
	jcxz	exit
push	cx
	mov	cx,len_p-1
repe	cmpsb
	jz	eq_substr
;строка p <> подстроке в s
	mov	bx,len_p-1
	sub	bx,cx
pop	cx
	sub	cx,bx	;учли пройденное при сравнении cmpsb
	jmp	next_search
eq_substr:
;далее можно выйти, если поиск однократный, но мы упорные, поэтому продолжаем…
pop	cx
	sub	cx,len_p-1	;учли пройденное при сравнении cmpsb
	inc	count
	jmp	next_search
exit:
	add	count,30h
	lea	dx,mes
	mov	ah,9
	int	21h
;выход
	mov	ax,4c00h
	int	21h
end	main
