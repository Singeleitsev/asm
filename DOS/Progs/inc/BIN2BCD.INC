;********************************
;����� �८�ࠧ������ 楫��� ������������ ����筮�� �᫠
;������ �� 2^16 ���� � ��㯠�������� BCD-�।�⠢�����
;********************************
;����: ��� ��६�����, ᮤ�ঠ饩 ��室��� ����筮� �᫮,
;����� �⮩ ��६����� � ����� (!),
;��� ��६�����, � ������ �㤥� ����饭� BCD-�।�⠢�����
;����� ��६�����-�⢥� (var_len = (楫�� (1,2 * num_len)) + 1
;�����: ���祭�� ��६�����-�⢥� - ��㯠�������� BCD-�᫮
;********************************
Bin2BCD MACRO num, num_len, var, var_len
LOCAL DNum, DDigit, CmpNum0, Over
	push	ax
	push	bx
	push	di
	push	si
;����� �������⭮�� ������� ���� ������ �� ᢥ����� ��� � ���
	xor	di, di		;byte counter in 'var'
DNum:				;Divide 'num' by 10
;����� ������������ ������� 楫��� ��⭠����筮��
;�᫠ �� ��१�� [0, 2^(2^16)) �� 10
;����஥� �� �ਭ樯� ������� "�⮫�����"
	xor	si, si		;byte counter in 'num'
	xor	ax, ax
	mov	bx, 0Ah
DDigit:				;Divide digit of 'num' by 10
	mov	al, num[si]	;ax:0001; ax:019C; ax:02EE; ax:00E0
	div	bl		;ax:0100; ax:0229; ax:004B; ax:0416
	mov	num[si], al	;|00|; |29|; |4B|; |16|
	inc	si
	cmp	si, num_len
	jl	DDigit
;	cmp	di, var_len	;Check for free space
;	jge	Over		;If not enough then stop computing
	mov	var[di], ah	;first digit of result's gotten
	inc	di
;�ࠢ������ 'num' � �㫥�, �᫨ 'num' = 0,
;� ����� �����蠥� ࠡ���
	xor	bx, bx
CmpNum0:
	cmp	bx, num_len
	je	Over
        cmp     num[bx], 0      ;�᫨ �஢�७��� ��� ����� 0,
        jne	DNum            ;� ����� �஢����� �� �㦭�
	inc	bx
        jmp     CmpNum0         ;�᫨ ࠢ�� ���, ���� �����
Over:
	pop	si
	pop	di
	pop	bx
	pop	ax
	ENDM
;********************************