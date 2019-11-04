;----------------------------------------------------------
;prg27_136 (по Кнуту) - программа на ассемблере "быстрой сортировки" массива.
;Вход: mas[n] - неупорядоченная последовательность двоичных значений длиной n.
;Выход: mas[n] - упорядоченная последовательность двоичных значений длиной n.
;----------------------------------------------------------
masm
model small
.data
;задаем массив
mas	db	50h,08h,52h,06h,90h,17h,89h,27h,65h,42h,15h,51h,61h,67h,76h,70h
n=$-mas
k	db	1
L	dw	0	;адресация элементов массива с 0
R	dw	n-1	;адресация элементов массива с 0
M	dw	1	;длина подпоследовательности (для отладки возьмем 1)
I	dw	0
J	dw	0
temp	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;НАЧ_ПРОГ
;q1
;ECЛИ MЈN ТО ПЕРЕЙТИ_НА q9
;l:=1; r:=n
	cmp	M,n
	jae	q9	;на шаг 9
;ВКЛЮЧИТЬ_В_СТЕК (0ffffh)	//0ffffh - признак пустого стека
;q2:
;i:=l; j:=r+1; k:=mas[l]
	push	0ffffh	; 0ffffh - признак пустого стека
q2:
;i:=l; j:=r+1; k:=mas[l]
	mov	si,L	;i(si):=L
	mov	di,R
	inc	di	;j(di):=R+1
	xor	ax,ax
	mov	al,mas[si]
	mov	k,al
;q3:
q3:
;ECЛИ i=<j-1 ТО ПЕРЕЙТИ_НА qq3
;ПЕРЕЙТИ_НА q4	//итерация прекращена
	inc	si	;i:=i+1
	cmp	si,di	;i=<j
	jle	qq3
	dec	si	;сохраняем i=<j
	jmp	q4	;итерация прекращена
;qq3:
qq3:
;i:=i+1
;ECЛИ mas[i]<K ТО ПЕРЕЙТИ_НА q3
	mov	al,k
	cmp	mas[si],al
	jb	q3
;q4:
q4:
;j:=j-1
	dec	di	;j:=j-1
;ECЛИ j<i ТО ПЕРЕЙТИ_НА q5
	cmp	di,si	;j>=i-1
	jb	q5
;ECЛИ K<mas[j] ТО ПЕРЕЙТИ_НА q4
	mov	al,k
	cmp	al,mas[di]
	jb	q4
q5:
;ECЛИ j>i ТО ПЕРЕЙТИ_НА q6
	cmp	di,si	;j=<i ???
	jg	q6
;//обмен mas[l]:= mas[j]
;TEMP:=mas[l]; mas[l]:=mas[j]; mas[j]:=TEMP
;mas[L]<->mas[j]
	mov	bx,L
	mov	dl,mas[bx]
	xchg	mas[di],dl
	xchg	mas[bx],dl
;ПЕРЕЙТИ_НА q7
	jmp	q7
;q6:
q6:
; mas[i]<-> mas[j]
;TEMP:=mas[i]; mas[i]:=mas[j]; mas[j]:=TEMP
	mov	dl,mas[si]
	xchg	mas[di],dl
	xchg	mas[si],dl
;ПЕРЕЙТИ_НА q3
	jmp	q3
;q7:
q7:
;ECЛИ r-jіj-l>M ТО 
	mov	ax,r
	sub	ax,di	;r-j->ax
	mov	bx,di
	sub	bx,l	;j-l->bx
;r-jіj-l ???
	cmp	ax,bx
	jl	q7_m4
;j-l>M ???
	cmp	bx,M
	jle	q7_m3
;1. r-jіj-l>M - в стек (j+1,r); r:=j-1; перейти на шаг q2
;НАЧ_БЛОК_1
;ВКЛЮЧИТЬ_В_СТЕК (j+1,r)
	mov	ax,di
	inc	ax
	push	ax
	push	r
	mov	r,di
;r:=j-1
	dec	r
;ПЕРЕЙТИ_НА q2
	jmp	q2
;КОН_БЛОК_1
q7_m4:
;ECЛИ j-l>r-j>M ТО 
;НАЧ_БЛОК_1
;ВКЛЮЧИТЬ_В_СТЕК (j+1,r)
;r:=j-1
;ПЕРЕЙТИ_НА q2
;КОН_БЛОК_1
;ECЛИ j-l>r-j>M ТО 
;НАЧ_БЛОК_1
;ВКЛЮЧИТЬ_В_СТЕК (l,j-1)
;l:=j+1
;ПЕРЕЙТИ_НА q2
;КОН_БЛОК_1
;ECЛИ r-j>Mіj-l ТО 
;НАЧ_БЛОК_1
;l:=j+1
;ПЕРЕЙТИ_НА q2
;КОН_БЛОК_1
;ECЛИ j-l>Mіr-j ТО 
;НАЧ_БЛОК_1
;r:=j-1
;ПЕРЕЙТИ_НА q2
;КОН_БЛОК_1
;r-j>M ???
	cmp	ax,M
	jg	q7_m2
	cmp	bx,M
	jle	q8
;4. j-l>Mіr-j - r:=j-1; перейти на шаг q2
	mov	r,di
	dec	r
	jmp	q2
q7_m3:
	cmp	ax,M
	jle	q8
;3. r-j>Mіj-l - l:=j+1; перейти на шаг q2
	mov	l,di
	inc	l
	jmp	q2
q7_m2:
;2. j-l>r-j>M - в стек (l,j-1); l:=j+1; перейти на шаг q2
	push	l
	mov	ax,di
	inc	ax
	push	ax
	mov	l,di
	inc	l
	jmp	q2
q8:
;извлекаем из стека очередную пару (l,r)
;ИЗВЛЕЧЬ_ИЗ_СТЕКА (l,r)
	pop	r
;ECЛИ r<>0ffffh ТО ПЕРЕЙТИ_НА q2
	cmp	r,0ffffh
	je	q9
	pop	l
	jmp	q2
q9:
;сортировка методом прямых включений - при M=1 этот шаг можно опустить (что и сделано для экономии места)
;выход
exit:
;КОН_ПРОГ
	mov	ax,4c00h
	int	21h
end	main
