;----------------------------------------------------------
;div_unsign_N_1_I.asm - ��������� �� ���������� ������� ��� ����� ����� �������� �������� N ���� �� �������� �������� 1 ����.
;������� ���������� ���� - ������� ���� �� �������� ������ (Intel)
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
div_unsign_N_1_I	proc
	mov	r,0
	mov	si,N-1	;j=N-1
	mov	cx,N
	xor	dx,dx
	xor	bx,bx
@@m1:	mov	ax,256	;��������� �.�.
	mul	word ptr r	;��������� � dx:ax
	mov	bl,u[si]
	add	ax,bx
	div	v
;������������ ���������:
	mov	w[si],al	;�������
	shr	ax,8
	mov	r,ax	;������� � r
	dec	si
	loop	@@m1
	ret
div_unsign_N_1_I	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	div_unsign_N_1_I
	mov	ax,4c00h
	int	21h
end	main
