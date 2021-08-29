;----------------------------------------------------------
;rand_mix_cong_1.asm - ������ �������� (���������) 
;������������ ������������������ ��������� ����� (c>0).
;����: X0, a, c, m - � ������������ � ���������� ���� 
;�������������.
;�����: dl - �������� ���������� ���������� �����.
;----------------------------------------------------------
masm
model small
.486
.data
m	db	128	;128=27
a	db	9
x	db	3	;��������� ��������
c	dw	3
.stack	256
.486
.code
main:
	mov	dx,@data	
	mov	ds,dx	
	xor	dx,dx
	mov	cl,7	;�������� ������� m=27 � cl
;������ ����� � ������������������ x=3
cycl:
;��������� ��������� ��������� ����� X=(a*X) mod m
	mov	al,x
	mul	a	;a*x � ah:al
	add	ax,c
	shrd	ax,ax,cl
	xor	al,al
	rol	ax,cl	;� al ��������� �����
;����� � ���� - ��������� ������ rand_mult_cong.exe > p.txt
	mov	x,al
	mov	dl,al
	mov	ah,02
	int	21h
	jmp	cycl
end_cycl:
	mov	ax,4c00h
	int	21h
end	main
