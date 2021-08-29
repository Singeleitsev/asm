;prg_11_4.asm
MASM
MODEL	small
STACK	256
.data
;����� ࠧ��஬ 2x5 - �᫨ �� �� ���樠����஢���, � ��� ����來��� ��� ����� ���� ���ᠭ� ⠪:
;array dw 2 DUP (5 DUP (?))
;�� �� �� ���樠�����㥬:
array	dw	1,2,3,4,5,6,7,3,9,0
;�����᪨ �� �㤥� �룫拉�� ⠪:
;array=	{1	2}
;		{3	4}
;		{5	6}
;		{7	3}
;		{9	0}
	elem	dw	3	;����� ��� ���᪠
failed	db	0ah,0dh,'��� ⠪��� ����� � ���ᨢ�!','$'
success db 0ah,0dh,'����� ����� � ���ᨢ� ��������� ','$'
foundtime	db ?	;������⢮ ��������� ����⮢
fnd	db	' ࠧ(�)',0ah,0dh,'$'
.code
main:
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
	mov	si,0	;si=�⮫��� � �����
	mov	bx,0	;bx=��ப� � �����
	mov	cx,5	;�᫮ ��� ���譥�� 横�� (�� ��ப��)
external:		;���譨� 横� �� ��ப��
	mov	ax,array[bx][si]	;� ax ���� ����� ������
	push	cx	;��࠭���� � �⥪� ����稪� ���譥�� 横��
	mov	cx,2	;�᫮ ��� ����७���� 横�� (�� �⮫�栬)
	mov	si,0
iternal:		;����७��� 横� �� ��ப��
	inc	si	;��।������� �� ᫥���騩 ����� � ��ப�
;�ࠢ������ ᮤ�ন��� ⥪�饣� ����� � ax � �᪮�� ����⮬:
	cmp	ax,elem
;�᫨ ⥪�騩 ᮢ��� � �᪮��, � ���室 �� here ��� ��ࠡ�⪨,
;���� 横� �த������� ���᪠
	je	here
;���� - 横� �� ��ப� cx=2 ࠧ
	loop	iternal
here:
	jcxz	move_next	;��ᬮ�५� ��ப�?
	inc	foundtime	;���� 㢥��稢��� ����稪 ᮢ�����
move_next:	;�த������� � �����
	pop	cx	;����⠭�������� CX �� �⥪� (5)
	add	bx,1	;��।�������� �� ᫥������ ��ப�
	loop	external	;横� (���譨�)
	cmp	foundtime,0h	;�ࠢ����� �᫠ ᮢ����� � 0
	ja	eql	;�᫨ ����� 0, � ���室
not_equal:		;��� ����⮢, ᮢ����� � �᪮��
	mov	ah,09h	;�뢮� ᮮ�饭�� �� �࠭
	mov	dx,offset failed
	int	21h
	jmp	exit	;�� ��室
eql:		;���� ������, ᮢ���訥 � �᪮��
	mov	ah,09h	;�뢮� ᮮ�饭�� �� �࠭
	mov	dx,offset success
	int	21h
	mov	ah,02h
	mov	dl,foundtime
	add	dl,30h
	int	21h
	mov	ah,09h
	mov	dx,offset fnd
	int	21h
exit:			;��室
	mov	ax,4c00h	;�⠭���⭮� �����襭�� �ணࠬ��
	int	21h
end	main	;����� �ணࠬ��

