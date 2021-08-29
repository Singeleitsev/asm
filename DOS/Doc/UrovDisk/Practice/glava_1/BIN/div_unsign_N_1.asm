;----------------------------------------------------------
;div_unsign_N_1.asm - ��������� �� ���������� ������� ��� ����� ����� �������� �������� N ���� �� �������� �������� 1 ����.
;������� ���������� ���� - ������� ���� �� �������� ������ (�� Intel)
;����: u - �������; v - ��������.
;�����: w - �������, r - �������.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;�������� � u � v ����� ������
u	db	?	;�������
N=$-u	;����� � ������ �������� u
v	db	?	;��������
w	db	N dup (0)
r	dw	0	;�������
.code
div_unsign_N_1	proc
	mov	r,0
	xor	si,si	;j=0
	mov	cx,N
	xor	dx,dx
	xor	bx,bx
@@m1:	mov	ax,256	;��������� �.�.
	mul	r	;��������� � dx:ax
	mov	bl,u[si]
	add	ax,bx
	div	v
;������������ ���������:
	mov	w[si],al	;�������
	shr	ax,8
	mov	r,ax	;������� � r
	inc	si
	loop	@@m1
	ret
div_unsign_N_1	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	div_unsign_N_1
	mov	ax,4c00h
	int	21h
end	main
