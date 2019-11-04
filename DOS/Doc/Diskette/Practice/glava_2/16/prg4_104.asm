;----------------------------------------------------------
;prg4_104.asm - программа на ассемблере сортировки прямым выбором 2 (шейкерной)
;Вход: mas [n] - неупорядоченная последовательность байтовых двоичных значений.
;Выход: mas [n] - упорядоченная последовательность байтовых двоичных значений.
;----------------------------------------------------------
masm
model small
.data
;задаем массив
mas	db	44,55,12,42,94,18,06,67
n=$-mas
X	db	0
L	dw	1
R	dw	n
k	dw	n
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;l:=2; r:=n; k:=n
;ПОВТОРИТЬ
cycl3:
;ДЛЯ j:=r ДОВНИЗ l
	mov	si,R	;j:=R
	push	si
	sub	si,L
	mov	cx,si	;количество повторений цикла cycl1
	pop	si
	dec	si
cycl1:
;ЕСЛИ mas[j-1]< mas[j] ТО
	mov	al,mas[si-1]
	cmp	al,mas[si]
	jna	m1
;НАЧ_БЛОК_1
;x:=mas[j-1]; mas[j-1]:=mas[j]; mas[j]:=X; k:=j
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j-1]
	mov	al,mas[si]
	mov	mas[si-1],al	;mas[j-1]:=mas[j]
	mov	al,x
	mov	mas[si],al	;mas[j]:=x
	mov	k,si	;k:=j
m1:	dec	si	;j:=j-1
;КОН_БЛОК_1
	loop	cycl1
	mov	ax,k
	inc	ax
	mov	L,ax	;L:=k+1
; цикл cycl2
;ДЛЯ j:=l ДОВНИЗ r
	mov	si,L	;j:=L
	mov	ax,R
	sub	ax,L
	mov	cx,ax	;количество повторений цикла cycl2
cycl2:
;ЕСЛИ mas[j-1]< mas[j] ТО
	mov	al,mas[si-1]
	cmp	al,mas[si]
	jna	m2
;НАЧ_БЛОК_2
;x:=mas[j-1]; mas[j-1]:=mas[j]; mas[j]:=X; k:=j
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j-1]
	mov	al,mas[si]
	mov	mas[si-1],al	;mas[j-1]:=mas[j]
	mov	al,x
	mov	mas[si],al	;mas[j]:=x
	mov	k,si	;k:=j
m2:	inc	si	;j:=j+1
;КОН_БЛОК_2
	loop	cycl2
;r:=k-1
	mov	ax,k
	dec	ax
	mov	R,ax	;R:=k-1
;ПОКА (l>r)
	cmp	L,ax	;L>R ? ?
	jae	exit
	jmp	cycl3
exit:	;выход
	mov	ax,4c00h
	int	21h
end	main
