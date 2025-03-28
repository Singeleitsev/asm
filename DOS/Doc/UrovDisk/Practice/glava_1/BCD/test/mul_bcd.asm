masm
model small
mul_bcd	macro	u,i,v,j,w
local	m2,m4,m6
;--------------------------------------------------------------------------------;
;mul_bcd u,i,v,j,w - ������������ ��������� ������������� BCD-����� u � v �������� i � j ���� � ��������� ���������� � w.
;����: u - ����� ������� ���������; i - ����� u; v - ����� ������� ���������; j - ����� v; w - ����� ������� ������������ i+j ����, ���� ���������� ��������� ������������; b=256 - ����������� ��������� �����.
;�����: w - ������������ ������������ i+j ����.
;������� ���������� ���� - ������� ���� �� �������� ������ (Intel).
;--------------------------------------------------------------------------------;
;�������� ��������
	push	si
;������� w
	cld
	push	ds
	pop	es
	xor	al,al
	lea	di,w
	mov	cx,i+j
rep	stosb
;m1
	xor	bx,bx	;j=0..m-1
	mov	cx,j
m2:
	push	cx	;��������� �����
	cmp	v[bx],0
	je	m6
;m3
	xor	si,si	;i=0..n-1
	mov	cx,i
	mov	k,0
m4:
	mov	al,u[si]
	mul	v[bx]
	xor	dx,dx
	mov	dl,w[bx+si]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - ��������� ����������
	aam	;������������ ��������� - (ah)=����� ��������; (al)=���������
	mov	k,ah
	mov	w[bx+si],al
;m5
	inc	si
	loop	m4
	mov	al,k
	mov	w[bx+si],al
m6:
	inc	bx
	pop	cx
	loop	m2
	pop	si
	endm

.data
;�������� � U � V ����� ������
uu	db	9,3,4,5,9	;��������� 1 ������������ N ����
ii=$-uu
vv	db	9,9,9,9	;��������� 2 ������������ M ����
jj=$-vv
l_p=$-uu
ww	db	l_p dup (0)
k	db	0	;������� 0 � k < 255

.stack	256
.486

.code
main:
	mov	dx,@data	
	mov	ds,dx	

	mul_bcd	uu,ii,vv,jj,ww

	mov	ax,4c00h
	int	21h	
end	main