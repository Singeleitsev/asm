;----------------------------------------------------------
;mul_unsign_NM.asm - программа на ассемблере умножения N-байтного числа на число размером M байт
;(порядок - старший байт по младшему адресу (не Intel))
;Вход: U и V - множители размерностью N и M байт соответственно; b=256 - размерность ;машинного слова.
;Выход: W - произведение размерностью N+M байт.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;значения в U и V нужно внести
;U=un-1…u1u0 - множитель_1 размерностью N байт
U	db	?
i=$-U			;i=N
;V=vm-1…v1v0 - множитель_1 размерностью M байт
V	db	?	;множитель_2 размерностью M байт
j=$-V			;j=M
len_product=$-U
;w - результат умножения, длина N+M
W	db	len_product dup (0)	;len_product=N+M
k	db	0	;перенос 0 Ј k < 255
b	dw	100h	;размер машинного слова
.code
mul_unsign_NM	proc
;НАЧ_ПРОГ
;m1
	mov	bx,j-1
	mov	cx,j
;ДЛЯ j:=M-1 ДО 0 //J изменяется в диапазоне M-1..0
;НАЧ_БЛОК_1
m2:
	push	cx	;вложенные циклы
;//проверка на равенство нулю очередного элемента множителя (не обязательно)
;ЕСЛИ v[j]==0 ТО ПЕРЕЙТИ_НА m6
	cmp	v[bx],0
	je	m6
;k:=0; i:=n-1 //i изменяется в диапазоне N-1.. 0
;m3
	mov	si,i-1	;i=0..n-1
	mov	cx,i
	mov	k,0
;ДЛЯ i:=N-1 ДО 0
;НАЧ_БЛОК_2
;//перемножаем очередные элементы множителей
m4:
;temp_word:=u[i]*v[j]+w[i+j+1]+k
	mov	al,u[si]
	mul	byte ptr v[bx]
	xor	dx,dx
	mov	dl,w[bx+si+1]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - временная переменная
;w[i+j+1]:=temp_word MOD b //остаток от деления temp_word\b -> w[i+j+1]
;k:=temp_word\b //целая часть частного temp_word\b -> k
	push	dx
	xor	dx,dx
	div	b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si+1],ah
;m5
	dec	si
	loop	m4
;КОН_БЛОК_2
;w[j]:=k
	mov	al,k
	mov	w[bx],al
m6:
	dec	bx
	pop	cx
	loop	m2
;КОН_БЛОК_1
	ret
;КОН_ПРОГ
mul_unsign_NM	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	mul_unsign_NM
	mov	ax,4c00h
	int	21h
end	main