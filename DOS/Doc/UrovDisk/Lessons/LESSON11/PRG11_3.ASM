;prg_11_3.asm
MASM
MODEL	small
STACK	256
.data
;⥪��� ᮮ�饭��
fnd	db	0ah,0dh,'������ ������! ','$'
nochar	db	0ah,0dh,'������ �� ������.','$'
;��ப� ��� ���᪠
string	db	'���� ᨬ���� � �⮩ ��ப�.',0ah,0dh,'$'
.code
ASSUME ds:@data,es:@data
main:
	mov	ax,@data
	mov	ds,ax
	mov	es,ax	;����ன�� ES �� DS
	mov	ah,09h
	lea	dx,string
	int	21h	;�뢮� ᮮ�饭�� string
	mov	al,'�'	;ᨬ��� ��� ���᪠ - `�`(��ਫ���)
	cld		;��� 䫠�� df
	lea	di,string	;����㧪� � es:di ᬥ饭�� ��ப�
	mov	cx,29	;��� ��䨪� repne - ����� ��ப�
;���� � ��ப� (���� �᪮�� ᨬ��� � ᨬ��� � ��ப� �� ᮢ�����)
;��室 �� ��ࢮ� ᮢ�������
repne	scas	string
	je	found	;�᫨ ࠢ�� - ���室 �� ��ࠡ���,
failed:		;���� �믮��塞 ������� ����⢨�
;�뢮� ᮮ�饭�� � ⮬, �� ᨬ��� �� ������
	mov	ah,09h
	lea	dx,nochar
	int	21h	;�뢮� ᮮ�饭�� nochar
	jmp	exit	;�� ��室
found:		;ᮢ����
	mov	ah,09h
	lea	dx,fnd
	int	21h	;�뢮� ᮮ�饭�� fnd
;⥯���, �⮡� 㧭��� ����, ��� ᮢ��� ����� � ��ப�,
;����室��� 㬥����� ���祭�� � ॣ���� di � ��⠢��� �㦭� ��ࠡ��稪
;	dec di
;... ��⠢�� ��ࠡ��稪
exit:		;��室
	mov	ax,4c00h
	int	21h
end	main
