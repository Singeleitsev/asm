;prg_11_5.asm
MASM
MODEL	small
STACK	256
.data
;ᮮ�饭�� 
fnd	db	0ah,0dh,'������ ������','$'
nochar	db	0ah,0dh,'������ �� ������.','$'
mes1	db	0ah,0dh,'��室��� ��ப�:','$'
string	db	'���� ᨬ���� � �⮩ ��ப�.',0ah,0dh,'$' ;��ப� ��� ���᪠
mes2	db	0ah,0dh,'������ ᨬ���, �� ����� ᫥��� �������� ��������'
	db	0ah,0dh,'$'
mes3	db	0ah,0dh,'����� ��ப�: ','$'
.code
	assume	ds:@data,es:@data	;�ਢ離� ds � es
			;� ᥣ����� ������
main:		;�窠 �室� � �ணࠬ��
	mov	ax,@data	;����㧪� ᥣ������ ॣ���஢
	mov	ds,ax
	mov	es,ax	;����ன�� es �� ds
	mov	ah,09h
	lea	dx,mes1
	int	21h	;�뢮� ᮮ�饭�� mes1
	lea	dx,string
	int	21h	;�뢮� string
	mov	al,'�'	;ᨬ��� ��� ���᪠- `�`(��ਫ���)
	cld		;��� 䫠�� df
	lea	di,string	;����㧪� � di ᬥ饭�� string
	mov	cx,29	;��� ��䨪� repne - ����� ��ப�
;���� � ��ப� string �� �� ���, ����
;ᨬ��� � al � ��।��� ᨬ��� � ��ப�
;�� ࠢ��: ��室- �� ��ࢮ� ᮢ�������
cycl:
repne	scas	string
	je	found	;�᫨ ����� ������ � ���室 �� found
failed:		;����, �᫨ �� ������, � �뢮� ᮮ�饭�� nochar
	mov	ah,09h
	lea	dx,nochar
	int	21h
	jmp	exit	;���室 �� ��室
found:
	mov	ah,09h
	lea	dx,fnd
	int	21h	;�뢮� ᮮ�饭�� �� �����㦥��� ᨬ����
;���४��㥬 di ��� ����祭�� ���祭��
;����⢨⥫쭮� ����樨 ᮢ���襣� �����
;� ��ப� � ॣ���� al
	dec	di
new_char:		;���� ������ ᨬ����
	mov	ah,09h
	lea	dx,mes2
	int	21h	;�뢮� ᮮ�饭�� mes2
;���� ᨬ���� � ����������
	mov	ah,01h
	int	21h	;� al - ������ ᨬ��� 
	stos	string	;��࠭�� ������ ᨬ���
			;(�� al) � ��ப�
			;string � ����樨 ��ண� ᨬ����
	mov	ah,09h
	lea	dx,mes3
	int	21h	;�뢮� ᮮ�饭�� mes3
	lea	dx,string
	int	21h	;�뢮� ᮮ�饭�� string
;���室 �� ���� ᫥���饣� ᨬ���� '�' � ��ப�
	inc	di	;㪠��⥫� � ��ப� string �� ᫥���騩,
			;��᫥ ᮢ���襣�, ᨬ���
	jmp	cycl	;�� �த������� ��ᬮ�� string
exit:		;��室
	mov	ax,4c00h
	int	21h
end	main	;����� �ணࠬ��

