masm
model small
div_bcd_1_r	macro	u,N,v,w,r
local	m1
;--------------------------------------------------------------------------------;
;div_bcd_1_r u,N,v,w,r - деление N-разрядного беззнакового целого BCD-числа на одноразрядное BCD-число размером 1 байт.
;Вход: u - делимое; N - длина делимого, v - делитель.
;Выход: w - частное, r - остаток.
;Порядок следования байт - старший байт по младшему адресу (не Intel) !!!!!!!.
;--------------------------------------------------------------------------------;
	mov	r,0
	lea	si,u	;j=0
	xor	di,di	;j=0
	mov	cx,N
	xor	dx,dx
	xor	bx,bx
m1:
	mov	ah,r
	mov	al,[si]
	aad
	div	v
;сформировать результат:
	mov	w[di],al	;частное
	mov	r,ah	;остаток в r
	inc	si
	inc	di
	loop	m1
;если нужно - получим модуль (уберите знаки комментария)
;	mov	cx,N	;длина операнда
;	lea	bx,w
;	call	calc_abs_r
	endm

.data
;значения в U и V нужно внести
uu	db	9,3,4,5,9	;делимое размерностью ii байт
ii=$-uu
vv	db	9	;делитель размерностью 1 байт
ww	db	ii dup (0)
rr	db	0	;остаток

.stack	256
.486

.code
main:
	mov	dx,@data	
	mov	ds,dx	

	div_bcd_1_r	uu,ii,vv,ww,rr

	mov	ax,4c00h
	int	21h	
end	main		