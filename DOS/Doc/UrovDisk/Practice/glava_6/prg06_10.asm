;----------------------------------------------------------
;prg06_10.asm - ��������� ������ ������������� ����� ��������� ������� (32 ����).
;����: ��������� �������� - � ���� float32.
;�����: ����� ������������� ����� ��������� ������� �� �����
;----------------------------------------------------------
%TITLE "��������� �������� �� ��������� ������� (32����) �������������� ������������� �����"
;��������� �������� ��������� �������� ��������
.586
masm
model   use16 small
.stack  256h
.data
dec_bin_mant32	dt	0	;�������� � �������-���������� �������������
dec_bin_har32	dt	0	;�������������� � �������-���������� �������������
cwr	dw	0	;���������� ��� ���������� ��������� ���. cwr
ten	dw	10	;��������� ������ 10
float32	dd	1.2345678e12	;�������� ���. ����� �������� � 32 ���� ��� ������
mant32	dd	0	;�������� � �������� �������������
har32	dd	0	;�������������� - ���. ������ � �������� �������������
int_har32	dd	0	;�������������� - ����� � �������� �������������
number	db	0
char	db	0
cursor_column	db	0
cursor_line	db	0
number_of_digits	db	9
flag	db	0
.code
next_cursor_column	proc	;��������� ������ ������� �� ���� ������� ������
;����������� ������� � ��������� ��������:;read_cursor_position, set_cursor_position
        next_cursor_column proc
                push	ax

                call		read_cursor_position
                inc		cursor_column
                call		set_cursor_position

                pop     	ax
                ret
next_cursor_column	endp
set_cursor_position	proc	;��������� ���������������� �������
;������� ���������
;db cursor_line - ������
;db cursor_column - �������
		push	ax
		push	dx
		
                mov		ah,02h
                mov		dh,cursor_line
                mov		dl,cursor_column
                int		10h

                pop		dx
                pop     	ax
                ret
set_cursor_position	endp
read_cursor_position	proc	;��������� ����������� ������� ������� ������� 
;�������� ������
;db cursor_line - ������
;db cursor_column - �������
        	push	ax
        	push    	bx
		push    	dx
		
		mov		ah,03h
		mov		bh,00h
		int		10h
		
		mov		cursor_line,dh
		mov		cursor_column,dl
		
		pop		dx
		pop		bx
		pop 		ax
		ret
read_cursor_position	endp
print_char	proc	;��������� ������ ������� � ������ ����� 
;������� ���������
;char - ��������� ������
                push	ax
                push	dx

                mov		al,char		;������� � al �����
                mov		ah,09h          ;����� ��������� BIOS
                mov		bl,0Fh          ;����� �����
                mov		cx,01h          ;���������� ����������
                int		10h             ;����� ��������� BIOS

                pop		dx
                pop		ax
                ret
print_char	endp
positive_har	proc
;��������� �������� �� ��������� ������� (32����) � �� �������������� � �������-���������� ������ (��� ������������� ��������������
;��������� � st(0))
	fimul	ten
	sub	int_har32,6
lab_p_h:
fidiv	ten
	cmp	int_har32,0
	dec	int_har32
	jg	lab_p_h
	ret
positive_har	endp
;------------------------------------------------------------------------
negative_har	proc
;��������� �������� �� ��������� ������� (32����) � �� �������������� � �������-���������� ������ (��� ������������� �������������� ��������� � st(0))
	fidiv	ten
	sub	int_har32,7
lab_n_h:
	fimul	ten
	cmp	int_har32,0
	inc	int_har32
	jl	lab_n_h
	ret
negative_har	endp
;-----------------------------------------------------------------------
;����� ������������� ����� (32����) � ���������� ����
fprint32	proc
	pusha
