Init	macro	mem1,mem2,len
;����� ��� ���樠����樨 ������ ॣ���஢
	mov	di,len-1+offset mem1
	mov	si,len-1+offset mem2
	mov	cx,len
	endm
AddBCD	macro	mem1,mem2,len
;᫮����� BCD-�ᥫ
;१���� ����頥��� � ���� ���࠭�
	Init	mem1,mem2,len
	call	AddBCDp
	endm
SubBCD	MACRO	mem1,mem2,len
;���⠭�� BCD-�ᥫ
;१���� ����頥��� � ���� ���࠭�
	Init	mem1,mem2,len
	call	SubBCDp
	endm
MulBCD	macro	mem1,mem2,len
;㬭������ BCD-�ᥫ
;१����:
;������ ���� ����頥��� � ���� ���࠭�,
;����� ���� - �� ��ன ���࠭�
	Init	mem1,mem2,len
	call	MulBCDp
	endm
DivBCD	macro	mem1,mem2,len
;������� BCD-�ᥫ
;१����:
;��⭮� ����頥��� � ���� ���࠭�,
;���⮪ - �� ��ன ���࠭�
	mov	di,offset mem1
	mov	si,offset mem2
	mov	cx,len
	call	DivBCDp
	endm
OutBCD	macro	mem,len
;�뢮� BCD-�ᥫ �� �࠭ � ⥪���� ������
	mov	si,offset mem
	mov	cx,len
	call	OutBCDp
	endm

data	segment
;��� ����権 㬭������ � ������� ����室�� ����
;ࠧ��� ���� �� ����� 3*SIZE,
;��� SIZE-ࠧ��� �ᥫ
buffer	db	512 dup(?)
a	db	0,0,4,0,1,4,5,2,2,2
b	db	0,0,0,0,0,3,8,9,7,8
c	db	2,8,0,1,0,0,1,9,8,3
d	db	9,9,3,3,3,3,3,3,3,3
data	ends

code	segment
assume	cs:code,ds:data,es:data
AddBCDp	proc
;��楤�� ᫮����� BCD-�ᥫ
	push	ax	;��࠭�� �����塞� ॣ�����
	push	di
	push	si
	push	cx
	std		;��稭��� � ������ ࠧ�冷�
	clc		;���㫨� ���祭�� ��७��
_add_:
	lodsb		;���쬥� ��।��� ����
	adc	al,[di]	;᫮����� � ��⮬ ��७��
	aaa		;��஢�塞 � �ଠ� BCD-�ᥫ
	stosb		;��࠭�� १����
	loop	_add_
	pop	cx	;����⠭���� ॣ�����
	pop	si
	pop	di
	pop	ax
	ret
	endp
SubBCDp	proc
;��楤�� ���⠭�� BCD-�ᥫ
	push	ax	;��࠭�� �����塞� ॣ�����
	push	di
	push	si
	push	cx
	std		;��稭��� � ������ ࠧ�冷�
	clc		;���㫨� ���祭�� ��७��
_sub_:
	lodsb		;���쬥� ��।��� ����
	sbb	[di],al	;���⠭�� � ��⮬ ��७��
	mov	al,[di]
	aas		;��஢�塞 � �ଠ� BCD-�ᥫ
	stosb		;��࠭�� १����
	loop	_sub_
	pop	cx	;����⠭���� ॣ�����
	pop	si
	pop	di
	pop	ax
	ret
	endp
MulBCDp	proc
;��楤�� 㬭������ BCD-�ᥫ
	push	ax	;��࠭�� �����塞� ॣ�����
	push	bx
	push	di
	push	si
	push	cx
	std		;��稭��� � ������ ࠧ�冷�
	mov	bx,offset buffer
	mov	dh,cl	;�������� ��室���
			;���ﭨ� ���稪�
	push	bx
;�������� ���� १���� ��ﬨ
	shl	cx,1	;����室�� ࠧ��� 2*SIZE
	xor	al,al	;ᨬ���-�������⥫� = 0
_null_:
	mov	[bx],al
	inc	bx
	loop	_null_
	mov	cl,dh
	pop	bx
;㬭������ �㤥� �஢����� "�⮫�����"
;横� �� �ᥬ ��ࠬ ��ࢮ�� ���࠭��
_mul_o_:
	xor	dl,dl	;���㫨� ���祭�� ��७��
	push	cx
	push	bx	;��࠭�� ������� ॣ�����
	push	si
	mov	cl,dh	;����⠭���� ��室���
			;���祭�� ���稪�
;横� �� �ᥬ ��ࠬ ��ண� ���࠭��
_mul_i_:
	lodsb		;���쬥� ��।��� ����
	mul	byte ptr [di]	;㬭����
	aam		;���४�� १����
	add	al,dl	;��⥬ ��७��
	aaa
	add	al,[bx]	;᫮��� � १���⮬
			;�।��饣� 㬭������
	aaa
	mov	dl,ah	;�������� ���祭�� ��७��
	xor	ah,ah
	mov	[bx],al	;��࠭�� १����
	inc	bx
	loop	_mul_i_
	mov	[bx],dl
	pop	si	;����⠭���� ॣ�����
	pop	bx
	inc	bx
	dec	di	;��३��� � ᫥���饩
			;��� ��ண� ���࠭��
	pop	cx
	loop	_mul_o_
	mov	cl,dh	;����⠭���� ��室���
			;���祭�� ���稪�
	sub	bx,cx	;ᬥ�⨬ bx �� �������
			;���� १����
	add	di,cx
