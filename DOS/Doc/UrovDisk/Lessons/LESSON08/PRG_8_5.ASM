;prg_8_5.asm
masm
model	small
stack	256
.data	;ᥣ���� ������
rez	label	word
rez_l	db	45 
rez_h	db	0
.code	;ᥣ���� ����
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
;...
	xor	ax,ax
	mov	al,25
	mul	rez_l
	jnc	m1	;�᫨ ��� ��९�������, � �� �1
	mov	rez_h,ah	;������ ���� १���� � rez_h
m1:
	mov	rez_l,al	;������� ���� १���� � rez_l
;...
	exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end	main		;����� �ணࠬ��

