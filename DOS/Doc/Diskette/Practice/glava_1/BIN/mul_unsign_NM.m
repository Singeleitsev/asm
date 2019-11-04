mul_unsign_NM	macro	u,i,v,j,w
local	m2,m4,m6
;----------------------------------------------------------
;mul_unsign_NM macro	u,i,v,j,w - макрокоманда умножения N-байтного числа на число размером M байт
;(порядок - младший байт по младшему адресу (Intel))
;Вход: U - адрес первого множителя; i - длина U; V - адрес второго множителя; j - длина V; W - адрес области размерностью i+j байт, куда необходимо поместить произведение; b=256 - размерность машинного слова.
;Выход: W - произведение размерностью i+j байт.
;----------------------------------------------------------
	push	si
;очистим w
	push	ds
	pop	es
	xor	al,al
	lea	di,w
	mov	cx,i+j
rep	stosb
;m1
	xor	bx,bx	;j=0..m-1
	mov	cx,j
m2:
	push	cx	;вложенные циклы
	cmp	v[bx],0
	je	m6
;m3
	xor	si,si	;i=0..n-1
	mov	cx,i
	mov	k,0
m4:
	mov	al,u[si]
	mul	v[bx]
	xor	dx,dx
	mov	dl,w[bx+si]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - временная переменная
	push	dx
	xor	dx,dx
	div	b	;t mod b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si],ah
;m5
	inc	si
	loop	m4
	mov	al,k
	mov	w[bx+si],al
m6:
	inc	bx
	pop	cx
	loop	m2
	pop	si
	endm
