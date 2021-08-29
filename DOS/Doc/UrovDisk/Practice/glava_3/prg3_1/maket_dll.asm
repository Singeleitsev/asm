;----------------------------------------------------------
;		dll
;----------------------------------------------------------
.486
locals
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include	WindowConA.inc
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	GetStdHandle:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	SetConsoleTextAttribute:PROC
extrn	WriteConsoleA:PROC
extrn	ExitProcess:PROC
extrn	GetVersion:proc
extrn	Ellipse:proc
extrn	InvalidateRect:proc
;���������� �������� DLL-���������� ��������������
publicdll	WriteCon
publicdll	DrawPattern_1
publicdll	DrawPattern_2
;���������������� �����
SSHORT	equ	<dw	0>
;��������� ��� ��������� ��������� ������� � �������:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
con	Coord	<>
dIn	dd	0	;���������� ����� �������
dOut	dd	0	;���������� ������ �������
NumWri	dd	0	;���������� ������������� ���������-���������� ��������
.code
;����������� ��� ������������� ��������������
;dllEntry	proc	
;arg	@@hInst:dword,	@@event:dword,@@no_use:dword
;@@m:		mov	eax,1
;		ret
;dllEntry	endp	
WriteCon	proc	
arg	@@adr_str:dword,@@len_str:dword
;������� ����������� ����������� �����-������
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-���������� ������ �������
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-���������� ����� �������
;������� ������
;��������� ������ � ������� (2,6)
	mov	con.xx,2
	mov	con.yy,6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;���� �������
;������� ������ � ���� ������� � ��������� ������� � � ������� �������
;������ � ������� (2,6)
	mov	ecx,10	;������ ������� 10 ���
	mov	bl,10000001b	;��������� ��������
m1:
push	ecx
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;��������� �������� ��������� �������� - ����� �������� �� ���������� ������� - ������� bl
	xor	eax,eax
	rol	bl,1
	mov	al,bl
	push	eax
	push	dOut
	call	SetConsoleTextAttribute
	cmp	eax,0
	jz	exit	;���� �������
;������� ������
	push	0
	push	offset NumWri	;�������������� ���������� ���������� �� �����
	push	@@len_str	;Len_TitleText	;����� ������ ��� ������ �� �����
	push	@@adr_str	;offset TitleText	;����� ������ ��� ������ �� �����
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
pop	ecx
	loop	m1
exit:
	mov	eax,0ffffffffh
	mov	edx,0ffffffffh
	mov	ebx,0ffffffffh
	mov	ecx,0ffffffffh
	ret
endp	WriteCon
DrawPattern_1	proc
;-------------------------------------------------------------------
;DrawPattern_1 - ����������� ��������� ��������� ����� (��� ������������� ��������� ����������)
;-------------------------------------------------------------------
arg	@@hwnd:dword,@@hdc:dword,@@x:dword,@@y:dword,@@r:dword,@@p:dword
;������ ����������
;���������� �������� DrawPattern_1(hwnd,hdc,x,y,r,p)
;BOOL Ellipse(HDC hdc, int nLeftRect, int nTopRect, int nRightRect,int nBottomRect); 
	mov	eax,@@y
	sub	eax,@@r
	push	eax	;y-���������� ������� ������� ���� ������������ ���������� �������������
	mov	eax,@@x
	sub	eax,@@r
	push	eax	;x-���������� ������� ������� ���� ������������ ���������� �������������
	mov	eax,@@y
	add	eax,@@r
	push	eax	;y-���������� �������� ������ ���� ������������ ���������� �������������
	mov	eax,@@x
	add	eax,@@r
	push	eax	;x-���������� �������� ������  ���� ������������ ���������� �������������
	push	@@hdc	;�������� ����������
	call	Ellipse	;������ ����������
;	jz	@@End_Draw
;� ��� ������ �������� �������
	dec	@@p
	cmp	@@p,0
	je	@@End_Draw
	shr	@@r,1	;����� �� 2
