���⨭� 20.4. ��᫥������� ����⢥���� ��䬥��᪨� ������
.586p
masm
model	use16 small
.stack	100h
.data	;ᥣ���� ������
;��室�� ���ᨢ
i	equ	10
y	dq	0
.code	
main	proc
	mov	ax, @data
	mov	ds, ax
	finit	;�ਢ������ ᮯ����� � ��砫쭮� ���ﭨ�
	fld1	;st(0)=1!
	fld1	;st(0)=i=1, st(1)=1!
	fst	y
	mov	cx, i-1	;���� ����� 㦥 ���᫨��
cycl:
	fld1
	faddp
	fmul	st(1), st(0)	;st(0)=i=2, 3.., st(1)=i!
	fld1	
	fdiv	st(0), st(2)	;1/i!
	fadd	y	;���������� �㬬�
	fstp	y	;��࠭���� �㬬�
	loop	cycl
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main

