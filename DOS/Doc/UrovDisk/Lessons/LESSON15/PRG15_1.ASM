;prg15_1.asm
MASM
MODEL	small	;������ �����
STACK	256	;ࠧ��� �⥪�
.486p
delay	macro	time
local	ext,iter
;����� ����প�
;�� �室� - ���祭�� ��६����� ����প� (� ���)
	push	cx
	mov	cx,time
ext:
	push	cx
;� cx ���� ���[FA1],�� ���祭�� �����
;�������� � ����ᨬ��� �� �ந�����⥫쭮�� ������
	mov	cx,5000
iter:
	loop	iter
	pop	cx
	loop	ext
	pop	cx
endm	;����� �����
.data
tonelow	dw	2651	;������ �࠭�� ���砭�� 450 ��
cnt	db	0	;����稪 ��� ��室� �� �ணࠬ��
temp	dw	?	;������ �࠭�� ���砭��
old_off8	dw	0	;��� �࠭���� ����� ���祭�� �����
old_seg8	dw	0	;ᥣ���� � ᬥ饭��
time_1ch	dw	0	;��६����� ��� ������
.code			;��砫� ᥣ���� ����
off_1ch	equ	1ch*4	;ᬥ饭�� ����� 1ch � ���
off_0ffh	equ	0ffh*4	;ᬥ饭�� ����� ffh � ���
char	db	'0'	;ᨬ��� ��� �뢮�� �� �࠭
maskf	db	07h	;��᪠ �뢮�� ᨬ����� �� �࠭
position	dw	2000	;������ �� �࠭� - ���� 業��
main	proc
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
	cli	;����� �������� ���뢠��� �� �६�
;������ ����஢  [FA2] ���뢠���
;������ ��ண� ����� 1ch �� ���� new_1ch
;����ன�� es �� ��砫� ⠡���� ����஢
;���뢠��� - � ॠ�쭮� ०���:
	mov	ax,0
	mov	es,ax
;��࠭��� ���� �����
	mov	ax,es:[off_1ch]	;ᬥ饭�� ��ண� ����� 1ch � ax
	mov	old_off8,ax	;��࠭���� ᬥ饭�� � old_off8
	mov	ax,es:[off_1ch+2]	;ᥣ���� ��ண� ����� 1ch � ax
	mov	old_seg8,ax	;��࠭���� ᥣ���� � old_seg8
;������� ���� ����� � ⠡���� ����஢ ���뢠���
	mov	ax,offset new_1ch	;ᬥ饭�� ������ ��ࠡ��稪� � ax
	mov	es:off_1ch,ax
	push	cs
	pop	ax	;����ன�� ax �� cs
	mov	es:off_1ch+2,ax	;������ ᥣ����
;���樠����஢��� ����� ���짮��⥫�᪮�� ���뢠��� 0ffh
	mov	ax,offset new_0ffh
	mov	es:off_0ffh,ax	;���뢠��� 0ffh
	push	cs
	pop	ax
	mov	es:off_0ffh+2,ax
	sti		;ࠧ�襭�� �������� ���뢠���
;����প�, �⮡� ���� ��ࠡ��稪 ⠩��� �뢥� ᨬ���� �� �࠭
	delay	3500
;�����襭�� �ணࠬ��
	int	0ffh
exit:
	mov	ax,4c00h
	int	21h
main	endp
new_1ch	proc	;���� ��ࠡ��稪 ���뢠��� �� ⠩���
;��࠭���� � �⥪� �ᯮ��㥬�� ॣ���஢
	push	ax
	push	bx
	push	es
	push	ds
;����ன�� ds �� cs
	push	cs
	pop	ds
;������ � es ���� ��砫� ���������� - B800:0000
	mov	ax,0b800h
	mov	es,ax
	mov	al,char	;ᨬ��� � al
	mov	ah,maskf	;���� �뢮�� - � ah
	mov	bx,position	;������ �� �࠭� - � bx
	mov	es:[bx],ax	;�뢮� ᨬ���� � 業�� �࠭�
	add	bx,2	;㢥��祭�� ����樨
	mov	position,bx	;��࠭���� ����� ����樨
	inc	char	;᫥���騩 ᨬ���
