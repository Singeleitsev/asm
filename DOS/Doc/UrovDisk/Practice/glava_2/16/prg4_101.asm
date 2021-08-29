;----------------------------------------------------------
;prg4_101.asm - программа на ассемблере сортировки прямым выбором 1
;Вход: mas [n] - неупорядоченная последовательность 
;байтовых двоичных значений.
;Выход: mas [n] - упорядоченная последовательность байтовых 
;двоичных значений.
;----------------------------------------------------------
masm
model small
.data
;задаем массив
mas	db	44,55,12,42,94,18,06,67
n=$-mas
X	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;внешний цикл - по i
;ДЛЯ i:=1 ДО n-1	//i изменяется в диапазоне 1..n-1
	mov	cx,n-1
	mov	si,1
;НАЧ_БЛОК_1
cycl1:
;ДЛЯ j:=n-1 ДОВНИЗ i	//j изменяется в диапазоне i+1..n
	push	cx
	mov	cx,n
	sub	cx,si	;количество повторений внутреннего цикла
	push	si	;временно сохраним i - теперь j=n
	mov	si,n-1
cycl2:
;ЕСЛИ mas[j-1]< mas[j] ТО
	mov	al,mas[si-1]
	cmp	mas[si],al
	ja	m1
;НАЧ_БЛОК_2
;x:=mas[j-1]; mas[j-1]:=mas[j]; mas[j]:=X
	mov	x,al	;x=mas[j-1]
	mov	al,mas[si]
	mov	mas[si-1],al	;mas[j-1]= mas[j]
	mov	al,x
	mov	mas[si],al	;mas[j]=x
m1:
	dec	si	;цикл по j с декрементом n-i раз
;КОН_БЛОК_2
	loop	cycl2
	pop	si
	inc	si
	pop	cx
;КОН_БЛОК_1
	loop	cycl1
;выход
	mov	ax,4c00h
	int	21h
end	main
