;���⨭� 20.2. ��᫥������� ������ �ࠢ����� ������
.586p
masm
model	use16 small
.stack	100h
.data	;ᥣ���� ������
;��室�� ���ᨢ
mas	dd	-2.0, 45.7, -9.4, 7.3, 60.3, -58.44, 890e7, -98746e3
mas_h_0	dd	8 dup (0)	;���ᨢ ���祭�� ����� ���� ࠢ��� 0
i_mas_h_0	dd	0	;⥪�騩 ������ � mas_h_0
mas_l_0	dd	8 dup (0)	;���ᨢ ���祭�� ������ 0
i_mas_l_0	dd	0	;⥪�騩 ������ � mas_l_0
.code
main	proc	;��砫� ��楤��� main
	mov	ax, @data
	mov	ds, ax
	xor	esi, esi
	mov	cx, 8	;���稪 横���
	finit	;�ਢ������ ᮯ����� � ��砫쭮� ���ﭨ�
	fldz	;����㧪� ��� � st(0)
cycl:
	fcom	mas[esi*4]	;�ࠢ����� ��� � st(0) � ��।�� ����⮬ ���ᨢ� mas
	fstsw	ax	;��࠭���� swr � ॣ���� ax
	sahf	;������ swr->ax-> ॣ���� 䫠���
	jp	error	;���室 �� "���宬�" ���࠭�� � ������� fcom
	jc	hi_0	;���室, �᫨ mas[esi*4]>= 0 (mas[esi*4]>=st(0))
;����뫪� ���࠭�� mas[esi*4] ����襣� 0 � ���ᨢ mas_l_0
	mov	eax, mas[esi*4]
	mov	edi, i_mas_l_0
	mov	mas_l_0[edi*4], eax
	inc	i_mas_l_0
	jmp	cycl_bst
hi_0:
;����뫪� ���࠭�� mas[esi*4] ����襣� ��� ࠢ���� 0 � ���ᨢ mas_h_0
	mov	eax, mas[esi*4]
	mov	edi, i_mas_h_0
	mov	mas_h_0[edi*4], eax
	inc	i_mas_h_0
cycl_bst:
	inc	si
	loop	cycl
error:
;����� ����� �뢥�� ᮮ�饭�� �� �訡�� � ������� ���࠭���
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main
