;----------------------------------------------------------
;prg4_101.asm - ��������� �� ���������� ���������� ������ ������� 1
;����: mas [n] - ��������������� ������������������ 
;�������� �������� ��������.
;�����: mas [n] - ������������� ������������������ �������� 
;�������� ��������.
;----------------------------------------------------------
masm
model small
.data
;������ ������
mas	db	44,55,12,42,94,18,06,67
n=$-mas
X	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;������� ���� - �� i
;��� i:=1 �� n-1	//i ���������� � ��������� 1..n-1
	mov	cx,n-1
	mov	si,1
;���_����_1
cycl1:
;��� j:=n-1 ������ i	//j ���������� � ��������� i+1..n
	push	cx
	mov	cx,n
	sub	cx,si	;���������� ���������� ����������� �����
	push	si	;�������� �������� i - ������ j=n
	mov	si,n-1
cycl2:
;���� mas[j-1]< mas[j] ��
	mov	al,mas[si-1]
	cmp	mas[si],al
	ja	m1
;���_����_2
;x:=mas[j-1]; mas[j-1]:=mas[j]; mas[j]:=X
	mov	x,al	;x=mas[j-1]
	mov	al,mas[si]
	mov	mas[si-1],al	;mas[j-1]= mas[j]
	mov	al,x
	mov	mas[si],al	;mas[j]=x
m1:
	dec	si	;���� �� j � ����������� n-i ���
;���_����_2
	loop	cycl2
	pop	si
	inc	si
	pop	cx
;���_����_1
	loop	cycl1
;�����
	mov	ax,4c00h
	int	21h
end	main
