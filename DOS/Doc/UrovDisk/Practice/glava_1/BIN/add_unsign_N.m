.data
;summand_1	db	?	;������ ���������
;N=$-summand_1		;����� � ������ �������� summand_1 � summand_2
;carry	db	0	;������� �������� ��������� ����
;summand_2	db	?	;������ ���������
.code
;������� ���� �� �������� ������
add_unsign_N	macro	carry,summand_1,summand_2,N
local	cycl,end_p
;----------------------------------------------------------
;add_unsign_N carry,summand_1,summand_2,N ? ������������ �������� ��� ����� ����� ����� �������� N ����
;����: summand_1 � summand_2 - ���������, N - ����� � ������.
;������� ���������� ���� - ������� ���� �� �������� ������ (�� Intel).
;�����: summand_1 ��� carry+summand_1 - �������� �����, � ����������� �� ������� ������������.
;----------------------------------------------------------
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
