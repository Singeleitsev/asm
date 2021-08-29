Init	macro	mem1,mem2,len
;����� ��� ���樠����樨 ������ ॣ���஢
	mov	di,offset mem1
	mov	si,offset mem2
	mov	cx,len
	endm
AddBIN	macro	mem1,mem2,len
;᫮����� BIN-�ᥫ
;१���� ����頥��� � ���� ���࠭�
	Init	mem1,mem2,len
	call	AddBINp
	endm
SubBIN	macro	mem1,mem2,len
;���⠭�� BIN-�ᥫ
;१���� ����頥��� � ���� ���࠭�
	Init	mem1,mem2,len
	call	SubBINp
	endm
MulBIN	macro	mem1,mem2,len
;㬭������ BIN-�ᥫ
;१����:
;������ ���� ����頥��� � ���� ���࠭�,
;����� ���� - �� ��ன ���࠭�
	Init	mem1,mem2,len
	call	MulBINp
	endm
DivBIN	macro	mem1,mem2,len
;������� BIN-�ᥫ
;१����:
;��⭮� ����頥��� � ���� ���࠭�,
;���⮪ - �� ��ன ���࠭�
	mov	di,len-1+offset mem1
	mov	si,len-1+offset mem2
	mov	cx,len
	call	DivBINp
	endm
OutBIN	macro	mem,len
;�뢮� BIN-�ᥫ �� �࠭ � ⥪���� ������
	mov	si,len-1+offset mem
	mov	cx,len
	call	OutBINp
	endm

data	segment
;��� ����権 㬭������ � ������� ����室�� ����
;ࠧ��� ���� �� ����� 3*SIZE,
;��� SIZE - ࠧ��� �ᥫ
buffer	db	512 dup(?)
bufsize = $-buffer-1
a	dd	315
b	dd	12
c	dd	24
data	ends
stk	segment	stack 'stack'
	db	100h dup ('?')
stk	ends
code	segment
assume	cs:CODE,ds:DATA,es:DATA
AddBINp proc
;��楤�� ᫮����� bin-�ᥫ
	push	ax	;��࠭�� �����塞� ॣ�����
	push	di
	push	si
	push	cx
	cld		;��稭��� � ������ ࠧ�冷�
	clc	;���㫨� ���祭�� 䫠�� ��७��
_add_:
	lodsb		;���쬥� ��।��� ����
	adc	al,[di]	;᫮����� � ��⮬ ��७��
	stosb		;��࠭�� १����
	loop	_add_
	pop	cx	;����⠭���� ॣ�����
	pop	si
	pop	di
	pop	ax
	ret
	endp
SubBINp proc
;��楤�� ���⠭�� BIN-�ᥫ
	push	ax	;��࠭�� �����塞� ॣ�����
	push	di
	push	si
	push	cx
	cld		;��稭��� � ������ ࠧ�冷�
	clc		;���㫨� ���祭�� ��७��
_sub_:
	lodsb		;���쬥� ��।��� ����
	sbb	[di],al	;���⠭�� � ��⮬ ��७��
	mov	al,[di]
	stosb		;��࠭�� १����
	loop	_sub_
	pop	cx	;����⠭���� ॣ�����
	pop	si
	pop	di
	pop	ax
	ret
	endp
MulBINp	proc
;��楤�� 㬭������ BIN-�ᥫ
	push	ax	;��࠭�� �����塞� ॣ�����
	push	bx
	push	di
	push	si
	push	cx
	cld		;��稭��� � ������ ࠧ�冷�
	mov	bx,offset buffer
	mov	dh,cl	;�������� ��室��� ���ﭨ� ���稪�
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
	add	al,dl	;��⥬ ��७��
	adc	ah,0
	add	al,[bx]	;᫮��� � १���⮬
			;�।��饣� 㬭������
	adc	ah,0
	mov	dl,ah	;�������� ���祭�� ��७��
	xor	ah,ah
	mov	[bx],al	;��࠭�� १����
	inc	bx
	loop	_mul_i_
	mov	[bx],dl
	pop	si	;����⠭���� ॣ�����
	pop	bx
	inc	bx
	inc	di	;��३��� � ᫥���饩 ���
			;��ண� ���࠭��
	pop	cx
	loop	_mul_o_
	mov	cl,dh	;����⠭���� ��室���
			;���祭�� ���稪�
	sub	bx,cx	;ᬥ�⨬ bx �� �������
			;���� १����
	sub	di,cx
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
SubInvBINp	proc
;�ᯮ����⥫쭠� ��楤�� ��� ����樨 �������
;�ந������ �맮� ��楤��� ���⠭��
;��� ��砫쭮� ���樠����樨
	push	si
	push	di
	sub	si,cx
	inc	si
	sub	di,cx
	inc	di
	call	SubBINp
	pop	di
	pop	si
	ret
	endp
