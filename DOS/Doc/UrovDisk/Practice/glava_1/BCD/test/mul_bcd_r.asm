masm
model small
mul_bcd_r	macro	u,i,v,j,w
local	m2,m4,m6
;--------------------------------------------------------------------------------;
;mul_bcd_r u,i,v,j,w - макрокоманда умножени€ неупакованных BCD-чисел u и v размером i и j байт и помещение результата в w.
;¬ход: u - адрес первого множител€; i - длина u; v - адрес второго множител€; j - длина v; w - адрес области размерностью i+j байт, куда необходимо поместить произведение; b=256 - размерность машинного слова.
;¬ыход: w - произведение размерностью i+j байт.
;ѕор€док следовани€ байт - старший байт по младшему адресу (не Intel).
;--------------------------------------------------------------------------------;
	push	si
;очистим w
cld
	push	ds
	pop	es
	xor	al,al
	lea	di,w
	mov	cx,i+j
rep	stosb

;m1
	mov	bx,j-1	;j=0..m-1
	mov	cx,j
m2:
	push	cx	;вложенные циклы
	cmp	v[bx],0
	je	m6
;m3
	mov	si,i-1	;i=0..n-1
	mov	cx,i
	mov	k,0
m4:
	mov	al,u[si]
	mul	v[bx]
	xor	dx,dx
	mov	dl,w[bx+si+1]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - временна€ переменна€
	aam	;корректируем результат - (ah)=цифра переноса; (al)=результат
	mov	k,ah
	mov	w[bx+si+1],al
;m5
	dec	si
	loop	m4
	mov	al,k
	mov	w[bx],al
m6:
	dec	bx
	pop	cx
	loop	m2
	pop	si
	endm
.data
;значени€ в U и V нужно внести
uu	db	9,3,4,5,9	;множитель 1 размерностью N байт
ii=$-uu
vv	db	9,9,9,9	;множитель 2 размерностью M байт
jj=$-vv
l_p=$-uu
ww	db	l_p dup (0)
k	db	0	;перенос 0 £ k < 255

.stack	256
.486

.code
main:
	mov	dx,@data	
	mov	ds,dx	

	mul_bcd_r	uu,ii,vv,jj,ww

	mov	ax,4c00h
	int	21h	
end	main