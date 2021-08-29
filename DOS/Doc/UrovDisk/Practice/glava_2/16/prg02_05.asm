;----------------------------------------------------------
;prg02_05.asm - ��������� �� ���������� ������������ ������ � ��������������� ��������
;����: ���� maket.txt � ����������������, ����� ������� ������������ ���������� � ����������������� ���������.
;�����: ����� ���������� � ���������� ���������� �� �����.
;----------------------------------------------------------
masm
model small
state_tab	struc
last_off	dw	0	;����� ������� ����� �� ������ �������
elem_free	dw	0	;����� ������� ���������� �������� (0ffffh - ��� ������)
ends
constant	struc
state	db	0	;���� ��������� �������� �������
	db	02dh	;�������������� ������ �� �����
key	db	10 dup (' ')	;����, �� �� �������� ���������
	db	02dh	;�������������� ������ �� �����
line	db	2 dup (' ')	;������ �����, � ������� ����������� ���������
end_line	db	0dh,0ah,'$'	;��� �������� ������ �� �����
ends
.data
s_tab	state_tab	<>
tab	constant	19 dup (<>)
	constant	<8,>	;��������� ������� ������� - ��� 3=1
end_tab=$-tab
filename	db	'maket.txt',0
handle	dw	0	;���������� �����
buf	db	240 dup (' ')
xlat_tab	db	0dh dup (00),0dh	;������� ����� ������
	db	'0'-0eh dup (0)
	db	':'-'0'+1 dup ('0')		;������� ����� 0..9
	db	'H'-':' dup (0), ''	;������� ����� 'H'
	db	'h'-'H' dup (0), 'h'	;������� ����� 'h'
	db	0ffh-'h' dup (00)
cur_line	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;��������� ����
	mov	ah,3dh
	mov	dx,offset filename
	int	21h
	jc	exit	;������ (cf=1)
	mov	handle,ax
;������ ����:
	mov	ah,3fh	;������� ��������� ���������
	mov	bx,handle
	mov	cx,240	;������ �������� 240 ����
	lea	dx,buf
	int	21h
	jc	exit
	mov	cx,ax	;����������� ����� ����� � cx
;�������������� ���������� ������� s_tab
	lea	si,tab	;����� ������� � si
	mov	s_tab.elem_free,si	;������ ������� ������� - ��������
	add	si,end_tab
	mov	s_tab.last_off,si	;����� ������� ����� �� ������ �������
	lea	bx,xlat_tab
	lea	di,buf
;��������� �� ������� �������:
push	ds
pop	es
cycl1:
	mov	al, ' '
repne	scasb	;������������ �� ������� �������
	jcxz	displ	;������� ������������� => ������� ���������
push	cx
;�������������� ������ ����� ������� (������� xlat):
	mov	al,[di]
	xlat
	cmp	al, '0'	;������ ������ ����� ������� - 0
	je	m1
	cmp	al,0dh	;������ ������ ����� ������� - 0dh
	je	m2
;��� ��������� ���� ��������������, ���� ������� ���������� �����
pop	cx
	jmp	cycl1
m1:
;������ ������ ����� ������� - 0..9:
	mov	si,di	;������ ����������
	mov	al, ' '
push	di
repne	scasb	;������������ �� ������� �������
	mov	cx,di
	dec	cx
	sub	cx,si	;������� ����������
	lea	di,tab
	cmp	s_tab.elem_free,0ffffh	;���� ��������� �������� ?
	je	displ	; ��������� ��������� ���
	mov	di,s_tab.elem_free	;����� ������� ���������� ��������
push	di
	lea	di,[di].key
rep	movsb	;���������� � ������� �������
	dec	di
;������ ���� ��� ���������?
	cmp	byte ptr [di],'h'
pop	di
	je	m4
	and	[di].state,0fbh	;���������� ���������
	jmp	$+5
m4:	or	[di].state,100b	;����������������� ���������
	mov	al,cur_line	;������� ����� ������ � al
	aam	;����������� � ���������� �������������
	or	ah,030h
	mov	[di].line,ah
	or	al,030h
	mov	[di+1].line,al	;� � ������� �������
	or	[di].state,1b	;�������� ������� ��� ������������
;������ ����� ��������� � ���� s_tab.elem_free ����� ������ ���������� ��������
m5:	cmp	di,s_tab.last_off
	ja	displ
	add	di,type constant	;� ���������� ��������
	test	[di].state,1b
	jnz	m5	;������������ => � ���������� ��������
	mov	s_tab.elem_free,di
pop	di
pop	cx
	jmp	cycl1
m2:	;��������� ����� ������
	inc	cur_line
	jmp	cycl1
displ:
;����������� �� ������ ��������� �������
	lea	di,tab
m6:
	test	[di].state,100b
	jnz	m7
;������� �� ����� ������
	mov	ah,9
	mov	dx,di
	int	21h
m7:
	add	di,type constant
	cmp	di,s_tab.last_off
	jb	m6
exit:
	mov	ax,4c00h
	int	21h
end	main
