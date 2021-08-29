;----------------------------------------------------------
;mul_sign_NM_I.asm - ��������� �� ���������� ��������� N-�������� ����� �� ����� �������� M ����
;(������� - ������� ���� �� �������� ������ (Intel))
;����: U � V - ��������� �� ������ ������������ N � M ���� ��������������; b=256 - ����������� ;��������� �����.
;�����: W - ������ ������������ ������������ N+M ����.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;�������� � U � V ����� ������
;�������, ��� ������� ������������� ������������ �������� � ;�������� ������ ������ ������������ � �������������� ���� ;(� � ������� ���� ����������� ��� �� Intel)!
U	db	?	;��������� 1 ������������ N ����
i=$-U
V	db	?	;��������� 2 ������������ M ����
j=$-V
len_product=$-U
W	db	len_product dup (0)
k	db	0	;������� 0 � k < 255
b	dw	100h	;������ ��������� �����
sign	db	0	;���������� � �����
.code
.486
;�������� �������� �������� calc_complement, calc_abs, mul_unsign_NM_I
calc_complement	proc
	xor	si,si
	neg	byte ptr [bx]	;���������� ������� �����
	cmp	byte ptr [bx],0	;������� ������� - ������ ������
	jne	short $+3
	stc		;���������� cf, ��� ��� ���� �������
	dec	cx
	jcxz	@@m1	;��� ������������ ��������
@@cycl:	inc	si
	not	byte ptr [bx][si]
	adc	byte ptr [bx][si],0
	loop	@@cycl
@@m1:
	ret
calc_complement	endp
calc_abs	proc
;��������� ���� ��������
	mov	si,cx
	dec	si
	test	byte ptr [bx][si],80h	;��������� ���� ��������
	jz	@@exit	;����� �������������
	call	calc_complement
@@exit:	ret
calc_abs	endp
mul_unsign_NM_I	proc
;���_����
;m1
;��� j:= 0 �� M-1 //J ���������� � ��������� 0..M-1
	xor	bx,bx
	mov	cx,j
m2:
;���_����_1
	push	cx	;��������� �����
;//�������� �� ��������� ���� ���������� �������� ��������� (�� �����������)
;���� v[j]==0 �� �������_�� m6
	cmp	v[bx],0
	je	m6
;m3
;k:=0; i:=n-1 //i ���������� � ��������� 0..N-1
;��� i:= 0 �� N-1
	xor	si,si
	mov	cx,i
	mov	k,0
m4:
;���_����_2
;//����������� ��������� �������� ����������
;temp_word:=u[i]*v[j]+w[i+j]+k
	mov	al,u[si]
	mul	byte ptr v[bx]
	xor	dx,dx
	mov	dl,w[bx+si]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - ��������� ����������
;w[i+j]:=temp_word MOD b //������� �� ������� temp_word\b -> w[i+j]
;k:=temp_word\b //����� ����� �������� temp_word\b -> k
	push	dx
	xor	dx,dx
	div	b	;t mod b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si],ah
;m5
	inc	si
	loop	m4
;���_����_2
;w[i+j]:=k
	mov	al,k
	mov	w[bx+si],al
;m6:
m6:
	inc	bx
	pop	cx
	loop	m2
;���_����_1
	ret
;���_����
mul_unsign_NM_I	endp

mul_sign_NM_I	proc
;���_����
;��������� ���� ����������
;���� ���_7_�����((u[i-1] AND 80h) XOR v[j-1])==1 �� sign:=1 //��������� ����� �������������
	xor	ax,ax
	mov	si,i-1
	mov	al,u[si]
	and	al,80h
	mov	si,j-1
	xor	al,v[si]
	bt	ax,7
	jnc	$+7
	mov	sign,1	;��������� ����� �������������
;������� ������ ������������:
;u:=|u|
;v:=|v|
	lea	bx,v
	mov	cx,j
	call	calc_abs
	lea	bx,u
	mov	cx,i
	call	calc_abs
;������ ��������
;w:= mul_unsign_NM_I()	//� ���� ����� - ������ ����������
	call	mul_unsign_NM_I
;� ���� ����� �������� ������ ����������, �����, ���� �����
;��������������� ���� ���������� � �������� ��� ���������� (���� �����)
;���� sign==0 �� �������_�� @@m
	cmp	sign,0
	je	@@m
mov	cx,i+j
lea	bx,w
call	calc_complement
;w:=calc_complement()
;m:
;���� ����� �������� ���������� ����������
@@m:
	ret
;���_����
mul_sign_NM_I	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	mul_sign_NM_I
	mov	ax,4c00h
	int	21h
end	main
