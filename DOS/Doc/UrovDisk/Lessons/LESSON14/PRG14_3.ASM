;prg_14_3.asm
MASM
MODEL	small	;������ �����
STACK	256	;ࠧ��� �⥪�
include	mac.inc	;������祭�� 䠩�� � ����ᠬ�
.data		;��砫� ᥣ���� ������
maskd	db	71h	;��᪠ �뢮�� �� ��࠭
string	db	'��ப� ��� ������ $'	;��⮢�� ��ப�
mes	db	'� ��ப� string '
cnt	db	2 dup ('*')	; ������⢮ ᨬ����� � ��ப�
	db	' ᨬ�����',10,13,'$'

.code
main	proc	;�窠 �室� � ������� ��楤���
	mov	ax,@data
	mov	ds,ax
;����㧪� ���� ��ப�
;(��� ��।�� ᬥ饭�� � ��楤���)
	lea	si,string
;�맮� ��楤���
	call	CountSymbol
	mov	cl,bl	;���稪 ��� lods � stosw
	lea	si,string	;� si - 㪠��⥫� �� ��ப�
	mov	ax,0b800h
	mov	es,ax	;����㧪� � es ���� ����������
	mov	ah,maskd	;��᪠ �뢮�� �� ��࠭
	mov	di,160	;������ �뢮�� �� ��࠭
	cld		;��ᬮ�� ���। - ��� lodsb � stosw
disp:
	lodsb		;����뫪� ���� �� ds:si � al
	stosw		;����஢���� ���祭�� ax
			;� es:di (���������)
	loop	disp	;����� 横�� cx ࠧ
;� ⥯��� �뢥��� ������⢮ ᨬ����� � ��ப�
	mov	al,bl
	aam		;� al ��� 㯠������� BCD-����
			;१���� ������
	or	ax,3030h	;�८�ࠧ������ १���� � ��� ASCII
	mov	cnt,ah
	mov	cnt+1,al
	OutStr	mes	;�뢮� ��ப� mes
exit:
	Exit		;����� ��室�
main	endp	;����� ������� ��楤���

CountSymbol	proc	near
;��楤�� CountSymbol - ������� ᨬ����� � ��ப�.
;�� �室�: si - ᬥ饭�� ��ப�
;�� ��室�: bl - ����� � ���� 㯠��������� BCD-�᫠
	push	ax;��࠭���� �ᯮ��㥬�� ॣ���஢
	push	cx
	cld		;��ᬮ�� ���।
	mov	cx,100	;���ᨬ��쭠� ����� ��ப�
;���� ������� ᨬ�����
go:
	lodsb	;����㧪� ᨬ���� ��ப� � al
	cmp	al,'$'
	je	endstr
	jcxz	no_end
	inc	bl	;���饭�� ���稪� � bl - ������⢠
			;�����⠭��� ᨬ����� � ��ப�
	loop	go	;����� 横��
endstr:		;����� ��ப�
	pop	cx	;����⠭������� ॣ���஢ �� �⥪�
	pop	ax
	ret	;������ �� ��楤���
no_end:
;�����-� ����⢨� �� ��ࠡ�⪥ ���樨
;������⢨� � ��ப� ᨬ���� $
ret	;������ �� ��楤���
CountSymbol	endp	;����� ��楤���
	end	main	;����� �ணࠬ��

