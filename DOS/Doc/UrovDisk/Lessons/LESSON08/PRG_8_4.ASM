;prg_8_4.asm
masm
model	small
stack	256
.data
.code	;ᥣ���� ����
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
;...
	xor	ax,ax
	mov	al,5
	sub	al,10
	jnc	m1	;��� ��७��?
	neg al	;� al ����� १����
m1: ;...
	exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end main		;����� �ணࠬ��

