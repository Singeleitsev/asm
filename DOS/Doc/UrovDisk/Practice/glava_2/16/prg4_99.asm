;----------------------------------------------------------
;prg4_99.asm - Программа на ассемблере сортировки прямым выбором
;Вход: mas [n] - неупорядоченная последовательность 
;байтовых двоичных значений.
;Выход: mas [n] - упорядоченная последовательность 
;байтовых двоичных значений.
;----------------------------------------------------------
masm
model small
.data
;задаем массив
mas	db	44,55,12,42,94,18,06,67
n=$-mas
X	db	0
K	dw	0
.stack	256
.486
.code
;НАЧ_ПРОГ
main:
	mov	dx,@data
	mov	ds,dx
;ДЛЯ i:=1 ДО n-1 //i изменяется в диапазоне 1..n-1
;внешний цикл - по i
	mov	cx,n-1
	mov	si,0
;НАЧ_БЛОК_1
;//присвоение исходных значений для очередного шага
cycl1:
	push	cx
;k:=i; X:= mas[i]
	mov	k,si	;k:=i
	mov	al,mas[si]
	mov	x,al	;x:=mas[i]
	push	si	;временно сохраним i - теперь j=I+1
	inc	si	;j=I+1
;вложенный цикл - по j
	mov	al,n
	sub	ax,si
	mov	cx,ax	;количество повторений внутреннего цикла по j
;ДЛЯ j:=i+1 ДО n	//j изменяется в диапазоне i+1..n
cycl2:
;ЕСЛИ mas[j]<X ТО
;НАЧ_БЛОК_2
	mov	al,mas[si]
	cmp	al,x
	ja	m1
;k:=j; x:= mas[j]
	mov	k,si	;k:=j
;КОН_БЛОК_2
	mov	al,mas[si]
	mov	x,al	;x:=mas[k]
m1:	inc	si	;j:=j+1
	loop	cycl2
;mas[k]:= mas[i]; mas[i]:=X
	pop	si
	mov	al,mas[si]
	mov	di,k
	mov	mas[di],al	;mas[k]:=mas[i]
	mov	al,x
	mov	mas[si],al	;mas[i]:=x
	inc	si
	pop	cx
;КОН_БЛОК_1
	loop	cycl1
;выход
	mov	ax,4c00h
	int	21h
;КОН_ПРОГ
end	main
