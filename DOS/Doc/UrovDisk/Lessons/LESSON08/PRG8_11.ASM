;prg8_11.asm
masm
model	small
stack	256
.data	;ᥣ���� ������
b	db	1,7	;��㯠�������� BCD-�᫮ 71
c	db	4	;
ch	db	2 dup (0)
.code	;ᥣ���� ����
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
	mov	al,b
	aad	;���४�� ��। ��������
	div	c	;� al BCD-��⭮�, � ah BCD-���⮪
;...
	exit:
	mov	ax,4c00h
	int	21h
end	main


