;---------------------------------------------------------
;mul_sign_NM.asm - ��������� �� ���������� ��������� N-�������� ����� �� ����� �������� M ����
;(������� - ������� ���� �� �������� ������ (�� Intel))
;����: U � V - ��������� �� ������ ������������ N � M ���� ��������������; b=256 - ����������� ;��������� �����.
;�����: W - ������ ������������ ������������ N+M ����.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.486
.data
;�������� � U � V ����� ������
;�������, ��� ������� ������������� ������������ �������� � ;�������� ������ ������ ������������ � �������������� ���� ;(� � ������� ���� - ������� ���� �� �������� ������)!
U	db	?	;��������� 1 ������������ N ����
i=$-U
V	db	?	;��������� 2 ������������ M ����
j=$-V
len_product=$-U
W	db	len_product dup (0)	;��������� ������ N+M ����
k	db	0	;������� 0 � k < 255
b	dw	100h	;������ ��������� �����
sign	db	0	;���������� � �����
.code
.486
;�������� �������� �������� calc_complement_r, calc_abs_r, ;mul_unsign_NM
calc_complement_r	proc
	dec	cx
	mov	si,cx
	neg	byte ptr [bx][si]	;���������� ������� �����
	cmp	byte ptr [bx][si],0	;operand=0 - ������ ������
	jne	short $+3
	stc		;���������� cf, ��� ��� ���� �������
	jcxz	@@exit_cycl	;��� ������������ �����
@@cycl:	dec	si
	not	byte ptr [bx][si]
	adc	byte ptr [bx][si],0
	loop	@@cycl
@@exit_cycl:	ret
calc_complement_r	endp
calc_abs_r	proc
;��������� ���� ��������
	test	byte ptr [bx],80h	;��������� ���� operand
	jz	@@exit	;����� �������������
	call	calc_complement_r
@@exit:	ret
calc_abs_r	endp
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
mul_sign_NM	proc
;���_����
;��������� ���� ����������
; ���� ���_7_�����((u[0] AND 80h) XOR v[0])==1 �� sign:=1
	xor	ax,ax
	mov	al,u
	and	al,80h
	xor	al,v
	bt	ax,7
	jnc	$+7
	mov	sign,1	;��������� ����� �������������
;������� ������ ������������:
;u:=|u|
;v:=|v|
	lea	bx,v
	mov	cx,j
	call	calc_abs_r
	lea	bx,u
	mov	cx,i
	call	calc_abs_r
;������ ��������
;w:=mul_unsign_NM()
	call	mul_unsign_NM
;� ���� ����� - ������ ����������
;��������������� ���� ����������
;���� sign==0 �� �������_�� @@m
	xor	si,si
	cmp	sign,0
	je	@@m
;//��� �������������� ���������� ��������� ���������� �������� w ������ i+j
;w:=calc_complement_r(); w[0]:=0-w[0]
	mov	cx,i+j
	lea	bx,w
	call	calc_complement_r
;� ���� ����� - �������� ���������� ����������
@@m:
	ret
;���_����
mul_sign_NM	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	mul_sign_NM
	mov	ax,4c00h
	int	21h
end	main