;��������� ������� �������� � 24 ����
	fstcw	cwr
	and	cwr,1111000011111111b
	or	cwr,1111000011111111b
	fldcw	cwr
	fld	float32	;�������� 32-bit ����� � ���� ������������
	fxtract	;��������� ��������(st0) � ��������������(st1)
	fstp	mant32	;���������� ��������
	fist	har32	;���������� ��������������
;������� ������. �������������� � ���. ��������������
	fldlg2	;�������� ����� ��� ����
	fimul	har32	;��������� �������� ���-�� �� log10(2)
	frndint	;����������
	fistp	int_har32	;���������� ������� ��������������
	fild	int_har32
	fbstp	dec_bin_har32	;���������� �������-����������� �������� �������������
;����� ��������� �� ��������� ��������
	fld	float32
	cmp	har32,0
	jge	case1
	call	negative_har	;������� ��������� �������������� ��������, ���� ���-�� �������������
	jmp	end_case
case1:
	call	positive_har	;������� ��������� �������������� ��������, ���� ���-�� �������������
end_case:
	fbstp	dec_bin_mant32	;���������� �������-����������� ������������� ��������
;����� �� ����� ������������� �����
	lea	si,dec_bin_mant32
	add	si,9
	mov	al,[si]
;����� ����� �����
	cmp	al,0
	je	zero
	mov	char,"-"
	call	print_char
	call	next_cursor_column
;������ �������� ���������� ����� � ������� ���������� �� ������� ����� �� �������� ������ 
zero:
	dec	si
	dec	number_of_digits
	mov	al,[si]
	cmp	al,0
	jne	first_zero	;������ ������ ���� �� ���������, �������� �� ����
	jmp	zero	;���� ����� ������� �������� - ���������� �����
;�������� ���������� ������� ���������� ����� � ��������� ���������
first_zero:
	and	al,11110000b
	cmp	al,0
	je	second_digit	;���� ������� �������� ����� ����� ����, �������� ����� �� ������� �����
	jmp	first_digit	;���� ������� �������� ����� �� ����� ����, �������� ����� � ������� �����
;������ ����� ������ ��������
print_digits:
	dec	si
	dec	number_of_digits	;������ ���������� �����
	mov	al,[si]
;����� ������� ���������, ����������� �����
first_digit:
	and	al,11110000b
	shr	al,4
	add	al,30h
	mov	char,al
	call	print_char
	call	next_cursor_column
;���� ��������� ����� ������, �� ������� ����� ��� �����
	cmp	flag,0
	jne	second_digit
	mov	char,"."
	call	print_char
	call	next_cursor_column
	inc	flag
;����� ������� ���������, ����������� �����
second_digit:
	mov	al,[si]
	and	al,00001111b
	add	al,30h
	mov	char,al
	call	print_char
	call	next_cursor_column
;���� ��������� ����� ������, �� ������� ����� ��� �����
	cmp	flag,0
	jne	nonfirst_digit
	mov	char,"."
	call	print_char
	call	next_cursor_column
	inc	flag
nonfirst_digit:
	cmp	number_of_digits,0
	jne	print_digits
	mov	flag,0
;����� �������������� �����
	mov	char,"E"
	call	print_char
	call	next_cursor_column
	lea	si,dec_bin_har32
;����� ����� �����
	add	si,9
	mov	al,[si]
	cmp	al,0
	je	print_har
	mov	char,"-"
	call	print_char
	call	next_cursor_column
;�������� ��������������
print_har:
	sub	si,9
	mov	al,[si]
;����� ������ ����� ��������������
	and	al,11110000b
	shr	al,4
	add	al,30h
	mov	char,al
	call	print_char
	call	next_cursor_column
;����� ������ ����� ��������������
	mov	al,[si]
	and	al,00001111b
	add	al,30h
	mov	char,al
	call	print_char
	call	next_cursor_column
	mov	flag,0
	popa
	ret
fprint32	endp

main	proc
	mov	ax,@data
	mov	ds,ax
	call	fprint32
exit:
	mov	ax,4c00h
	int	21h
main	endp
end	main
