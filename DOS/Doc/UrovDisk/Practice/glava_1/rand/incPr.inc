rCMOS	macro
;����� ������ �������� CMOS
;�� �����: al - ����� ������, �������� ������� ������
;�� ����� ������: al - ���������� ��������
	out	70h,al
	xor	ax,ax
	in	al,71h	;������ � ������� al �� ����� �������� ������ cmos
	endm
wCMOS	macro	svalue:REQ
;����� ����� �������� � ������ CMOS
;svalue - ������������ �������� � ���� 16-� ���������
;al - ����� ������, � ������� ������������ ������
	out	70h,al
	mov	al,svalue
	out	71h,al
	endm
DalBax	macro
;����� �������������� ������������ BCD �� al � ���������� � ax
;al - ����������� BCD
;ax - ��� ������� (��� � ������������ ����)
	rol	al,4
	mov	ah,al
	shr	ah,4
	and	ax,0f0fh
	or	ax,3030h
	endm