;(x-r,y)
	push	@@p	;������� �����
	push	@@r	;������ ����������
	push	@@y	;y-����������
	mov	eax,@@x
	sub	eax,@@r
	push	eax	;x-����������
	push	@@hdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_1
;(x+r,y)
	push	@@p	;������� �����
	push	@@r	;������ ����������
	push	@@y	;y-����������
	mov	eax,@@x
	add	eax,@@r
	push	eax	;x-����������
	push	@@hdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_1
;(x,y-r)
	push	@@p	;������� �����
	push	@@r	;������ ����������
	mov	eax,@@y
	sub	eax,@@r
	push	eax	;y-����������
	push	@@x	;x-����������
	push	@@hdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_1
;(x,y+r)
	push	@@p	;������� �����
	push	@@r	;������ ����������
	mov	eax,@@y
	add	eax,@@r
	push	eax	;y-����������
	push	@@x	;x-����������
	push	@@hdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_1
@@End_Draw:
;��������� ��������� WM_PAINT ��� ������ ����������� �� �����
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	ret
endp	DrawPattern_1
DrawPattern_2	proc	
;-------------------------------------------------------------------
;DrawPattern_2 - ����������� ��������� ��������� ����� (c ������������� ��������� ����������)
;-------------------------------------------------------------------
arg	@@hwnd:dword,@@hdc:dword,@@x:dword,@@y:dword,@@r:dword,@@p:dword
;������ ����������
;���������� �������� DrawPattern_2(hwnd,hdc,x,y,r,p)
;BOOL Ellipse(HDC hdc, int nLeftRect, int nTopRect, int nRightRect,int nBottomRect); 
	dec	@@p
	cmp	@@p,0
	je	@@End_Draw
	shr	@@r,1	;����� �� 2
;��������� � ����� ��������� ��� Ellipse
	mov	eax,@@y
	sub	eax,@@r
	push	eax	;y-���������� ������� ������� ���� ������������ ���������� �������������
	mov	eax,@@x
	sub	eax,@@r
	push	eax	;x-���������� ������� ������� ���� ������������ ���������� �������������
	mov	eax,@@y
	add	eax,@@r
	push	eax	;y-���������� �������� ������ ���� ������������ ���������� �������������
	mov	eax,@@x
	add	eax,@@r
	push	eax	;x-���������� �������� ������  ���� ������������ ���������� �������������
	push	@@hdc	;�������� ����������
;�������� DrawPattern ��� ����������� ��� ������� ����������� �������� �������
;(x-r,y)
	push	@@p	;������� �����
	push	@@r	;������ ����������
	push	@@y	;y-����������
	mov	eax,@@x
	sub	eax,@@r
	push	eax	;x-����������
	push	@@hdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_2
;(x+r,y)
	push	@@p	;������� �����
	push	@@r	;������ ����������
	push	@@y	;y-����������
	mov	eax,@@x
	add	eax,@@r
	push	eax	;x-����������
	push	@@hdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_2
;(x,y-r)
	push	@@p	;������� �����
	push	@@r	;������ ����������
	mov	eax,@@y
	sub	eax,@@r
	push	eax	;y-����������
	push	@@x	;x-����������
	push	@@hdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_2
;(x,y+r)
	push	@@p	;������� �����
	push	@@r	;������ ����������
	mov	eax,@@y
	add	eax,@@r
	push	eax	;y-����������
	push	@@x	;x-����������
	push	@@hdc	;�������� ����������
	push	@@hwnd
	call	DrawPattern_2
@@End_Draw:
;������ ���������� �� �������� ����
;BOOL Ellipse(HDC hdc, int nLeftRect, int nTopRect, int nRightRect,int nBottomRect); 
	push	ebp
	mov	ebp,[esp]
	push	[ebp-4]
	push	[ebp-8]
	push	[ebp-12]
	push	[ebp-16]
	push	[ebp-20]
	call	Ellipse	;������ ����������
	pop	ebp
	ret
endp	DrawPattern_2
end	
;dllEntry

