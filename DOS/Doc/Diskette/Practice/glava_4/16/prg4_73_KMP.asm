;--------------------------------------------------------------------------------;
;prg4_73_KMP.asm - программа на ассемблере поиска строки P в строке S по алгоритму КМП-поиска. Длина S фиксирована.
;Вход: S и P - массивы символов размером N и M байт (M=<N).
;Выход: сообщение о количестве вхождений строки P в строку S.
;--------------------------------------------------------------------------------;
masm
model small
.data
;задаем массив S
s	db	"fgcabefabcaabcdabc!bdededegjfkababcdabcecabeabcdabcej;koiabcabe"
Len_S=$-s	;N=Len_S
	Db	"$"
mes	db	0dh,0ah,"Вхождений строки - "
;задаем массив P - аргумент поиска
p	db	"abcdabce"
Len_P=$-p	;M=Len_P
	db	" - "
Count	db	0,"$"	;счетчик вхождений P в S
d	db	Len_p dup (0)	;массив смещений
k	db	0
.stack	256
.486
.code
main:
;НАЧ_ПРОГ
	mov	dx,@data
	mov	ds,dx
push	ds
pop	es
;этап 1 - заполнение массива смещений
;j:=0; k:=-1; d[0]:=-1
	xor	si,si	;si - это j
	mov	k,-1
	mov	d,-1
;ПОКА j<M-1 ДЕЛАТЬ
;НАЧ_БЛОК_1
cycl1:
	cmp	si,len_p-1	; j<M-1
	jge	exit_d
;ПОКА ((k>=0)И(p[j]<>p[k])) k:=d[k]
	cmp	k,0
	jl	falsee
	mov	bl,k
	mov	al,p[si]
	cmp	al,p[bx]
	je	falsee
	mov	bl,d[bx]
	mov	k,bl	;k:=d[k]
	jmp	cycl1
falsee:
;j:=j+1; k:=k+1
	inc	si	;j:=j+1
	inc	k
	mov	bl,k
;ЕСЛИ p[j]==p[k] ТО d[j]:=d[k]
	mov	al,p[si]
	cmp	al,p[bx]
	jne	elsee
	mov	al,d[bx]
	mov	d[si],al
	jmp	cycl1	;$+6
elsee:
;ИНАЧЕ d[j]:=k
	mov	d[si],bl
	jmp	cycl1
;КОН_БЛОК_1
exit_d:
;этап 2: поиск
;i:=0; j:=0; k:=0
	xor	di,di	;i:=0
	xor	si,si	;j:=0
;ПОКА ((j<M)И(i<N)) ДЕЛАТЬ
m3:	cmp	si,Len_p
	jge	m1
m34:	cmp	di,Len_s
	jge	m1
;НАЧ_БЛОК_1
;ПОКА ((j>=0)И(s[i]<>p[j])) j:=d[j]
	cmp	si,0
	jl	m4
	mov	al,s[di]
	cmp	al,p[si]
	je	m4
	mov	al,d[si]
	cbw
	mov	si,ax
;j:=j+1; i:=i+1
m4:
	inc	si
	inc	di
	jmp	m3
;КОН_БЛОК_1
;ЕСЛИ j=M ТО вывод сообщения об удаче поиска
;ИНАЧЕ вывод сообщения о неудаче поиска
m1:
;вывод сообщения о результатах поиска
	cmp	si,len_p
	jne	exit_f	;не нашли
	inc	count
	cmp	di,len_s
	jge	exit_f
	xor	si,si
	jmp	m34
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
