;prg14_4.asm
include	mac.inc	;������祭�� 䠩�� � ����ᠬ�
stk	segment	stack
	db	256 dup (0)
stk	ends
common_data	segment	para common 'data'	;��砫� ��饩
			;������ �����
buf	db	15 DUP (' ')	;���� ��� �࠭���� ��ப�
temp	dw	0
common_data	ends
	extrn	PutChar:far,PutCharEnd:far
code	segment	;��砫� ᥣ���� ����
	assume	cs:code,es:common_data
main	proc
	mov	ax,common_data
	mov	es,ax
;�맮� ���譨� ��楤��
	call	PutChar
	call	PutCharEnd
	push	es
	pop	ds
	_OutStr	buf
exit:
	_Exit	;�⠭����� ��室
main	endp	;����� ������� ��楤���
code	ends
	end	main

