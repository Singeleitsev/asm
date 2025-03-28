;-----------------------------------------------------------------------------
;������ ������ MessageBox c ASCII-�������������� 
;16-������� �������� 64-������� �������� RAX
;����1: RAX = �������� ��������
;����2: ��� ����������� ����������� ���� (���� 0)
;����3: ��� ���������� szCaption ��� �������� MessageBox'�
;����4: ��� ���������� ������� szText db "������� rax: 0000.0000.0000.0000h",0
;�����: MessageBox ���� MB_OK + MB_ICONINFORMATION
;-----------------------------------------------------------------------------

Spell64rax MACRO hWnd, szCaption, szText
LOCAL GetDWord, GetByte, add37h, SetByte, ShowMessage
push rax
push rbx
push rcx
push rdx
push r8
push r9

;����� ����� � ������ �������� � ������� rbx
mov rbx, offset szText	;����� ������ ������
add rbx, sizeof szText	;����� �����, ���������� �� ������ ������
sub rbx, 3		;����� ������� ����� � ������

;� ������� rcx �������� ����� ��� ��������:
;ch = 4 ������� ����� � cl = 4 ���������� �����
xor rcx, rcx		;������ rcx
mov ch, 4
 GetDWord:
mov cl, 4
;���� ������� ���� � �������� �� ���� ������� 16-������ ����� (4 ����)
 GetByte:
xor rdx, rdx		;������ rdx
mov dl, al		;���� �������: ������ ������� 8 ���
;������ dl: �������� ������� 4 ����, ��������� ������ ������� 4 ����
and dl, 0Fh
;��������� ���������� ����� � ASCII-���:
;���� ������� 4 ���� �������� ����� �� 0 �� 9, �� ���������� 30h
;���� ������� 4 ���� �������� ����� �� 0Ah �� 0Fh, �� ���������� 37h
cmp dx, 9
jg add37h
add dx, 30h
jmp SetByte
  add37h:
add dx, 37h
;��������� ���� �� ��������� ������
  SetByte:
mov [rbx], dl
;�������� ��� ��������� 16-������ �����
ror rax, 4	;����� ��������� �����
dec rbx		;���������� ������
;��������� ������� ����������� �����
dec cl
cmp cl, 0
jg GetByte 
;���������� ����� ��� ����� ����� �������� �� ������ ��������
dec rbx
;��������� ������� �������� �����
dec ch
cmp ch, 0
jg GetDWord

  ShowMessage:
mov rcx, hWnd		;hWnd
lea rdx, szText		;lpText
lea r8, szCaption	;lpCaption
mov r9, 40h		;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h
call MessageBoxA

pop r9
pop r8
pop rdx
pop rcx
pop rbx
pop rax
ENDM ;Spell64rax
;-----------------------------------------------------------------------------