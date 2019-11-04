;----------------------------------------------------------
;prg4_96.asm - ��������� �� ���������� ���������� ������ ����������
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
X	db	0	;������
.stack	256
.486
.code
main:
;���_����
	mov	dx,@data
	mov	ds,dx
;��� i:=1 �� n-1	//i ���������� � ��������� 0..n-1
	mov	cx,n-1	;���� �� i
	mov	si,1	;i=2
;���_����_1
;���������� �������� �������� ��� ���������� ����
;X:= mas[i]; mas[0]:=X; j:=i-1
cycl3:	mov	al,mas[si]
	mov	x,al
	push	si	;�������� �������� i, ������ j=i
;��� ���� ����, ������� ���������� �������� �� ������� x=mas[i]
;���� (X< mas[j]) ������
;���_����_2
;mas[j+1]:= mas[j]; j:=j-1
cycl2:	mov	al,mas[si-1]
	cmp	x,al	;�������� x < mas[j-1]
	ja	m1	;���� x > mas[j-1]
; ���� x < mas[j-1], ��
	mov	al,mas[si-1]
	mov	mas[si],al
	dec	si
	jmp	cycl2
;���_����_2
; mas[j+1]:=X
m1:	mov	al,x
	mov	mas[si],al
	pop	si
	inc	si
	loop	cycl3
;���_����_1
;�����
;���_����
	mov	ax,4c00h
	int	21h
end	main
