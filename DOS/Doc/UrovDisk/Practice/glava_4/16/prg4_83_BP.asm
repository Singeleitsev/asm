;--------------------------------------------------------------------------------;
;prg4_83_BP.asm - программа на ассемблере поиска строки P в строке S по алгоритму БМ-поиска. Длина S фиксирована.
;Вход: S и P - массивы символов размером N и M байт (M=<N).
;Выход: сообщение о количестве вхождений строки P в строку S.
;--------------------------------------------------------------------------------;
masm
model small
.data
mes	db	0dh,0ah,"Вхождений строки - "
;задаем массив P - аргумент поиска
p	db	"ab"
Len_P=$-p	;M=Len_P
	db	" - в строку - "
;задаем массив S
s	db	"fgcabceabcaab"
Len_S=$-s	;N=Len_S
	db	" - "
Count	db	0	;счетчик вхождений P в S
	Db	" раз(а)$"
d	db	255 dup (0)	;вспомогательный массив
k	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
push	ds
pop	es
;этап 1 - заполнение массива D
;заполняем элементы массива d значением M - размером образца для поиска
;ДЛЯ j=0 ДО 255 ДЕЛАТЬ
;НАЧ_БЛОК_1
;d[j]:=M
;КОН_БЛОК_1
	mov	cx,255	;размер кодовой таблицы ASCII
	mov	al,len_p
	lea	di,d
rep	stosb
;цикл просмотра образца и замещение некоторых элементов d значениями смещений 
;(см. пояснение за текстом программы)
;ДЛЯ j=0 ДО M-2 ДЕЛАТЬ
;НАЧ_БЛОК_1
;d[p[j]]:=M-j-1
;КОН_БЛОК_1
	xor	si,si	;j:=0
cycl1:
	cmp	si,len_p-1
	jge	e_cycl1
	mov	al,p[si]
	mov	di,ax
	mov	bl,len_p
	dec	bl
	sub	bx,si
	mov	d[di],bl
	inc	si
	jmp	cycl1
e_cycl1:
;//этап 2: поиск
;i:=M
	mov	di,len_p	;I:=M
;ПОВТОРИТЬ
;j:=M; k:=i
;цикл пока (j>=0)ИЛИ(I<n)
cycl2:
	mov	si,len_p	;j:=M
	mov	bx,di	;k:=I
;ПОВТОРИТЬ
;K:=k-1;j:=j-1
;ПОКА (j>=0)ИЛИ(p[j]==s[k])
;цикл пока (j>=0)ИЛИ(p[j]==p[k])
cycl3:
	dec	bx	;k:=k-1
	dec	si	;j:=j-1
;цикл пока (j>=0)ИЛИ(p[j]==p[k])
	cmp	si,0
	jl	m2
	mov	al,p[si]
	cmp	s[bx],al
	jne	m2
	jmp	cycl3
m2:
;i:=i+d[s[i-1]]
push	di
	dec	di
	mov	al,s[di]
	mov	di,ax
	mov	al,d[di]
pop	di
	add	di,ax	;I:=I+d[s[I-1]]
;ПОКА (j>=0)ИЛИ(i<N)
;цикл пока (j>=0)ИЛИ(I<n)
	cmp	si,0
	jl	m1
	cmp	di,len_s
	jg	exit_f
	jmp	cycl2
;ЕСЛИ j<0 ТО вывод сообщения об удаче поиска
;ИНАЧЕ вывод сообщения о неудаче поиска
m1:
;вывод сообщения о результатах поиска
	inc	count
	jmp	cycl2
exit_f:
	add	count,30h
	lea	dx,mes
	mov	ah,09h
	int	21h
exit:
;КОН_ПРОГ
;выход
	mov	ax,4c00h
	int	21h
end	main
