;----------------------------------------------------------
;add_unsign_N - ��������� �������� ����� �������� N ���� ��� ����� �����
;����: summand_1 � summand_2 - ���������, N - ����� � ������.
;�����: summand_1 ��� carry+summand_1 - �������� �����, � ����������� �� ������� ������������.
;----------------------------------------------------------
.data
summand_1	db	?	;������ ���������
N=$-summand_1	;����� � ������ �������� summand_1 � summand_2
carry	db	0	;������� �������� ��������� ����
summand_2	db	?	;������ ���������
.code
add_unsign_N	proc
	mov	cl,N
	xor	si,si
cycl:	mov	al,summand_2[si]
	adc	summand_1[si],al
	inc	si
	loop	cycl
	jnc	end_p			;�������� �� ������������
	adc	carry,0
end_p:	ret
add_unsign_N	endp