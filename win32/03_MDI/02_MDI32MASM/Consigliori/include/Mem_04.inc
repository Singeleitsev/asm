;--------------------------------------------------------------------------------------
;������, ����������� �������� �� ����� ���������� � ������ � ������ ���������� � ������
;�������: ��� �������� ������ ���� 64-�������, ������� rax �����������
;����: ��� ����������-��������, ��� ����������-���������
;--------------------------------------------------------------------------------------
m64m64 MACRO var1,var2
	mov rax,var2
	mov var1,rax
ENDM ;m64m64

;--------------------------------------------------------------------------------------
;������, ����������� �������� �� ����� ���������� � ������ � ������ ���������� � ������
;�������: ��� �������� ������ ���� 32-�������, ������� eax �����������
;����: ��� ����������-��������, ��� ����������-���������
;--------------------------------------------------------------------------------------
m32m32 MACRO var1,var2
	mov eax,var2
	mov var1,eax
ENDM ;m32m32

;--------------------------------------------------------------------------------------
;������, ����������� ����� ����� ���������� � ������ � ������ ���������� � ������
;�������: ������ ����������-�������� ������ ���� 64-������, ������� rax �����������
;����: ��� ����������-��������, ��� ����������-���������
;--------------------------------------------------------------------------------------
m64addr MACRO var1,var2
	lea rax,var2
	mov var1,rax
ENDM ;m64addr

;--------------------------------------------------------------------------------------
;������, ����������� ����� ����� ���������� � ������ � ������ ���������� � ������
;�������: ������ ����������-�������� ������ ���� 32-������, ������� eax �����������
;����: ��� ����������-��������, ��� ����������-���������
;--------------------------------------------------------------------------------------
m32addr MACRO var1,var2
	lea eax,var2
	mov var1,eax
ENDM ;m32addr