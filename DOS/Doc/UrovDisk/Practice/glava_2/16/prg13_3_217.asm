;----------------------------------------------------------
;prg13_3_217.asm - ��������� �� ���������� ���������������� ������� � �������� �������.
;����: mas[n] - ������� m*n.
;�����: _mas[n] - ����������������� ������� n*m.
;----------------------------------------------------------
masm
model small
.data
m	db	3	;i=0..2
n	db	4	;j=0..3
mn	dw	0	;m*n-1
;������ ������� 3*4 (m*n):
mas	db	02h,04h,06h,08h,16h,24h,38h,45h,47h,48h,57h,56h
s_mas=$-mas
_mas	db	s_mas dup (0ffh)
temp	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
	xor	ecx,ecx
;���������� m*n-1
	mov	al,m
	mul	n
	dec	ax
	mov	cx,ax	;cx:=m*n-1
	mov	mn,ax	;mn:=m*n-1
	xor	si,si	;i:=0
m1:
	mov	bl,mas[si]
;���������� ����� ������� � _mas �
	xor	ax,ax
	mov	al,m
	mul	si
	div	mn
	mov	di,dx
;� � ���������
	mov	_mas[di],bl
	inc	si
	loop	m1
;��������� ������� �� ���� �����:
	mov	bl,mas[si]
	mov	_mas[si],bl
;�����
	mov	ax,4c00h
	int	21h
end	main
