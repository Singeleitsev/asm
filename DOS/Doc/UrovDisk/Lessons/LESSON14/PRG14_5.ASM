;prg14_5.asm
include	mac.inc	;������祭�� 䠩�� � ����ᠬ�
stk	segment	stack
	db	256 dup (0)
stk	ends

pdata	segment	para public 'data'
mes	db	'��騩 ᥣ����',0ah,0dh,'$'
temp1	db	?
temp2	dd	?
temp3	dq	?
pdata	ends

	public	PutChar,PutCharEnd

common_data segment para common 'data'	;��砫� ��饩
			;������ �����
buffer	db	15 DUP (' ')	;���� ��� �ନ஢���� ��ப�
tmpSI	dw	0
common_data	ends

code	segment	;��砫� ᥣ���� ����
	assume	cs:code,es:common_data,ds:pdata
PutChar	proc	far	;������� ��楤���
	cld
	mov	si,0
	mov	buffer[si],'�'
	inc	si
	mov	buffer[si],'�'
	inc	si
	mov	buffer[si],'�'
	inc	si
	mov	buffer[si],'�'
	inc	si
	mov	buffer[si],'�'
	inc	si
	mov	buffer[si],'�'
	inc	si
	mov	buffer[si],'�'
	inc	si
	mov	buffer[si],'�'
	inc	si
	mov	buffer[si],'!'
	inc	si
	mov	tmpSI,si
	ret	;������ �� ��楤���
PutChar	endp	;����� ��楤���
PutCharEnd	proc	far
	mov	si,tmpSI
	mov	buffer[si],'$'
	ret
PutCharEnd	endp
code	ends
end

