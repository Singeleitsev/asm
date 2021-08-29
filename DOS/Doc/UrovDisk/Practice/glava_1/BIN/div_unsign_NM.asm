;----------------------------------------------------------
;div_unsign_NM.asm - ��������� �� ���������� ������� (N+M)-���������� ������������ ������ �� ����� �������� N ����
;(������� - ������� ���� �� �������� ������ (�� Intel))
;����: U � V - u=um+n-1..+u1u0 - �������; v=vn-1�v1v0-
;��������, m - ����� ��������;n - ����� ��������; b=256 -
;��������� ������� ���������.
;�����: q=qmqm-1�q1q0 - �������, r=rn-1�r1r0 - �������.
;�����������: vn-1�0 OR 0ffh; N>1.
;----------------------------------------------------------
masm
model small,c
.data
;�������� � u � v ����� ������
u0	db	0	;�������������� ������� ���� �������� ��� ������������
u	db	1fh,0c3h,12h,0ffh	;�������
m=$-u	;����� � ������ �������� u
v0	db	0	;��� ��������������� �������� 0vn-1�v1v0
v	db	3fh,50h	;��������
n=$-v	;����� � ������ �������� v
mm=m-n
w	db	m+1 dup (0)	;��� ������������� ����������
q	db	mm dup (0)	;�������
qq	dw	0	;��������� �������	;qq	db	0
rr	dw	0	;��������� �������
r	db	n dup (0)	;�������
d	db	0
temp	dw	0
temp_r	db	n dup (0)
borrow	db	0	;���� ����� �� ���� D4
k	db	0	;������� 0 � k < 255
b	dw	100h	;������ ��������� �����
carry	db	0

.stack	256
.486
.code
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

mul_unsign_NM	macro	u,i,v,j,w
local	m2,m4,m6
	push	si
;������� w
	push	ds
	pop	es
	xor	al,al
	lea	di,w
	mov	cx,i+j
rep	stosb

;m1
	mov	bx,j-1	;j=0..m-1
	mov	cx,j
m2:
	push	cx	;��������� �����
	cmp	v[bx],0
	je	m6
;m3
	mov	si,i-1	;i=0..n-1
	mov	cx,i
	mov	k,0
m4:
	mov	al,u[si]
mul	byte ptr v[bx]
	xor	dx,dx
	mov	dl,w[bx+si+1]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) ? ��������� ����������
	push	dx
	xor	dx,dx
	div	b	;t mod b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si+1],ah
;m5
	dec	si
	loop	m4
	mov	al,k
	mov	w[bx],al
m6:
	dec	bx
	pop	cx
	loop	m2
	pop	si
	endm

sub_sign_N	macro	minuend,deduction,N
local	cycl,m1
;������� ���� �� �������� ������
	push	si
	mov	cl,N
	mov	si,N-1
cycl:	mov	al,deduction[si]
	sbb	minuend[si],al
;	jnc	m1
;	neg	minuend[si]
m1:	dec	si
	loop	cycl
	pop	si
	endm

add_unsign_N	macro	carry,summand_1,summand_2,N
	local	cycl,end_p
	mov	cl,N
	mov	si,N-1
cycl:	mov	al,summand_2[si]
	adc	summand_1[si],al
	dec	si
	loop	cycl
	jnc	end_p
	adc	carry,0
end_p:	nop
	endm

div_sign_N	macro	u,N,v,w,r
local	m1
;������� ���� �� �������� ������
	mov	r,0
	lea	si,u	;j=0
	xor	di,di	;j=0
	mov	cx,N
	xor	dx,dx
	xor	bx,bx
m1:	mov	ax,256	;��������� �.�.
	mul	word ptr r	;��������� � dx:ax
	mov	bl,[si]
	add	ax,bx
	div	v
;������������ ���������:
	mov	w[di],al	;�������
	mov	r,ah	;������� � r
	inc	si
	inc	di
	loop	m1
;���� ����� - ������� ������ (������� ����� �����������)
;	mov	cx,N	;����� ��������
;	lea	bx,w
;	call	calc_abs_r
	endm

div_unsign_NM	proc
;���_����
;//��� 1 - ������������:
;D1 - ������������
;d:=b/(v[n-1]+1)
	xor	ax,ax
	mov	dl,v
	inc	dl	;vn-1+1
	mov	ax,b
	div	dl
	mov	d,al	;d=b/(v1+1)
