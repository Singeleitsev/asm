sub_sign_N	macro	minuend,deduction,N
local	cycl,m1
;----------------------------------------------------------
;sub_sign_N minuend,deduction,N - ������������ ��������� c ������ ����� ����� �������� N ����
;����: minuend � deduction - ����������� � ����������, N - ����� � ������.
;������� ���������� ���� - ������� ���� �� �������� ������ (�� Intel).
;�����: minuend - �������� ��������.
;----------------------------------------------------------
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
