;----------------------------------------------------------
;prg4_123 - программа на ассемблере нахождения k-го по величине элемента массива 
;mas длиною n. Для нахождения медианы k=n/2.
;Вход: mas[n] - неупорядоченная последовательность 
;двоичных значений; k - значение номера k-го по величине 
;элемента массива mas[n].
;Выход: x - значение k-го по величине элемента 
;последовательности mas[n].
;----------------------------------------------------------
;prg4_123.asm
masm
model small
.data
;задаем массив
mas	db	38h,08h,16h,06h,79h,76h,57h,24h,56h,02h,58h,48h,04h,70h,45h,47h
n=$-mas
L	dw	1
R	dw	n
k	dw	9
x	db	0
.stack	256
.486
.code
main:
;НАЧ_ПРОГ
	mov	dx,@data
	mov	ds,dx
;l:=1; r:=n
;ПОКА l<r ДЕЛАТЬ
;проверка, что k=<n-1
	mov	ax,n-1
	cmp	k,ax
	jg	exit
;определяем k=n/2
;	mov	ax,n
;	shr	ax,1
;	mov	k,ax
;адресация элементов массива с 0
	dec	L
	dec	R
@@m8:
;НАЧ_БЛОК_1
;цикл(1)начало, пока L<R
;x:=a[k]; i:=l; j:=r
	mov	ax,L
	cmp	ax,R
	jge	exit
;temp:=mas[k]
	mov	bx,k
	mov	al,mas[bx]	;al - это x
	mov	x,al
	mov	si,L	;I:=L	si это i
	mov	di,R	;J:=R 	di это j
@@m7:
;цикл repeat начало
;ПОВТОРИТЬ
;ПОКА a[i]<x ДЕЛАТЬ i:=i+1
	cmp	mas[si],al	;mas[i]<temp ???
	jae	@@m3
	inc	si
	jmp	@@m7
;ПОКА x< a[j] ДЕЛАТЬ j:=j-1
@@m3:
	cmp	al,mas[di]	; temp<mas[j] ???
	jae	@@m5
	dec	di
	jmp	@@m3
@@m5:
;ECЛИ iЈj ТО
	cmp	si,di	;I=<J	???
	ja	@@m6
;если I=<J, то обмен mas[i]<->mas[j]
;НАЧ_БЛОК_2
;w:=a[i]; a[i]:=a[j]; a[j]:=w
	mov	dl,mas[si]
	xchg	mas[di],dl
	xchg	mas[si],dl
;i:=i+1; j:=j-1
	inc	si	;I:=I+1
	dec	di	;J=J+1
;КОН_БЛОК_2
;ПОКА i>j
@@m6:
;цикл(2) конец, пока I=<J:
	cmp	si,di
	jg	@@m1	;ja нельзя !!!
	jmp	@@m7
@@m1:
;ЕСЛИ j<k ТО l:=I
	cmp	di,k	;j<k ???
	jge	$+6
	mov	L,si	;L<-I
;ЕСЛИ k<i ТО r:=j
	cmp	k,si	;k<i ???
	jge	$+6
	mov	R,di	;R<-J
;цикл(1)конец
;КОН_БЛОК_1
	jmp	@@m8
;выход
exit:
;КОН_ПРОГ
	mov	ax,4c00h
	int	21h
end	main