CmpBINp	proc
;��楤�� �ࠢ����� BIN-�ᥫ
;CF=0, �᫨ [si]>[di], ���� CF=1
	push	ax
	push	di
	push	si
	push	cx
	std
_cmp_:
	lodsb
	cmp	al,[di]
	jb	_less_
	ja	_greater_
	dec	di
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
;��楤�� ���樠����樨 ���� ��� ����樨 �������
	std
;0,[di] -> buffer (���� ���࠭� � ����)
	push	di
	push	si
	push	di
	pop	si
	mov	di,bufsize+offset buffer
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
	inc	si
	inc	cx
	mov	dx,cx
	rep movsb
	pop	cx
	push	cx
;0,0..0 -> buffer - ���⨬ ���� ��� १����
	xor	al,al
	rep	stosb
;��७����祭�� ॣ���஢
	mov	di,bufsize+offset buffer
	pop	cx
	mov	si,di
	inc	cx
	sub	si,cx
	pop	bx
	ret
	endp
DivBINp	proc
;��楤�� ������� BIN-�ᥫ
	push	ax	;��࠭�� �����塞� ॣ�����
	push	bx
	push	di
	push	si
	push	cx
	push	di
	call	PrepareForDiv	;�����⮢�� ����
	xor	ax,ax	;� al - ��।��� ��� १����
;� ah - ������⢮ ��� � १����
	call	CmpBINp
	jnc	_next_1_
_div_:
	call	CmpBINp
	jnc	_next_
	inc	al
	call	SubInvBINp
	jmp	_div_
_next_:
	mov	[bx],al	;��࠭�� ��।��� ����
	dec	bx	;㬥��訬 ���冷� ��������
_next_1_:
	dec	di
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
	sub	di,cx
	push	cx
	mov	cl,ah
	sub	si,cx
	inc	si
	inc	di
	cld
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
	mov	si,bufsize+offset buffer
	dec	si
	std
	rep	movsb
	pop	cx	;����⠭���� ॣ�����
	pop	si
	pop	di
	pop	bx
	pop	ax
	ret
	endp
OutBINp	proc
;��楤�� �뢮�� BIN-�ᥫ �� �࠭
	push	ax
	push	bx
	push	cx
	push	dx
	push	si
	mov	ah,06h
	std
_out_:
	lodsb
	mov	bl,al
	mov	dl,bl
	shr	dl,4
	or	dl,30h
	cmp	dl,39h
	jle	_digit_1_
	add	dl,7
_digit_1_:
	int	21h
	mov	dl,bl
	and	dl,0fh
	or	dl,30h
	cmp	dl,39h
	jle	_digit_2_
	add	dl,7
_digit_2_:
	int	21h
	loop	_out_
	mov	dl,0dh
	int	21h
	mov	dl,0ah
	int	21h
	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	ret
	endp
main	proc
;�஢�ਬ ��� ࠡ�⠥� �����
	mov	ax,DATA
	mov	ds,ax
	mov	es,ax
	OutBIN	a,4
	OutBIN	b,4
	AddBIN	a,b,4
	OutBIN	a,4
	OutBIN	b,4
	SubBIN	a,b,4
	OutBIN	a,4
	OutBIN	b,4
	MulBIN	a,b,4
	OutBIN	a,4
	OutBIN	b,4
	OutBIN	c,4
	DivBIN	a,c,4
	OutBIN	a,4
	OutBIN	c,4
	mov	ax,4c00h
	int	21h
main	endp
code	ends
	end	main

