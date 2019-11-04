;----------------------------------------------------------
;prg4_107.asm - программа на ассемблере сортировки Шелла
;Вход: mas_dist[]=(7,5,3,1) - массив смещений; mas[n] - неупорядоченная последовательность байтовых двоичных значений.
;Выход: mas[n] - упорядоченная последовательность байтовых двоичных значений.
;----------------------------------------------------------
masm
model small
.data
;задаем массив
mas	db	44,55,12,42,94,18,06,67
n=$-mas
X	db	0
;задаем массив расстояний
mas_dist	db	7,5,3,1
t=$-mas_dist	;t - количество элементов в массиве расстояний
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
	xor	bx,bx	;в bx - очередное смещение из mas_dist[]
;d1
;ДЛЯ s:=0 ДО t-1
	mov	cx,t	;цикл по t (внешний)
	mov	si,0	;индекс по mas_dist[]
@@d2:
;НАЧ_БЛОК_1
push	cx
;h:=mas_dist[s]
	mov	bl,mas_dist[si] 	;в bx - очередное смещение из mas_dist[]
	inc	si
push	si
;ДЛЯ j:=h ДО n-1
	mov	di,bx	;di - это j
;j:=h+1 - это неявно для нумерации массива с нуля
;	inc	di	;j:=h+1
@@d3:
	cmp	di,n-1	;j=<n ?
	ja	@@m1	;конец итерации при очередном mas_dist[]
;НАЧ_БЛОК_2
;i:=j-h; X:=mas[i]
	mov	si,di
	sub	si,bx	;i:=j-h; si - это i
	mov	al,mas[di]	;x:=mas[j]
	mov	x,al	;x:=mas[j]
;@@d4:
;ЕСЛИ X>= mas[i] ТО ПЕРЕЙТИ_НА @@d6
@@d4:
	mov	al,x
	cmp	al,mas[si]
	jae	@@d6
;d5
;mas[i+h]:=mas[i]; i:=i-h
push	di
push	si
pop	di
	add	di,bx	;i+h
	mov	al, mas[si]	;mas[i+h]:=mas[i]
	mov	mas[di],al	;mas[i+h]:=mas[i]
pop	di
	sub	si,bx	;i:=i-h
;ЕСЛИ i>0 ТО ПЕРЕЙТИ_НА @@d4
	cmp	si,0
	jg	@@d4
;@@d6:
;mas[i+h]:=x
@@d6:
push	di
push	si
pop	di
	add	di,bx	;i+h
	mov	al,x
	mov	mas[di],al	;mas[i+h]:=x
pop	di
	inc	di	;j:=j+1
	jmp	@@d3
;КОН_БЛОК_2
@@m1:
pop	si
pop	cx
;КОН_БЛОК_1
	loop	@@d2
@@exit:
	mov	ax,4c00h
	int	21h
end	main
