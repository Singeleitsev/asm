;prg_11_1.asm
MASM
MODEL	small
STACK	256
.data
source	db	'�����㥬�� ��ப�','$'	;��ப�-���筨�
dest	db	19 DUP (' ')	;��ப�-��񬭨�
.code
	assume	ds:@data,es:@data
main:			;�窠 �室� � �ணࠬ��
	mov	ax,@data	;����㧪� ᥣ������ ॣ���஢
	mov	ds,ax	;����ன�� ॣ���஢ DS � ES
			;�� ���� ᥣ���� ������
	mov	es,ax
	cld		;��� 䫠�� DF - ��ࠡ�⪠
			;��ப� �� ��砫� � �����
	lea	si,source	;����㧪� � si ᬥ饭��
			;��ப�-���筨��
	lea	di,dest	;����㧪� � DS ᬥ饭�� ��ப�-��񬭨��
	mov	cx,20	;��� ��䨪� rep - ���稪
			;����७�� (����� ��ப�)
rep	movs	dest,source	;����뫪� ��ப�
	lea	dx,dest
	mov	ah,09h	;�뢮� �� �࠭ ��ப�-��񬭨��
	int	21h
exit:
	mov	ax,4c00h
	int	21h
end	main