;u[n+m�0]:=u[n+m-1�0]*d
	mul_unsign_NM	u,m,d,1,w
	cld
	push	ds
	pop	es
	lea	si,w
	lea	di,u0
	mov	cx,m+1
rep	movsb
;v[n-1�0]:=v[n-1�0]*d
	mul_unsign_NM	v,n,d,1,w
	cld
	push	ds
	pop	es
	lea	si,w+1
	lea	di,v
	mov	cx,n
rep	movsb
;//��� 2 - ��������� ��������� j:
;mm:=m-n; j:=mm
;D2:
	mov	si,0	;n=0 (? n=n+m)
;D3:
@@m7:
;//��� 3 - ��������� ��������� ������� qq :
;qq:=(u[j+n]*b+u[j+n-1]) / v[n-1]
;rr:=(u[j+n]*b+u[j+n-1]) MOD v[n-1]
@@m1:	xor	ax,ax
	mov	al,u0[si]
	mul	b
	shl	eax,16
	shrd	eax,edx,16	;��������� ��������� � eax
	xor	edx,edx
	mov	dl,u0[si+1]
	add	eax,edx
	shld	edx,eax,16	;������������ ���� dx:ax ��� �������
	xor	bx,bx
	mov	bl,v	;v->bx
	div	bx
	mov	qq,ax
	mov	rr,dx
@@m2:
;�������� ���������� �����������:
;������ ���� tf
;���_����_1
;���� qq==b OR qq*v[n-2] > b*rr+ u[j+n-1] �� 
;���_����_2
;qq:=qq-1
;rr:=rr+v[n-1]
;���� rr�b �� tf:=FALSE
;���_����_2
;����� tf:=FALSE
;���_����_1
@@m4:	
	mov	ax,qq
	cmp	ax,b	;qq<>b
	je	@@m9	;�� qq=qq-1
;qq*vn-2>b*rr+uj+n-2
	mul	v+1	;qq*vn-2
	mov	temp,ax	;temp=vn-2*qq
	xor	ax,ax
	mov	ax,b
	mul	rr
	xor	dx,dx
	mov	dl,u0[si+2]
	add	ax,dx
	cmp	temp,ax	;qq*vn-2 > b*rr+uj+n-2
	jna	@@m8
@@m9:
	dec	qq
	xor	ax,ax
	mov	al,v
	add	rr,ax
	jmp	@@m4
@@m8:
@@m3:
;D4
;//��� 4 - �������� � �������:
;u[j+n�j]:=u[j+n�j]-qq*v[n-1�0]
	mul_unsign_NM	v,n,qq,1,w
	mov	bx,si
	push	si
	sub_sign_N	u0[bx],w,<n+1>	;v<->w
;���� u[j+n�j]<0 ��	;���������� ���� �����, �������� ����������
;���_����_3
;borrow:=1
;u[j+n�j]:=calc_complement_r(u[j+n�j])
;���_����_3
	jnc	@@m5	;�������, ���� ��� ����� (��������� �������������)
	mov	borrow,1	;���������� ���� �����, �������� ����������
	pop	si
	lea	bx,u0[si]
	mov	cx,n+1
	call calc_complement_r
;D5
;//��� 5 - �������� �������:
;q[j]:=qq
@@m5:	mov	ax,qq
	mov	q[si],al
;���� borrow<>1 ��
	cmp	borrow,1	;��� ���� �� ���� D4 ??
	jne	@@m6
;���_����_4
;//��� 6 - �������������� ��������:
;q[j]:= q[j]-1
;u[j+n�j]:=u[j+n�j]+v[n-1�0]
;���_����_4
;D6 - �������������� ��������
	mov	borrow,0	;������� ���� �����
	dec	q[si]
	mov	bx,si
	push	si
	add_unsign_N	carry,u0[bx],v0,<n+1>	;������� �� �����
;D7
;//��� 7 - ���� �� j:
;j:=j-1
@@m6:	pop	si
	inc	si
;���� j�0 �� �������_�� @@m7
	cmp	si,mm
	jle	@@m7
;D8 - ��������������
;//��� 8 - ��������������:
;//�������� �������:
;r[n-1�0]:=u[n-1�0]/d
	mov	bx,si
	div_sign_N	u0[bx],N,d,r,temp_r
	ret
;//q[m�0] - �������, r[n-1�0] ? �������
;���_����
div_unsign_NM	endp


main:
	mov	dx,@data	
	mov	ds,dx	

	call	div_unsign_NM

	mov	ax,4c00h	
	int	21h	
end	main		