;prg_11_4.asm
MASM
MODEL	small
STACK	256
.data
;��ப� ��� �ࠢ�����
string1	db	'���� ᨬ���� � �⮩ ��ப�.',0ah,0dh,'$'
string2	db	'���� ᨬ���� �� � �⮩ ��ப�.',0ah,0dh,'$'
mes_eq	db	'��ப� ᮢ������.',0ah,0dh,'$'
fnd	db	'��ᮢ���訩 ����� � ॣ���� al',0ah,0dh,'$'
.code
;�ਢ離� ds � es � ᥣ����� ������
assume ds:@data,es:@data
main:
	mov	ax,@data	;����㧪� ᥣ������ ॣ���஢
	mov	ds,ax
	mov	es,ax		;����ன�� es �� ds
	mov	ah,09h
	lea	dx,string1
	int	21h	;�뢮� string1
	lea	dx,string2
	int	21h	;�뢮� string2
	cld		;��� 䫠�� df
	lea	di,string1	;����㧪� � es:di ᬥ饭��
;��ப� string1
	lea	si,string2	;����㧪� � ds:si ᬥ饭��
;��ப� string2
	mov	cx,29	;��� ��䨪� repe - ����� ��ப�
;���� � ��ப� (���� �㦭� ᨬ��� � ᨬ��� � ��ப� �� ࠢ��)
;��室 - �� ��ࢮ� ��ᮢ���襬
repe	cmps	string1,string2
	jcxz	eql	;�᫨ ࠢ�� - ���室 �� eql
	jmp	no_eq	;�᫨ �� ࠢ�� - ���室 �� no_eq
eql:		;�뢮��� ᮮ�饭�� � ᮢ������� ��ப
	mov	ah,09h
	lea	dx,mes_eq
	int	21h	;�뢮� ᮮ�饭�� mes_eq
	jmp	exit		;�� ��室
no_eq:		;��ࠡ�⪠ ��ᮢ������� ����⮢
	mov	ah,09h
	lea	dx,fnd
	int	21h	;�뢮� ᮮ�饭�� fnd
;⥯���, �⮡� ������� ��ᮢ���訩 ����� �� ��ப�
;� ॣ����-��������,
;㬥��蠥� ���祭�� ॣ���� si � ⥬ ᠬ� ��६�頥���
;� ����⢨⥫쭮� ����樨 ����� � ��ப�
	dec	si	;������� lods �ᯮ���� ds:si-������
;⥯��� ds:si 㪠�뢠�� �� ������ � string2
	lods	string2	;����㧨� ����� �� ��ப� � AL
;����㤭� ����������, �� � ��襬 �ਬ�� �� ᨬ��� - "�"
exit:		;��室
	mov	ax,4c00h
	int	21h
end	main

