;----------------------------------------------------------
;prg4_99.asm - ��������� �� ���������� ���������� ������ �������
;����: mas [n] - ��������������� ������������������ 
;�������� �������� ��������.
;�����: mas [n] - ������������� ������������������ 
;�������� �������� ��������.
;----------------------------------------------------------
masm
model small
.data
;������ ������
mas	db	44,55,12,42,94,18,06,67
n=$-mas
X	db	0
K	dw	0
.stack	256
.486
.code
;���_����
main:
	mov	dx,@data
	mov	ds,dx
;��� i:=1 �� n-1 //i ���������� � ��������� 1..n-1
;������� ���� - �� i
	mov	cx,n-1
	mov	si,0
;���_����_1
;//���������� �������� �������� ��� ���������� ����
cycl1:
	push	cx
;k:=i; X:= mas[i]
	mov	k,si	;k:=i
	mov	al,mas[si]
	mov	x,al	;x:=mas[i]
	push	si	;�������� �������� i - ������ j=I+1
	inc	si	;j=I+1
;��������� ���� - �� j
	mov	al,n
	sub	ax,si
	mov	cx,ax	;���������� ���������� ����������� ����� �� j
;��� j:=i+1 �� n	//j ���������� � ��������� i+1..n
cycl2:
;���� mas[j]<X ��
;���_����_2
	mov	al,mas[si]
	cmp	al,x
	ja	m1
;k:=j; x:= mas[j]
	mov	k,si	;k:=j
;���_����_2
	mov	al,mas[si]
	mov	x,al	;x:=mas[k]
m1:	inc	si	;j:=j+1
	loop	cycl2
;mas[k]:= mas[i]; mas[i]:=X
	pop	si
	mov	al,mas[si]
	mov	di,k
	mov	mas[di],al	;mas[k]:=mas[i]
	mov	al,x
	mov	mas[si],al	;mas[i]:=x
	inc	si
	pop	cx
;���_����_1
	loop	cycl1
;�����
	mov	ax,4c00h
	int	21h
;���_����
end	main
