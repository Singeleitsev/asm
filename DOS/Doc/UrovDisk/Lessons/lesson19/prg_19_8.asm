;���⨭� 20.8. ���᫥��� ��ࠦ���� z=(sqrt(|x|)-y)2
.586p
masm
model	use16 small
.stack	100h
.data	;ᥣ���� ������
;��室�� �����:
x	dd	-29e-4
y	dq	4.6
z	dd	0
.code
main	proc
	mov	ax,@data
	mov	ds,ax
	finit	;�ਢ������ ᮯ����� � ��砫쭮� ���ﭨ�
	fld	x	;st(0)=x
	fabs	;st(0)=|x|
	fsqrt
	fsub	y	;st(0)=sqrt|x|-y
;��७� �ਤ���� ������� �१ 㬭������
	fst	st(1)
	fmul
	fst	z
exit:
	mov	ax,4c00h
	int	21h
main	endp
end	main