;����⠭������� �ᯮ��㥬�� ॣ���஢:
	pop	ds
	pop	es
	pop	bx
	pop	ax
	iret		;������ �� ���뢠���
new_1ch	endp	;����� ��ࠡ��稪�
new_0ffh	proc	;���� ��ࠡ��稪 ���짮��⥫�᪮�� ���뢠���
sirena:
;��࠭���� � �⥪� �ᯮ��㥬�� ॣ���஢
	push	ax
	push	bx
;�஢�ઠ ��� ������ �� 4:
	test	time_1ch,03h
	jnz	leave_it	;�᫨ ��� �ࠢ�� ��� �� 11, � �� ��室, ����:
go:
	mov	ax,0B06h	;����ᨬ ᫮�� ���ﭨ� 110110110b
;(0�6h)-�롨ࠥ� ��ன ����� ���� 43h (�������)
	out	43h,ax	;� ���� 43h
	in	al,61h	;����稬 ���祭�� ���� 61h � al
	or	al,3	;���樠�����㥬 ������� - ������ ⮪
	out	61h,al	;� ���� 61h
	mov	cx,2083	;������⢮ 蠣��
musicup:
;���祭�� ������ �࠭��� ����� � ax (1193000/2651=450 ��),
;��� 1193000 - ���� ��������
	mov	ax,tonelow
	out	42h,al	;� ���� 42h - ����襥 ᫮�� ax:al
	mov	al,ah	;����� ����� al � ah
	out	42h,al	;� ���� 42h 㦥 ���襥 ᫮�� ax:ah
	add	tonelow,1	;㢥��祭�� �����
	delay	1	;����প� �� 1 ���
	mov	dx,tonelow	;⥪�饥 ���祭�� ����� - � dx
	mov	temp,dx	;� temp - ���孥� ���祭�� �����
	loop	musicup	;������� 横� ����襭��
	mov	cx,2083
musicdown:
	mov	ax,temp	;���孥� ���祭�� ����� - � ax
	out	42h,al	;����訩 ���� ax:al � ���� 42h
	mov	al,ah	;����� ����� al � ah
	out	42h,al	;���訩 ���� ax:ah � ���� 42h
	sub	temp,1	;㬥��襭�� �����
	delay	1	;����প� �� 1 ���
	loop	musicdown	;������� 横� ���������
nosound:
	in	al,61h	;���祭�� ���� 61h - � al
;᫮�� ���ﭨ� 0fch - �몫�祭�� �������� � ⠩���
	and	al,0fch
	out	61h,al	;� ���� 61h
	mov	dx,2651	;��� ��᫥����� 横���
	mov	tonelow,dx
	inc	cnt	;���६��� ������⢠ ��室��
	cmp	cnt,2	;�᫨ �७� �� ���砫� ����
			;ࠧ - ������ �����
	jne	go
leave_it:		;��室
	inc	time_1ch	;������ �� 4
;����⠭������� �ᯮ��㥬�� ॣ���஢
	pop	bx
	pop	ax
;����⠭������� ����� ���뢠��� �� ⠩���
	cli		;����� �������� ���뢠���
	xor	ax,ax	;᭮�� ����ன�� es �� ��砫� ⠡����
	mov	es,ax	;����஢ ���뢠���
	mov	ax,old_off8	;������ � ⠡���� ᬥ饭�� ��ண�
	mov	es:off_1ch,ax	;��ࠡ��稪� ���뢠��� �� ⠩���
	mov	ax,old_seg8	;������ ᥣ����
	mov	es:off_1ch+2,ax
	sti	;ࠧ�襭�� �������� ���뢠���
	iret	;������ �� ���뢠���
new_0ffh	endp	;����� ��ࠡ��稪�
end	main	;����� �ணࠬ��

[FA1]�� ����� "���祭�� ����� ���". ����� ���� ����: "���� ����ᥪ㭤�. ���祭�� ����� ��������:"? ��ࠢ��.
[FA2]�.�. "�� �६� ��९ணࠬ��஢����"? ��.
