;prg_8_3.asm
masm
model	small
stack	256
.data
a	db	254
.code	;ᥣ���� ����
main:
	mov	ax,@data
	mov	ds,ax
;...
	xor	ax,ax
	add	al,17
	add	al,a
	jnc	m1	;�᫨ ��� ��७��, � ��३� �� m1
	adc	ah,0	;� ax �㬬� � ��⮬ ��७��
m1: ;...
	exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end main			;����� �ணࠬ��

