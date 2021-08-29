;----------------------------------------------------------
;prg4_107.asm - ��������� �� ���������� ���������� �����
;����: mas_dist[]=(7,5,3,1) - ������ ��������; mas[n] - ��������������� ������������������ �������� �������� ��������.
;�����: mas[n] - ������������� ������������������ �������� �������� ��������.
;----------------------------------------------------------
masm
model small
.data
;������ ������
mas	db	44,55,12,42,94,18,06,67
n=$-mas
X	db	0
;������ ������ ����������
mas_dist	db	7,5,3,1
t=$-mas_dist	;t - ���������� ��������� � ������� ����������
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
	xor	bx,bx	;� bx - ��������� �������� �� mas_dist[]
;d1
;��� s:=0 �� t-1
	mov	cx,t	;���� �� t (�������)
	mov	si,0	;������ �� mas_dist[]
@@d2:
;���_����_1
push	cx
;h:=mas_dist[s]
	mov	bl,mas_dist[si] 	;� bx - ��������� �������� �� mas_dist[]
	inc	si
push	si
;��� j:=h �� n-1
	mov	di,bx	;di - ��� j
;j:=h+1 - ��� ������ ��� ��������� ������� � ����
;	inc	di	;j:=h+1
@@d3:
	cmp	di,n-1	;j=<n ?
	ja	@@m1	;����� �������� ��� ��������� mas_dist[]
;���_����_2
;i:=j-h; X:=mas[i]
	mov	si,di
	sub	si,bx	;i:=j-h; si - ��� i
	mov	al,mas[di]	;x:=mas[j]
	mov	x,al	;x:=mas[j]
;@@d4:
;���� X>= mas[i] �� �������_�� @@d6
@@d4:
	mov	al,x
	cmp	al,mas[si]
	jae	@@d6
;d5
;mas[i+h]:=mas[i]; i:=i-h
push	di
push	si
pop	di
	add	di,bx	;i+h
	mov	al, mas[si]	;mas[i+h]:=mas[i]
	mov	mas[di],al	;mas[i+h]:=mas[i]
pop	di
	sub	si,bx	;i:=i-h
;���� i>0 �� �������_�� @@d4
	cmp	si,0
	jg	@@d4
;@@d6:
;mas[i+h]:=x
@@d6:
push	di
push	si
pop	di
	add	di,bx	;i+h
	mov	al,x
	mov	mas[di],al	;mas[i+h]:=x
pop	di
	inc	di	;j:=j+1
	jmp	@@d3
;���_����_2
@@m1:
pop	si
pop	cx
;���_����_1
	loop	@@d2
@@exit:
	mov	ax,4c00h
	int	21h
end	main
