;prg_8_7.asm
masm
model	small
stack	256
.data
a	db	5
b	db	10
c	db	2
y	dw	0
.code
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
;...
	xor	ax,ax
	mov	al,a
	cbw
.386
	movsx	bx,b
	add	ax,bx
	idiv	c	;� al - ��⭮�, � ah - ���⮪
	exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end main			;����� �ணࠬ��

