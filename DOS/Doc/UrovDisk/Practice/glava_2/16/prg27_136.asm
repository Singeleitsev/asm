;----------------------------------------------------------
;prg27_136 (�� �����) - ��������� �� ���������� "������� ����������" �������.
;����: mas[n] - ��������������� ������������������ �������� �������� ������ n.
;�����: mas[n] - ������������� ������������������ �������� �������� ������ n.
;----------------------------------------------------------
masm
model small
.data
;������ ������
mas	db	50h,08h,52h,06h,90h,17h,89h,27h,65h,42h,15h,51h,61h,67h,76h,70h
n=$-mas
k	db	1
L	dw	0	;��������� ��������� ������� � 0
R	dw	n-1	;��������� ��������� ������� � 0
M	dw	1	;����� ��������������������� (��� ������� ������� 1)
I	dw	0
J	dw	0
temp	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;���_����
;q1
;EC�� M�N �� �������_�� q9
;l:=1; r:=n
	cmp	M,n
	jae	q9	;�� ��� 9
;��������_�_���� (0ffffh)	//0ffffh - ������� ������� �����
;q2:
;i:=l; j:=r+1; k:=mas[l]
	push	0ffffh	; 0ffffh - ������� ������� �����
q2:
;i:=l; j:=r+1; k:=mas[l]
	mov	si,L	;i(si):=L
	mov	di,R
	inc	di	;j(di):=R+1
	xor	ax,ax
	mov	al,mas[si]
	mov	k,al
;q3:
q3:
;EC�� i=<j-1 �� �������_�� qq3
;�������_�� q4	//�������� ����������
	inc	si	;i:=i+1
	cmp	si,di	;i=<j
	jle	qq3
	dec	si	;��������� i=<j
	jmp	q4	;�������� ����������
;qq3:
qq3:
;i:=i+1
;EC�� mas[i]<K �� �������_�� q3
	mov	al,k
	cmp	mas[si],al
	jb	q3
;q4:
q4:
;j:=j-1
	dec	di	;j:=j-1
;EC�� j<i �� �������_�� q5
	cmp	di,si	;j>=i-1
	jb	q5
;EC�� K<mas[j] �� �������_�� q4
	mov	al,k
	cmp	al,mas[di]
	jb	q4
q5:
;EC�� j>i �� �������_�� q6
	cmp	di,si	;j=<i ???
	jg	q6
;//����� mas[l]:= mas[j]
;TEMP:=mas[l]; mas[l]:=mas[j]; mas[j]:=TEMP
;mas[L]<->mas[j]
	mov	bx,L
	mov	dl,mas[bx]
	xchg	mas[di],dl
	xchg	mas[bx],dl
;�������_�� q7
	jmp	q7
;q6:
q6:
; mas[i]<-> mas[j]
;TEMP:=mas[i]; mas[i]:=mas[j]; mas[j]:=TEMP
	mov	dl,mas[si]
	xchg	mas[di],dl
	xchg	mas[si],dl
;�������_�� q3
	jmp	q3
;q7:
q7:
;EC�� r-j�j-l>M �� 
	mov	ax,r
	sub	ax,di	;r-j->ax
	mov	bx,di
	sub	bx,l	;j-l->bx
;r-j�j-l ???
	cmp	ax,bx
	jl	q7_m4
;j-l>M ???
	cmp	bx,M
	jle	q7_m3
;1. r-j�j-l>M - � ���� (j+1,r); r:=j-1; ������� �� ��� q2
;���_����_1
;��������_�_���� (j+1,r)
	mov	ax,di
	inc	ax
	push	ax
	push	r
	mov	r,di
;r:=j-1
	dec	r
;�������_�� q2
	jmp	q2
;���_����_1
q7_m4:
;EC�� j-l>r-j>M �� 
;���_����_1
;��������_�_���� (j+1,r)
;r:=j-1
;�������_�� q2
;���_����_1
;EC�� j-l>r-j>M �� 
;���_����_1
;��������_�_���� (l,j-1)
;l:=j+1
;�������_�� q2
;���_����_1
;EC�� r-j>M�j-l �� 
;���_����_1
;l:=j+1
;�������_�� q2
;���_����_1
;EC�� j-l>M�r-j �� 
;���_����_1
;r:=j-1
;�������_�� q2
;���_����_1
;r-j>M ???
	cmp	ax,M
	jg	q7_m2
	cmp	bx,M
	jle	q8
;4. j-l>M�r-j - r:=j-1; ������� �� ��� q2
	mov	r,di
	dec	r
	jmp	q2
q7_m3:
	cmp	ax,M
	jle	q8
;3. r-j>M�j-l - l:=j+1; ������� �� ��� q2
	mov	l,di
	inc	l
	jmp	q2
q7_m2:
;2. j-l>r-j>M - � ���� (l,j-1); l:=j+1; ������� �� ��� q2
	push	l
	mov	ax,di
	inc	ax
	push	ax
	mov	l,di
	inc	l
	jmp	q2
q8:
;��������� �� ����� ��������� ���� (l,r)
;�������_��_����� (l,r)
	pop	r
;EC�� r<>0ffffh �� �������_�� q2
	cmp	r,0ffffh
	je	q9
	pop	l
	jmp	q2
q9:
;���������� ������� ������ ��������� - ��� M=1 ���� ��� ����� �������� (��� � ������� ��� �������� �����)
;�����
exit:
;���_����
	mov	ax,4c00h
	int	21h
end	main
