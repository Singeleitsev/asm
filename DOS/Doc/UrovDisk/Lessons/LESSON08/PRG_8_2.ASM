;prg_8_2.asm
masm
model	small
stack	256
.data	;ᥣ���� ������
per_1	db	2,3,4,6,8,2	;��㯠�������� BCD-�᫮ 286432
per_3	dt	9875645	;㯠�������� BCD-�᫮ 9875645
.code	;ᥣ���� ����
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data	;��뢠�� ॣ���� dx � ᥣ���⮬
	mov	ds,ax	;������ �१ ॣ���� ax
exit:	;��ᬮ��� � �⫠�稪� ���� ᥣ���� ������
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end	main		;����� �ணࠬ��

