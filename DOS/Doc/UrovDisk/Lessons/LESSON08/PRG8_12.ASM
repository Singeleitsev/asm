;prg8_12.asm
masm
model	small
stack	256
.data	;ᥣ���� ������
b	db	17h	;㯠�������� �᫮ 17h
c	db	45h		;㯠�������� �᫮ 45
sum	db	2 dup (0)
.code	;ᥣ���� ����
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
	mov	al,b
	add	al,c
	daa
	jnc	$+6	;���室 �१ �������, �᫨ १���� <= 99
	mov	sum+1,ah	;��� ��७�� �� ᫮����� (१���� > 99)
	mov	sum,al	;����訥 㯠������� ���� १����
exit:
	mov	ax,4c00h
	int	21h
end	main

