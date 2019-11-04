;----------------------------------------------------------
;prg10_229.asm - программа на ассемблере пирамидальной сортировки
;Вход: mas[n] - неупорядоченная последовательность 
;байтовых двоичных значений.
;Выход: mas[n] - упорядоченная последовательность 
;байтовых двоичных значений.
;----------------------------------------------------------
masm
model small
.data
;задаем массив
mas	db	17h,05h,99h,3h,33h,7h,13h,27h,77h,9h,69h,11h,81h,14h,2h,8
n=$-mas
x	db	0	;временная переменная
i	dw	0
l	dw	0
m	dw	0
j	dw	0
k	dw	0
.stack	256
.486
.code
insert_item_in_tree	proc
;----------------------------------------------------------
;ПРОЦЕДУРА insert_item_in_tree (i, mas, N)
;на входе:
;si - номер элемента i в последовательности (с конца)
;mas - массив элементов
;m=n/2 - значение, равное половине числа элементов массива mas
;----------------------------------------------------------
push	si
push	cx
;j:=i
	mov	j,si	;j:=i
;@@m1:
@@m4:
	mov	si,j	;i->si
	mov	ax,j
;k:=2*j; l:=k+1
	shl	ax,1	;j*2
	mov	k,ax	;k:=j*2
	inc	ax
	mov	l,ax	;l:=k+1
;ЕСЛИ (l=<N И (mas[j]<mas[k] ИЛИ mas[j]<mas[l]) ТО ПЕРЕЙТИ_НА @@m6
;ИНАЧЕ ПЕРЕЙТИ_НА @@m2
;КОН_ЕСЛИ
	cmp	ax,m	;l<m
	ja	@@m2
	mov	al,mas[si-1]	;ax:=mas[j]
	mov	di,k
	cmp	al,mas[di-1]
	jna	@@m6

	inc	di
	cmp	al,mas[di-1]
	jna	@@m6

	jmp	@@m2
;@@m6:
;ЕСЛИ mas[k]>mas[l] ТО ПЕРЕЙТИ_НА @@m4
;ИНАЧЕ ПЕРЕЙТИ_НА @@m3
;КОН_ЕСЛИ
@@m6:
;условие выполнилось:
;2j+1+<M AND (mas[j]<mas[2j] OR mas[j]<mas[2j+1])
;обмен с mas[j]
	mov	di,k
	mov	al,mas[di-1]	;ax:=mas[k]
	inc	di
	cmp	al,mas[di-1]	;mas[k]>mas[l]
	jna	@@m3
;@@m4:
;x:=mas[j]
;mas[j]:=mas[k]
;j:=k
;mas[k]:=x
;ПЕРЕЙТИ_НА @@m1
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j]
	dec	di
	mov	al,mas[di-1]
	mov	mas[si-1],al	;mas[j]:=mas[k]
	mov	j,di	;j:=k
	mov	al,x
	mov	mas[di-1],al	;mas[k]:=x
	jmp	@@m4
;@@m3:	x:=mas[j]
;	mas[j]:=mas[l]
;	mas[l]:=x
;	j:=l
;ПЕРЕЙТИ_НА @@m1
@@m3:	;mas[k] =< mas[l]
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j]
	mov	al,mas[di-1]
	mov	mas[si-1],al	;mas[j]:=mas[l]
	mov	j,di	;j:=l
	mov	al,x
	mov	mas[di-1],al	;mas[l]:=x
	jmp	@@m4
;@@m2:
;ЕСЛИ (k==n И mas[j]<mas[k]) ТО ПЕРЕЙТИ_НА @@m7
;ИНАЧЕ ПЕРЕЙТИ_НА @@m8
;КОН_ЕСЛИ
@@m2:	; условие не выполнилось: 2j+1+<M AND (mas[j]<mas[2j] OR mas[j]<mas[2j+1])
	mov	ax,k
	cmp	ax,m
	jne	@@m1

	mov	di,k
	mov	al,mas[di-1]	;al:=mas[k]
	cmp	mas[si-1],al	;mas[j]<mas[k]
	jae	@@m1
;@@m7:	x:=mas[j]
;mas[j]:=mas[n]
;mas[n]:=x
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j]
	mov	di,n
	mov	al,mas[di-1]
	mov	mas[si-1],al	;mas[j]:=mas[n]
	mov	al,x
	mov	mas[di-1],al	;mas[n]:=x
;@@m8:
;ВОЗВРАТ
@@m1:
pop	cx
pop	si
	ret
insert_item_in_tree	endp
main:
	mov	dx,@data
	mov	ds,dx
;i:=n/2; l:=i; m:=n
	mov	ax,n	;n-1
	mov	m,ax	;m:=n
	shr	ax,1
	mov	i,ax	;i:=n\2
	mov	l,ax	;l:=i
;//строим пирамиду на основе входного массива
;ДЛЯ k:=1 ДО l
;строим пирамиду:
	mov	cx,l	;цикл по k:=1..l
	mov	si,i
@@cycl1:
;НАЧ_БЛОК_1
	mov	i,si
;insert_item_in_tree (i, mas, m)
	call	insert_item_in_tree
;i:=i-1
	dec	si	;i:=i-1
;КОН_БЛОК_1
	loop	@@cycl1
;а теперь собственно сортировка:
;//сортируем пирамиду
;ДЛЯ k:=2 ДО n
	mov	cx,n-1	;n-2
@@cycl2:
;НАЧ_БЛОК_1
;x:=mas[1]
;mas[1]:=mas[m]
;mas[m]:=x
;m=m-1
	xor	si,si
	mov	al,mas[si]
	mov	x,al	;x:=mas[1]
	mov	di,m
	mov	al,mas[di-1]
	mov	mas[si],al	;mas[1]:=mas[m]
	mov	al,x
	mov	mas[di-1],al	;mas[m]:=x
	dec	m
	inc	si	;i:=1
;insert_item_in_tree (1, mas, m)
	call	insert_item_in_tree
;КОН_БЛОК_1
	loop	@@cycl2
;выход
	mov	ax,4c00h
	int	21h
end	main
