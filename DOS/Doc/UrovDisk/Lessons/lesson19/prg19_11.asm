;���⨭� 20.11. ���������� �᫠ � �ந������� �⥯���
.586p
masm
model	use16 small
.stack	100h
.data	;ᥣ���� ������
flag	db	0
p1	dd	0
y	dt	2.0	;�᭮����� �⥯���
x	dt	-2.0	;������⥫� �⥯���
.code
main	proc	;��砫� ��楤��� main
	mov	ax, @data
	mov	ds, ax
	finit
	fld	y
	fld	x
	ftst
	fstsw	ax
	sahf
	jnc	m1	;���室 �᫨ x >=0
	inc	flag	;������� flag, �᫨ x<0
	fabs		;|x|
m1:	fxch
	fyl2x
	fst	st(1)
	fabs		;|z|
;�ࠢ��� |z| c �����楩:
	fld1
	fcom
	fstsw	ax
	sahf
	jp	exit	;���࠭�� �� �ࠢ����
	jnc	m2	;�᫨ |z|<1, � ���室 �� m2
	jz	m3	;�᫨ |z|=1, � ���室 �� m3
;�᫨ |z|>1, � �ਢ���� � ��㫥 z=z1+z2, ��� z1-楫��, z2-�஡��� � z2<1:
	xor	ecx, ecx	;���稪 ���⠭��
m12:	inc	cx
	fsub	st(1), st(0)	
	fcom
	fstsw	ax
	sahf	
	jp	exit	;���࠭�� �� �ࠢ����
	jz	m12
	jnc	m2	;�᫨ |z|<1, � ���室 �� m2
	jmp	m12	;�᫨ |z|>1, � ���室 �� m12
m3:	mov	p1, 1
	jmp	$+7
m2:	mov	p1, ecx
	fxch
	f2xm1
	fadd		;��������㥬 1
	fild	p1	;������⥫� �⥯��� ��� fscale
	fld1
	fscale
	fxch
	fincstp
	fmul
;�஢�ઠ �� ����⥫��� �⥯���
	cmp	flag, 1
	jnz	exit
	fld1
	fxch
	fdiv
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main

