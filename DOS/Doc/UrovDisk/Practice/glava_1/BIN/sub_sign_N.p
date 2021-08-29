;----------------------------------------------------------
;sub_sign_N - ��������� ��������� ����� �������� N ���� � ������ �����
;����: minuend � deduction - ����������� � ����������, N - ����� � ������.
;�����: minuend - �������� ��������.
;----------------------------------------------------------
.data
;�������� � minuend � deduction ����� ������
minuend	db	?	;�����������
len_minuend=$-minuend	;����� � ������ ������������ � �����������
carry	db	0	;���������� �����
deduction	db	?	;����������
.code
sub_sign_N	proc
	mov	cx,len_minuend
	mov	si,0
@@m1:	mov	al,deduction[si]
	sbb	minuend[si],al
	inc	si
	loop	@@m1
;������� ���������:
	jnc	no_carry	;��� �����
;������������ �������� ����� �� �������� ������� - �������� ������ (���� �����)
N=len_minuend+1
	mov	carry,0ffh
	call	calc_abs
	jmp	end_p
no_carry:	jns	no_sign
;������������ �������� ��������� �������������� ���������� - �������� ������ (���� �����)
N=len_minuend
	call	calc_abs
	jmp	end_p
no_sign:
	jno	no_overflow
;������������ �������� ������������ - �������� ������ (���� �����)
;��������� ��������� ������ - �������� ������ (���� �����):
N=len_minuend+1
	mov	carry,0ffh
	call	calc_abs
no_overflow:
end_p:
	ret
sub_sign_N	endp
