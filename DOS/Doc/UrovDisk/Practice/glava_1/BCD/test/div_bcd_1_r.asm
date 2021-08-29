masm
model small
div_bcd_1_r	macro	u,N,v,w,r
local	m1
;--------------------------------------------------------------------------------;
;div_bcd_1_r u,N,v,w,r - ������� N-���������� ������������ ������ BCD-����� �� ������������� BCD-����� �������� 1 ����.
;����: u - �������; N - ����� ��������, v - ��������.
;�����: w - �������, r - �������.
;������� ���������� ���� - ������� ���� �� �������� ������ (�� Intel) !!!!!!!.
;--------------------------------------------------------------------------------;
	mov	r,0
	lea	si,u	;j=0
	xor	di,di	;j=0
	mov	cx,N
	xor	dx,dx
	xor	bx,bx
m1:
	mov	ah,r
	mov	al,[si]
	aad
	div	v
;������������ ���������:
	mov	w[di],al	;�������
	mov	r,ah	;������� � r
	inc	si
	inc	di
	loop	m1
;���� ����� - ������� ������ (������� ����� �����������)
;	mov	cx,N	;����� ��������
;	lea	bx,w
;	call	calc_abs_r
	endm

.data
;�������� � U � V ����� ������
uu	db	9,3,4,5,9	;������� ������������ ii ����
ii=$-uu
vv	db	9	;�������� ������������ 1 ����
ww	db	ii dup (0)
rr	db	0	;�������

.stack	256
.486

.code
main:
	mov	dx,@data	
	mov	ds,dx	

	div_bcd_1_r	uu,ii,vv,ww,rr

	mov	ax,4c00h
	int	21h	
end	main		