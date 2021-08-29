masm
model small
.data
p	db	89h,23h,30h
n=$-p
u	db	n*2 dup (0)
.stack	256
.486
.code
BCD_PACK_TO_UNPACK	macro	PACK,N,UNPACK
local	cycl
;--------------------------------------------------------------------------------;
;BCD_PACK_TO_UNPACK PACK,N,UNPACK ? ������������ �������������� ������������ BCD-����� �������� N ���� � ������������� BCD-����� �������� N*2 ����
;����: PACK - ����� ������������ BCD-�����, UNPACK - ����� �������������� BCD-�����, N - ����� PACK � ������.
;������� ���������� ���� - ������� ���� �� �������� ������ (Intel).
;�����: UNPACK - ��������� �������������� �������� N*2 ����.
;--------------------------------------------------------------------------------;
	push	eax
	push	ecx
	push	es
	push	edi
	push	esi
	push	ds
	pop	es
	mov	ecx,N
	cld		;������� ��������� BCD-���� - ������� � �������
	lea	edi,UNPACK
	lea	esi,PACK
cycl:	xor	ax,ax
	lodsb		;��������� ��������� 2 ����������� BCD-����� �� PACK � al
	ror	ax,4
	ror	ah,4
;	xchg	al,ah	;������������ ���������� ������� ���������� ����
	stosw
	loop	cycl
	pop	esi
	pop	edi
	pop	es
	pop	ecx
	pop	eax
	endm
main:
	mov	dx,@data	
	mov	ds,dx	

	BCD_PACK_TO_UNPACK	P,N,U

	mov	ax,4c00h	
	int	21h	
end	main		