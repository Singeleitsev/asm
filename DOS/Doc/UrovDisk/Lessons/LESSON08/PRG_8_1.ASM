;prg_8_1.asm
masm
model	small
stack	256
.data	;ᥣ���� ������
per_1	db	23
per_2	dw	9856
per_3	dd	9875645
per_4	dw	29857
.code	;ᥣ���� ����
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data	;��뢠�� ॣ���� dx � ᥣ���⮬
	mov	ds,ax	;������ �१ ॣ���� ax
exit:		;��ᬮ��� � �⫠�稪� ���� ᥣ���� ������
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end main			;����� �ணࠬ��

