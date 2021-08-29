;----------------------------------------------------------
;prg02_06.asm - ��������� �� ���������� ������������ ������ � ������������� ��������
;����: 10 ����, �������� � ����������. ����� ���� - �� ����� 20 ��������.
;�����: ����� �� ����� �������� �������, ����������� ������ �� ���� ������ 5 ��������, �������� ����� �������� �� ������� � ������� � ��� ������ �����, ���������� � ����������.
;----------------------------------------------------------
masm
model small
element_tab	struc
len	db	0	;����� �����
simv_id	db	20 dup (20h)	;���� �����
ends
buf_0ah	struc
len_buf	db	24	;����� buf_0ah
len_in	db	0	;�������������� ����� ���������� ����� (��� ����� 0dh)
buf_in	db	21 dup (20h)	;����� ��� ����� (� ������ 0dh)
ends
s_movsb	macro	out_str,in_str,len_movs
;������ ��������� �����:
;in_str - ������
;out_str - ����
;len_movs - ������� ����������
push	cx
push	si
push	di
	lea	si,in_str	;������ ����������
	lea	di,out_str	;���� ����������
	mov	cx,len_movs	;������� ����������
rep	movsb	;���������� ������
pop	di
pop	si
pop	cx
	ENDM
.data
;������� ����������� �.�. ����������� � ������ �������� ������,
;���� ��� �� ���, �� ���������� �������� ���������
tab	element_tab	10 dup (<>)
len_tab=$-tab
buf	buf_0ah	<>
key	db	5
prev	element_tab	<>	;���������� �������
x	element_tab	<>	;��������� ���������� ��� ����������
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;������ ����� � ����������
	lea	di,tab
	lea	si,buf.buf_in
	mov	cx,10
	lea	dx,buf
	mov	ah,0ah
push	ds
pop	es
m1:
push	cx	;1
push	si	;2
push	di	;3
	int	21h
	mov	cl,buf.len_in
	mov	[di].len,cl	;����� ����� -> tab.length
	add	di,simv_id
rep	movsb	;��������� ����� � ������� �������
pop	di	;3
pop	si	;2
pop	cx	;1
	add	di,type element_tab
	loop	m1
;������������� ������� ������� ����������� ����������
;������� ���� - �� i
n=10
	mov	cx,n-1
	mov	si,1
@@cycl1:
push	cx	;-1-
	mov	cx,n
	sub	cx,si	;���������� ���������� ����������� �����
push	si	;-2- �������� �������� i - ������ j=n
	mov	si,n-1
@@cycl2:
push	si	;-3-
	mov	ax,type element_tab
	mul	si
	mov	si,ax
	mov	di,si
	sub	di,type element_tab	;� di ����� ���������� ������
	mov	al,[di].len
	cmp	[si].len,al	;���������� ����������� � ����������
	ja	@@m1
;����������
	s_movsb	x,[di],<type element_tab>	;x=mas[j-1]
	s_movsb	[di],[si],<type element_tab>	;mas[j-1]=mas[j]
;mas[j]=x
push	cx
	mov	cx,type element_tab	;������� ����������
	mov	di,si
	lea	si,x	;������ ����������
rep	movsb	;���������� ������
pop	cx
@@m1:
pop	si	;-3-
	dec	si	;���� �� j � ����������� n-i ���
	loop	@@cycl2
pop	si	;2
	inc	si
pop	cx	;1
	dec	cx
	jcxz	m2
	jmp	@@cycl1
m2:
;���� ������� ����� ��������� ������
;� si � di ������� ������� � ���������� ��������� ��������� ������������� ����� ������������������:
	mov	si,0
	mov	di,n-1
;������� ����������� ������:
cont_search:
	cmp	si,di	;�������� �� ��������� (����������):si>di
	ja	exit
	mov	bx,si
	add	bx,di
	shr	bx,1	;����� �� 2
push	bx	;1
	mov	ax,type element_tab
	mul	bx
	mov	bx,ax
	mov	al,key	;������� �������� � ax
	cmp	[bx].len,al	;���������� � ������� ���������
	je	@@m4	;������� �������� �������
	ja	@@m3	;[bx].len>k
;[bx].len<k:
pop	bx	;1
	mov	si,bx
	inc	si
	jmp	cont_search
@@m3:
pop	bx	;1
	mov	di,bx
	dec	di
	jmp	cont_search
@@m4:
	mov	ax,type element_tab
	mul	si
	mov	si,ax
;����� ������ - � si ����� �������� ������� �� ������ ������ 5 ����
;������� ��� �� �����
;����������� ����� � ���������� ���:
	mov	al,[si].len
	xor	cx,cx
	mov	cl,al	;����� ��� movsb
	aam
	or	ax,03030h	;� ax ����� � ���������� ����
	mov	buf.len_buf,ah
	mov	buf.len_in,al
push	si	;-1- �������� ��������� �� ��� ������
	add	si,simv_id
	lea	di,buf.buf_in
rep	movsb
	mov	byte ptr [di],'$'	;����� ������ ��� ������ 09h (int 21h)
;������ �������:
	lea	dx,buf
	mov	ah,09h
	int	21h
;������� ������
pop	si	;-1- ����������� ��������� �� ��������� ������
	mov	di,si
	add	si,type element_tab
	mov	cx,len_tab
	sub	cx,si	;� cx ������� ����������
rep	movsb
;�������� ��������� ������
	xor	al,al
	mov	cx,type element_tab
rep	stosb
;������ ����� � ����������:
insert:
;������ ����o � ����������
	lea	dx,buf
	mov	ah,0ah
	int	21h
;� ������� ��������� ������ ���� ����� �������, � ������� ����������� ������� buf.len_in=<[si].len
	lea	si,tab
	mov	al,buf.len_in
@@m5:
	cmp	al,[si].len
	jbe	@@m6
;	jb	@@m7
	add	si,type element_tab
	jmp	@@m5
;@@m7:
;	sub	si,type element_tab
@@m6:
push	si	;-1- ��������� ����� �������
;���������� �������, ��������� ������� ��������
	add	si,type element_tab
	mov	cx,len_tab
	sub	cx,si	;������� ����������
std
	lea	si,tab
	add	si,len_tab
	mov	di,si
	sub	si,type element_tab
rep	movsb
cld
;��������� � ��������� ����� �������
pop	di	;-1- ��������������� ����� �������
;�������� ����� �������
push	di	;-1-
	xor	al,al
	mov	cx,type element_tab
rep	stosb
pop	di	;-1-
	lea	si,buf.buf_in
	mov	cl,buf.len_in
	mov	[di].len,cl
	add	di,simv_id
rep	movsb
exit:
	mov	ax,4c00h
	int	21h
end	main
