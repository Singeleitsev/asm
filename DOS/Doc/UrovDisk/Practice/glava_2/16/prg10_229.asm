;----------------------------------------------------------
;prg10_229.asm - ��������� �� ���������� ������������� ����������
;����: mas[n] - ��������������� ������������������ 
;�������� �������� ��������.
;�����: mas[n] - ������������� ������������������ 
;�������� �������� ��������.
;----------------------------------------------------------
masm
model small
.data
;������ ������
mas	db	17h,05h,99h,3h,33h,7h,13h,27h,77h,9h,69h,11h,81h,14h,2h,8
n=$-mas
x	db	0	;��������� ����������
i	dw	0
l	dw	0
m	dw	0
j	dw	0
k	dw	0
.stack	256
.486
.code
insert_item_in_tree	proc
;----------------------------------------------------------
;��������� insert_item_in_tree (i, mas, N)
;�� �����:
;si - ����� �������� i � ������������������ (� �����)
;mas - ������ ���������
;m=n/2 - ��������, ������ �������� ����� ��������� ������� mas
;----------------------------------------------------------
push	si
push	cx
;j:=i
	mov	j,si	;j:=i
;@@m1:
@@m4:
	mov	si,j	;i->si
	mov	ax,j
;k:=2*j; l:=k+1
	shl	ax,1	;j*2
	mov	k,ax	;k:=j*2
	inc	ax
	mov	l,ax	;l:=k+1
;���� (l=<N � (mas[j]<mas[k] ��� mas[j]<mas[l]) �� �������_�� @@m6
;����� �������_�� @@m2
;���_����
	cmp	ax,m	;l<m
	ja	@@m2
	mov	al,mas[si-1]	;ax:=mas[j]
	mov	di,k
	cmp	al,mas[di-1]
	jna	@@m6

	inc	di
	cmp	al,mas[di-1]
	jna	@@m6

	jmp	@@m2
;@@m6:
;���� mas[k]>mas[l] �� �������_�� @@m4
;����� �������_�� @@m3
;���_����
@@m6:
;������� �����������:
;2j+1+<M AND (mas[j]<mas[2j] OR mas[j]<mas[2j+1])
;����� � mas[j]
	mov	di,k
	mov	al,mas[di-1]	;ax:=mas[k]
	inc	di
	cmp	al,mas[di-1]	;mas[k]>mas[l]
	jna	@@m3
;@@m4:
;x:=mas[j]
;mas[j]:=mas[k]
;j:=k
;mas[k]:=x
;�������_�� @@m1
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j]
	dec	di
	mov	al,mas[di-1]
	mov	mas[si-1],al	;mas[j]:=mas[k]
	mov	j,di	;j:=k
	mov	al,x
	mov	mas[di-1],al	;mas[k]:=x
	jmp	@@m4
;@@m3:	x:=mas[j]
;	mas[j]:=mas[l]
;	mas[l]:=x
;	j:=l
;�������_�� @@m1
@@m3:	;mas[k] =< mas[l]
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j]
	mov	al,mas[di-1]
	mov	mas[si-1],al	;mas[j]:=mas[l]
	mov	j,di	;j:=l
	mov	al,x
	mov	mas[di-1],al	;mas[l]:=x
	jmp	@@m4
;@@m2:
;���� (k==n � mas[j]<mas[k]) �� �������_�� @@m7
;����� �������_�� @@m8
;���_����
@@m2:	; ������� �� �����������: 2j+1+<M AND (mas[j]<mas[2j] OR mas[j]<mas[2j+1])
	mov	ax,k
	cmp	ax,m
	jne	@@m1

	mov	di,k
	mov	al,mas[di-1]	;al:=mas[k]
	cmp	mas[si-1],al	;mas[j]<mas[k]
	jae	@@m1
;@@m7:	x:=mas[j]
;mas[j]:=mas[n]
;mas[n]:=x
	mov	al,mas[si-1]
	mov	x,al	;x:=mas[j]
	mov	di,n
	mov	al,mas[di-1]
	mov	mas[si-1],al	;mas[j]:=mas[n]
	mov	al,x
	mov	mas[di-1],al	;mas[n]:=x
;@@m8:
;�������
@@m1:
pop	cx
pop	si
	ret
insert_item_in_tree	endp
main:
	mov	dx,@data
	mov	ds,dx
;i:=n/2; l:=i; m:=n
	mov	ax,n	;n-1
	mov	m,ax	;m:=n
	shr	ax,1
	mov	i,ax	;i:=n\2
	mov	l,ax	;l:=i
;//������ �������� �� ������ �������� �������
;��� k:=1 �� l
;������ ��������:
	mov	cx,l	;���� �� k:=1..l
	mov	si,i
@@cycl1:
;���_����_1
	mov	i,si
;insert_item_in_tree (i, mas, m)
	call	insert_item_in_tree
;i:=i-1
	dec	si	;i:=i-1
;���_����_1
	loop	@@cycl1
;� ������ ���������� ����������:
;//��������� ��������
;��� k:=2 �� n
	mov	cx,n-1	;n-2
@@cycl2:
;���_����_1
;x:=mas[1]
;mas[1]:=mas[m]
;mas[m]:=x
;m=m-1
	xor	si,si
	mov	al,mas[si]
	mov	x,al	;x:=mas[1]
	mov	di,m
	mov	al,mas[di-1]
	mov	mas[si],al	;mas[1]:=mas[m]
	mov	al,x
	mov	mas[di-1],al	;mas[m]:=x
	dec	m
	inc	si	;i:=1
;insert_item_in_tree (1, mas, m)
	call	insert_item_in_tree
;���_����_1
	loop	@@cycl2
;�����
	mov	ax,4c00h
	int	21h
end	main
