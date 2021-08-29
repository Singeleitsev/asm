masm
model small
.data
u	db	08h,09h,02h,03h,03h
n=$-u
p	db	n/2+1 dup (0)	;+1 -�� ������ ������
.stack	256
.486
.code
BCD_UNPACK_TO_PACK	macro	UNPACK,N,PACK
local	cycl
;--------------------------------------------------------------------------------;
;BCD_UNPACK_TO_PACK UNPACK,N,PACK ? ������������ �������������� �������������� BCD-����� �������� N ���� � ����������� BCD-�����.
;����: UNPACK - ����� �������������� BCD-�����, PACK - ����� ������������ BCD-�����,N - ����� UNPACK � ������.
;������� ���������� ���� - ������� ���� �� �������� ������ (Intel).
;�����: UNPACK - ��������� �������������� �������� N*2 ����.
;--------------------------------------------------------------------------------;
	push	eax
	push	ecx
	push	es
	push	edi
	push	esi
	push	ebx
	push	ds
	pop	es
	mov	ecx,N
;���������� N/2 (����������� PACK) � ���� ��� ��������, �� ��������� � ������� �������
	shr	ecx,1	;����� �� 2
	bt	ecx,0
	jc	$+4
	setc	bl
	inc	ecx	;��������� 1 ��� ���������� � ������� �������
;���������� ��� ������� ����� �������� �����: 	adc	ecx,0
;������ � ecx ���������� �������� ��. �����, � ������������ � ������������ UNPACK
	cld		;������� ��������� BCD-���� - ������� � �������
	lea	edi,PACK
	lea	esi,UNPACK
cycl:	xor	ax,ax
	lodsw		;��������� ��������� 2 ������������� BCD-����� �� UNPACK � ax
	rol	ah,4
	rol	ax,4
	stosb
	loop	cycl
	cmp	bl,0
	jne	$+7
	and	byte ptr [edi-1],0f0h
	pop	ebx
	pop	esi
	pop	edi
	pop	es
	pop	ecx
	pop	eax
	endm


main:
	mov	dx,@data	
	mov	ds,dx	

	BCD_UNPACK_TO_PACK	U,N,P

	mov	ax,4c00h	
	int	21h	
end	main		