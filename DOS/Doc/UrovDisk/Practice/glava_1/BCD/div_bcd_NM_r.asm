;----------------------------------------------------------
;div_bcd_NM_r.asm - ������� ������������� BCD-����� u � v �������� n+m � n ����.
;����: u=u1u2u3�um+n - �������; v=v1v2�vn - ��������, b=256 - ��������� ������� ���������.
;�����: q=q1q2�qm - �������, r=r1r2�rn - �������.
;������� ���������� ���� - ������� ���� �� �������� ������ (�� Intel) (!).
;----------------------------------------------------------
masm
model small,c
.data
;�������� � u � v ����� ������
u0	db	0	;�������������� ���� ��� ������������
u	db	1,0,3,5,9,4,6	;�������
m=$-u	;����� � ������ �������� u
v0	db	0	;��� �������� 0v1v2..vn
v	db	5,9,1	;��������
n=$-v	;����� � ������ �������� v
mm=m-n
w	db	m+1 dup (0)	;��� ������������� ����������
q	db	mm dup (0)	;�������
qq	db	0
r	db	n dup (0)	;�������
b	dw	10	;��������� ������� ���������
d	db	0
temp	dw	0
temp_r	db	n dup (0)
borrow	db	0	;���� ����� �� ���� D4
k	db	0	;������� 0 =< k < 255
carry	db	0
.stack	256
.486
.code
;�������� �������� ����������� calc_complement_r, mul_bcd_r, sub_bcd_r, add_bcd_r, div_bcd_1_r
;� � �
div_bcd_NM_r	proc
;D1 ? ������������
	xor	ax,ax
	mov	dl,v
	inc	dl	;v1+1
	mov	ax,b
	div	dl
	mov	d,al	;d=b/(v1+1)
mul_bcd_r	u,m,d,1,w
	cld
	push	ds
	pop	es
	lea	si,w
	lea	di,u0
	mov	cx,m+1
rep	movsb

mul_bcd_r	v,n,d,1,w
	cld
	push	ds
	pop	es
	lea	si,w+1
	lea	di,v
	mov	cx,n
rep	movsb
;D2:
	mov	si,0	;n=0
;D3:
@@m7:	mov	al,u0[si]
	cmp	v,al
	jne	@@m1
	mov	qq,9	;qq=b-1
	jmp	@@m2
@@m1:	xor	ax,ax
	mov	al,u0[si]
	mul	b
	xor	dx,dx
	mov	dl,u0[si+1]
	add	ax,dx
	mov	bl,v	;v->bx
div	bl
	mov	qq,al
@@m2:
;�������� ���������� �����������:
@@m4:	mul	v+1
	mov	temp,ax	;temp=v2*qq
	xor	ax,ax
	mov	al,u0[si]
	mul	b
	xor	edx,edx
	mov	dl,u0[si+1]
add	dx,ax
	mov	al,qq
	mul	v	;eax=qq*v1
sub	dx,ax
xchg	dx,ax
	mul	b
	xor	bx,bx
	mov	bl,u0[si+2]
	add	ax,bx
	cmp	temp,ax
	jna	@@m3
	dec	qq
	mov	al,qq
	jmp	@@m4
@@m3:
;D4
	mul_bcd_r	v,n,qq,1,w
	mov	bx,si
	push	si
	sub_bcd_r	u0[bx],<n+1>,w,<n+1>,u0[bx]	;v<->w
	jnc	@@m5	;�������, ���� ��� ����� (��������� �������������)
	mov	borrow,1	;���������� ���� �����, �������� ����������
	pop	si
;D5
@@m5:	mov	al,qq
	mov	q[si],al
	cmp	borrow,1	;��� ���� �� ���� D4 ??
	jne	@@m6
;D6 ? �������������� ��������
	mov	borrow,0	;������� ���� �����
	dec	q[si]
	mov	bx,si
	push	si
	add_bcd_r	u0[bx],<n+1>,v0,<n+1>,u0	;������� �� �����
;D7
@@m6:	pop	si
	inc	si
	cmp	si,mm
	jle	@@m7
;D8 ? ��������������
	mov	bx,si
	div_bcd_1_r	u0[bx],N,d,r,temp_r
	ret
div_bcd_NM_r	endp
main:
	mov	dx,@data	
	mov	ds,dx	
	call	div_bcd_NM_r
	mov	ax,4c00h	
	int	21h	
end	main		