;����ᥬ १���� (��. ����) � ���� ���࠭�
_move_l_:
	mov	al,[bx]
	inc	bx
	stosb
	loop	_move_l_
	mov	cl,dh
	mov	di,si
;����ᥬ १���� (��. ����) �� ��ன ���࠭�
_move_h_:
	mov	al,[bx]
	inc	bx
	stosb
	loop	_move_h_
	pop	cx	;����⠭���� ॣ�����
	pop	si
	pop	di
	pop	bx
	pop	ax
	ret
	endp
SubInvBCDp	proc
;�ᯮ����⥫쭠� ��楤�� ��� ����樨 �������
;�ந������ �맮� ��楤��� ���⠭��
;��� ��砫쭮� ���樠����樨
	push	si
	push	di
	add	si,cx
	dec	si
	add	di,cx
	dec	di
	call	SubBCDp
	pop	di
	pop	si
	ret
	ENDP
CmpBCDp	proc
;��楤�� �ࠢ����� BCD-�ᥫ
;CF=0, �᫨ [si]>[di], ���� CF=1
	push	ax
	push	di
	push	si
	push	cx
	cld
_cmp_:
	lodsb
	cmp	al,[di]
	jl	_less_
	jg	_greater_
	inc	di
	loop	_cmp_
_less_:
	stc
	jc	_cmp_q_
_greater_:
	clc
_cmp_q_:
	pop	cx
	pop	si
	pop	di
	pop	ax
	ret
	endp
PrepareForDiv	proc
;��楤�� ���樠����樨 ����
;��� ����樨 �������
	cld
;0,[di] -> buffer (���� ���࠭� � ����)
	push	di
	push	si
	push	di
	pop	si
	mov	di,offset buffer
	xor	al,al
	push	cx
	stosb
	rep	movsb
;0,[si] -> buffer (��ன ���࠭� � ����)
	pop	cx
	stosb
	pop	si
	push	cx
;��� ��砫� ������ ����� ������� ����
_find_:
	lodsb
	dec	cx
	cmp	al,0
	je	_find_
	dec	si
	inc	cx
	mov	dx,cx
	rep movsb
	pop	cx
	push	cx
; 0,0..0 -> buffer (������ ���� ��� १���� � ����)
	xor	al,al
	rep	stosb
;��७����祭�� ॣ���஢
	mov	di,offset buffer
	pop	cx
	mov	si,di
	inc	cx
	add	si,cx
	pop	bx
	ret
	endp
DivBCDp	proc
;��楤�� ������� BCD-�ᥫ
	push	ax	;��࠭�� �����塞� ॣ�����
	push	bx
	push	di
	push	si
	push	cx
	push	di
	call	PrepareForDiv	;�����⮢�� ����
	xor	ax,ax	;� al - ��।��� ��� १����
			;� ah - ������⢮ ��� � १����
	call	CmpBCDp
	jnc	_next_1_
_div_:
	call	CmpBCDp
	jnc	_next_
	inc	al
	call	SubInvBCDp
	jmp	_div_
_next_:
	mov	[bx],al	;��࠭�� ��।��� ����
	inc	bx	;㬥��訬 ���冷� ��������
_next_1_:
	inc	di
	dec	cx
	xor	al,al
	inc	ah
	cmp	cx,dx	;�ࠢ��� ���浪� �������� � ����⥫�
	jne	_div_
	dec	ah
	pop	di
	pop	cx
	push	cx
;����뫠�� १���� �� ���� � ���࠭��
	mov	si,di
	add	di,cx
	push	cx
	mov	cl,ah
	add	si,cx
	dec	si
	dec	di
	std
rep	movsb
	pop	cx
	sub	cl,ah
	xor	al,al
rep	stosb
	pop	cx
	pop	si
	push	si
	push	cx
	mov	di,si
	mov	si,offset buffer
	inc	si
	cld
rep	movsb
	pop	cx	;����⠭���� ॣ�����
	pop	si
	pop	di
	pop	bx
	pop	ax
	ret
	endp
OutBCDp	proc
;��楤�� �뢮�� BCD-�ᥫ �� �࠭
	mov	ah,06h
	cld
_out_:
	lodsb
	or	al,30h
	mov	dl,al
	int	21h
	loop	_out_
	mov	dl,0dh
	int	21h
	mov	dl,0ah
	int	21h
	ret
	endp

main	proc
	mov	ax,data
	mov	ds,ax
	mov	es,ax
	OutBCD	a,10
	OutBCD	b,10
	AddBCD	a,b,10
	OutBCD	a,10
	OutBCD	b,10
	SubBCD	a,b,10
	OutBCD	a,10
	OutBCD	b,10
	MulBCD	a,b,10
	OutBCD	a,10
	OutBCD	b,10
	DivBCD	a,b,10
	OutBCD	a,10
	OutBCD	b,10
	mov	ax,4c00h
	int	21h
main	endp
code	ends
	end	main


