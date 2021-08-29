;prg_13_2.asm
init_ds	macro
;����� ����ன�� ds �� ᥣ���� ������
	mov	ax,data
	mov	ds,ax
	xor	ax,ax
	endm
out_str	macro	str
;����� �뢮�� ��ப� �� �࠭.
;�� �室� - �뢮����� ��ப�.
;�� ��室� - ᮮ�饭�� �� �࠭�.
	push	ax
	mov	ah,09h
	mov	dx,offset str
	int	21h
	pop	ax
	endm
exit	macro
;����� ���� �ணࠬ��
	mov	ax,4c00h
	int 21h
	endm
num_char	macro	message
	local	m1,elem,num,err_mes,find,num_exit
;����� ������ ������⢠ ᨬ����� � ��ப�.
;����� ��ப� - �� ����� 99 ᨬ�����.
;�室: message - ���� ��ப� ᨬ�����, ��࠭�祭��� '$'
;��室: � al - ������⢮ ᨬ����� � ��ப� message
;� �뢮� ᮮ�饭��
	jmp	m1
elem	db	'��ப� &message ᮤ�ন� '
num	db	2 dup (0)	;�᫮ ᨬ����� � ��ப�
			;message � ���� ASCII
	db	' ᨬ�����',10,13,'$'	;����� ��ப�
			;��� �뢮�� �㭪樥� 09h
err_mes	db	'��ப� &message �� ᮤ�ন� ᨬ���� ���� ��ப�',10,13,'$'
m1:
;��࠭塞 �ᯮ��㥬� � ����� ॣ�����
	push	es
	push	cx
	push	ax
	push	di
	push	ds
	pop	es	;����ன�� es �� ds
	mov	al,'$'	;ᨬ��� ��� ���᪠ - `$`
	cld		;��� 䫠�� df
	lea	di,message	;����㧪� � es:di ᬥ饭��
			;��ப� message
	push	di	;�������� di - ���� ��砫� ��ப�
	mov	cx,99	;��� ��䨪� repne - ���ᨬ��쭠�
			;����� ��ப�
;���� � ��ப� (���� �㦭� ᨬ���
;� ᨬ��� � ��ப� �� ࠢ��)
;��室 - �� ��ࢮ� ᮢ���襬
repne	scasb
	je	find	;�᫨ ᨬ��� ������ -���室 �� ��ࠡ���
;�뢮� ᮮ�饭�� � ⮬, �� ᨬ��� �� ������
	push	ds
;����⠢�塞 cs ����� ds ��� �㭪樨 09h (int21h)
	push	cs
	pop	ds
	out_str	err_mes
	pop	ds
	jmp	num_exit	;��室 �� �����
find:		;ᮢ����
;��⠥� ������⢮ ᨬ����� � ��ப�:
	pop	ax	;����⠭���� ���� ��砫� ��ப�
	sub	di,ax	;(di)=(di)-(ax)
	xchg	di,ax	;(di) <-> (ax)
	sub	al,3	;���४�஢�� �� �㦥���
			;ᨬ���� - 10, 13, '$'
	aam		;� al ��� 㯠������� BCD-����
			;१���� ������
	or	ax,3030h	;�८�ࠧ������ १����
			;� ��� ASCII
	mov	cs:num,ah
	mov	cs:num+1,al
;�뢥�� elem �� �࠭
	push	ds
;����⠢�塞 cs ����� ds ��� �㭪樨 09h (int21h)
	push	cs
	pop	ds
	out_str	elem
	pop	ds
num_exit:
	push	di
	push	ax
	push	cx
	push	es
	endm

data	segment para public 'data'
msg_1	db	'��ப�_1 ��� ���⠭��',10,13,'$'
msg_2	db	'��ப�_2 ��� ��ண� ���⠭��',10,13,'$'
data	ends

stk	segment stack
	db	256 dup('?')
stk	ends

code	segment para public 'code'
	assume	cs:code,ds:data,ss:stk
main	proc
	init_ds
	out_str	msg_1
	num_char	msg_1
	out_str	msg_2
	num_char	msg_2
	exit
main	endp
code	ends
end	main

