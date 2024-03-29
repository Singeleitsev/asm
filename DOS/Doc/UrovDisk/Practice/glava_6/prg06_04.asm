;----------------------------------------------------------
;prg06_04.asm - ��������� ����� ����� ���������� ����� �� ��������� 0..�.
;����: ���� � ���������� ����� � ���������� ������� ��������� ������ �� 20 ����.
;�����: �������� �����-��������� �������������� � ������� ������ string_bin.
;----------------------------------------------------------
masm
model small
.486
.stack	256
add_unsign_N_1	macro	summand_1, summand_2, N
local	cycl, end_p, end_o
;--------------------------------------------------------------------------------;
;add_unsign_N_1 - �������� ����� summand_1 �������� N ���� � ������������ ������ summand_2 ��� ����� ����� (Intel)
;����: summand_1 � summand_2 - ���������, N - ����� summand_1 � ������.
;�����: summand_1 ��� carry+summand_1 - �������� �����, � ����������� �� ������� ������������.
;--------------------------------------------------------------------------------;
push	cx
push	si
push	ax
	mov	cx,N
	xor	si,si
	mov	al,summand_2
	adc	summand_1[si],al
	dec	cx
	jcxz	end_o	;���� ����� summand_1 ����� 1, �� �� �������� �� ������������ � �����
	xor	al,al
cycl:	inc	si
	adc	summand_1[si],al	;��� ��������� ����� ���������� � �����
	loop	cycl
end_o:	jnc	end_p	;�������� �� ������������
	adc	carry,0
end_p:
pop	ax
pop	si
pop	cx
	endm
mul_unsign_NM	macro	u,i,v,j,w
local	m2,m4,m6
;--------------------------------------------------------------------------------;
;mul_unsign_NM macro	u,i,v,j,w - ������������ ��������� N-�������� ����� �� ����� �������� M ����
;(������� - ������� ���� �� �������� ������ (Intel))
;����: U - ����� ������� ���������; i - ����� U; V - ����� ������� ���������; j - ����� V; W - ����� ������� ������������ i+j ����, ���� ���������� ��������� ������������; b=256 - ����������� ��������� �����.
;�����: W - ������������ ������������ i+j ����.
;--------------------------------------------------------------------------------;
	push	si
	push	cx
;������� w
	push	ds
	pop	es
	xor	al,al
	lea	di,w
	mov	cx,i+j
rep	stosb
	xor	bx,bx	;j=0..m-1
	mov	cx,j
m2:
	push	cx	;��������� �����
	cmp	v[bx],0
	je	m6
	xor	si,si	;i=0..n-1
	mov	cx,i
	mov	k,0
m4:
	mov	al,u[si]
	mul	byte ptr v[bx]
	xor	dx,dx
	mov	dl,w[bx+si]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - ��������� ����������
	push	dx
	xor	dx,dx
	div	b	;t mod b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si],ah
	inc	si
	loop	m4
	mov	al,k
	mov	w[bx+si],al
m6:
	inc	bx
	pop	cx
	loop	m2
	pop	cx
	pop	si
	endm
.data
string	db	22 dup (0)	;������������ ����� ������� �� 20 ���� (22 - � ������ 0d0ah)
len_string=$-string
ten	dd	10
string_bin	db	10 dup (0)	;������������ ����� ��������� ����� - 10 ����
len_string_bin=$-string_bin
carry	db	0	;������� �������� ��������� ����
adr_string_bin	dd	string_bin
string_bin_w	db	len_string_bin+1 dup (0)	;��������� ��������� ��� ������� mul_unsign_NM = len_string_bin+1 ����
len_string_bin_w =$-string_bin_w
adr_string_bin_w	dd	string_bin_w
k	db	0	;������� 0 � k < 255
b	dw	100h	;������ ��������� �����
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
	xor	edx,edx
;---------������ ���������� ����� � ����������---------------------------------------------
	mov	bx,0	;����������� ���������� - ����������
	mov	cx,len_string
	lea	dx,string	;��������� ��������� �� ������ string
	mov	ah,3fh	;����� ������� DOS
	int	21h
	jc	exit	;������� � ������ ������
;� �������� AL - ���������� ������������� ��������� ���������� ����
	mov	ecx,eax
	sub	ecx,2	; ������������ ������� ����� (����� �� ��������� 0d0ah, �������� 3fh)
	jcxz	$+4	;����� �� ���� �������
	jmp	$+5	
	jmp	exit
cont_1:	dec	ecx	;�� �������� �� 10 ��������� ����� �����
	jcxz	$+4	;����������� �����
	jmp	$+5
	jmp	m2
	lea	si,string	;��������� ��������� �� ������ string
	xor	eax,eax	;eax:=0
m1:
	xor	edx,edx
	mov	dl,[si]
	and	dl,0fh	;����������� ASCII->BCD
add_unsign_N_1	string_bin,dl, len_string_bin
;�������� �� 10
	mul_unsign_NM	string_bin, len_string_bin,ten,1, string_bin_w
;--------�������� string_bin_w � string_bin----------------------------------
	cld
push	si
push	cx
	lds	si,adr_string_bin_w
	les	di,adr_string_bin
	mov	cx,len_string_bin_w
rep	movsb
pop	cx
pop	si
;----------------------------------------------------------------------------
	inc	si
	dec	cx
	jcxz	m2
	jmp	m1
m2:
	mov	dl,[si]
	and	dl,0fh
add_unsign_N_1	string_bin,dl, len_string_bin
;��������� �������������� - � ������ string_bin
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
