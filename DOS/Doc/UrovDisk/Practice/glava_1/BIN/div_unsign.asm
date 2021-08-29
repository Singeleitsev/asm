;----------------------------------------------------------
;div_unsign.asm - ��������� �� ���������� ������� ��� ����� ����� �������� �������� 2 ����� �� �������� �������� 1 ����.
;����: u - �������; v - ��������.
;�����: w - �������, r - �������.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;�������� � u � v ����� ������
u	dw	?	;�������
v	db	?	;��������
w	db	0
r	db	0
.code
div_unsign	proc
	mov	ax,u
	div	v
;������������ ���������:
	mov	r,ah	;�������
	mov	w,al	;�������
	ret
div_unsign	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	div_unsign
	mov	ax,4c00h
	int	21h
end	main
