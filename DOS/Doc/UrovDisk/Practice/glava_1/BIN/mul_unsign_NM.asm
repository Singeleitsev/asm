;----------------------------------------------------------
;mul_unsign_NM.asm - ��������� �� ���������� ��������� N-�������� ����� �� ����� �������� M ����
;(������� - ������� ���� �� �������� ������ (�� Intel))
;����: U � V - ��������� ������������ N � M ���� ��������������; b=256 - ����������� ;��������� �����.
;�����: W - ������������ ������������ N+M ����.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;�������� � U � V ����� ������
;U=un-1�u1u0 - ���������_1 ������������ N ����
U	db	?
i=$-U			;i=N
;V=vm-1�v1v0 - ���������_1 ������������ M ����
V	db	?	;���������_2 ������������ M ����
j=$-V			;j=M
len_product=$-U
;w - ��������� ���������, ����� N+M
W	db	len_product dup (0)	;len_product=N+M
k	db	0	;������� 0 � k < 255
b	dw	100h	;������ ��������� �����
.code
mul_unsign_NM	proc
;���_����
;m1
	mov	bx,j-1
	mov	cx,j
;��� j:=M-1 �� 0 //J ���������� � ��������� M-1..0
;���_����_1
m2:
	push	cx	;��������� �����
;//�������� �� ��������� ���� ���������� �������� ��������� (�� �����������)
;���� v[j]==0 �� �������_�� m6
	cmp	v[bx],0
	je	m6
;k:=0; i:=n-1 //i ���������� � ��������� N-1.. 0
;m3
	mov	si,i-1	;i=0..n-1
	mov	cx,i
	mov	k,0
;��� i:=N-1 �� 0
;���_����_2
;//����������� ��������� �������� ����������
m4:
;temp_word:=u[i]*v[j]+w[i+j+1]+k
	mov	al,u[si]
	mul	byte ptr v[bx]
	xor	dx,dx
	mov	dl,w[bx+si+1]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - ��������� ����������
;w[i+j+1]:=temp_word MOD b //������� �� ������� temp_word\b -> w[i+j+1]
;k:=temp_word\b //����� ����� �������� temp_word\b -> k
	push	dx
	xor	dx,dx
	div	b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si+1],ah
;m5
	dec	si
	loop	m4
;���_����_2
;w[j]:=k
	mov	al,k
	mov	w[bx],al
m6:
	dec	bx
	pop	cx
	loop	m2
;���_����_1
	ret
;���_����
mul_unsign_NM	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	mul_unsign_NM
	mov	ax,4c00h
	int	21h
end	main