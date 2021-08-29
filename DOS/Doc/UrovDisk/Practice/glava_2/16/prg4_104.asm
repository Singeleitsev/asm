;----------------------------------------------------------
;prg4_104.asm - ��������� �� ���������� ���������� ������ ������� 2 (���������)
;����: mas [n] - ��������������� ������������������ �������� �������� ��������.
;�����: mas [n] - ������������� ������������������ �������� �������� ��������.
;----------------------------------------------------------
masm
model small
.data
;������ ������
mas	db	44,55,12,42,94,18,06,67
n=$-mas
X	db	0
L	dw	1
R	dw	n
k	dw	n
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;l:=2; r:=n; k:=n
;���������
cycl3:
;��� j:=r ������ l
	mov	si,R	;j:=R
	push	si
	sub	si,L
	mov	cx,si	;���������� ���������� ����� cycl1
	pop	si
	dec	si
cycl1:
;���� mas[j-1]< mas[j] ��
	mov	al,mas[si-1]
	cmp	al,mas[si]
	jna	m1
;���_����_1
;x:=mas[j-1]; mas[j-1]:=mas[j]; mas[j]:=X; k:=j
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j-1]
	mov	al,mas[si]
	mov	mas[si-1],al	;mas[j-1]:=mas[j]
	mov	al,x
	mov	mas[si],al	;mas[j]:=x
	mov	k,si	;k:=j
m1:	dec	si	;j:=j-1
;���_����_1
	loop	cycl1
	mov	ax,k
	inc	ax
	mov	L,ax	;L:=k+1
; ���� cycl2
;��� j:=l ������ r
	mov	si,L	;j:=L
	mov	ax,R
	sub	ax,L
	mov	cx,ax	;���������� ���������� ����� cycl2
cycl2:
;���� mas[j-1]< mas[j] ��
	mov	al,mas[si-1]
	cmp	al,mas[si]
	jna	m2
;���_����_2
;x:=mas[j-1]; mas[j-1]:=mas[j]; mas[j]:=X; k:=j
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j-1]
	mov	al,mas[si]
	mov	mas[si-1],al	;mas[j-1]:=mas[j]
	mov	al,x
	mov	mas[si],al	;mas[j]:=x
	mov	k,si	;k:=j
m2:	inc	si	;j:=j+1
;���_����_2
	loop	cycl2
;r:=k-1
	mov	ax,k
	dec	ax
	mov	R,ax	;R:=k-1
;���� (l>r)
	cmp	L,ax	;L>R ? ?
	jae	exit
	jmp	cycl3
exit:	;�����
	mov	ax,4c00h
	int	21h
end	main
