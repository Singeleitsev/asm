;---------Prg_3_1.asm----------------------------------
;�ணࠬ�� �८�ࠧ������ ��㧭�筮�� ��⭠����筮�� �᫠
;� ᨬ���쭮� ���� � ����筮� �।�⠢�����.
;�室: ��室��� ��⭠����筮� �᫮ �� ���� ���,
;�������� � ����������.
;��室: १���� �८�ࠧ������ ������
;���� � ॣ���� dl.
;------------------------------------------------------
data	segment	para public 'data'	;ᥣ���� ������
message	db	'������ ��� ��⭠������ ����,$'
data	ends
stk	segment	stack
	db	256 dup ('?')	;ᥣ���� �⥪�
stk	ends
code	segment	para public 'code'	;��砫� ᥣ���� ����
main	proc	;��砫� ��楤��� main
	assume cs:code,ds:data,ss:stk
	mov	ax,data	;���� ᥣ���� ������ � ॣ���� ax
	mov	ds,ax	;ax � ds
	mov	ah,9
	mov	dx,offset message
	int	21h
	xor	ax,ax	;������ ॣ���� ax
	mov	ah,1h	;1h � ॣ���� ah
	int	21h	;������� ���뢠��� � ����஬ 21h
	mov	dl,al	;ᮤ�ন��� ॣ���� al � ॣ���� dl
	sub	dl,30h	;���⠭��: (dl)=(dl)-30h
	cmp	dl,9h	;�ࠢ���� (dl) � 9h
	jle	M1	;��३� �� ���� M1 �᫨ dl<9h ��� dl=9h
	sub	dl,7h	;���⠭��: (dl)=(dl)-7h
M1:		;��।������ ��⪨ M1
	mov	cl,4h	;����뫪� 4h � ॣ���� cl
	shl	dl,cl	;ᤢ�� ᮤ�ন���� dl �� 4 ࠧ�鸞 �����
	int	21h	;�맮� ���뢠��� � ����஬ 21h
	sub	al,30h	;���⠭��: (dl)=(dl)-30h
	cmp	al,9h	;�ࠢ���� (al) � 9h	28
	jle	M2	;��३� �� ���� M2 �᫨ al<9h ��� al=9h
	sub	al,7h	;���⠭��: (al)=(al)-7h
M2:			;��।������ ��⪨ M2
	add	dl,al	;᫮�����: (dl)=(dl)+(al)
	mov	ax,4c00h	;����뫪� 4c00h � ॣ���� ax
	int	21h	;�맮� ���뢠��� � ����஬ 21h
main	endp		;����� ��楤��� main
code	ends		;����� ᥣ���� ����
end	main		;����� �ணࠬ�� � �窮� �室� main

