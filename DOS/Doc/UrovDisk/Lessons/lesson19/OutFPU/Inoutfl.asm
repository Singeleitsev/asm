%TITLE "�뤥����� ������� �� ���⪮�� �ଠ� (32���) ������⥫쭮�� ����⢥����� �᫠"
;�ணࠬ�� ����ᠭ� ��㤥�⮬ ��誮�� ����ᥥ� 18 ����� 1999 ����
.586
masm
model   use16 small

.stack  256h

.data
	dec_bin_mant32	dt	0			;����� � ����筮-�����筮� �।�⠢�����
	dec_bin_har32	dt	0			;�ࠪ���⨪� � ����筮-�����筮� �।�⠢�����
	cwr				dw	0			;��६����� ��� ��࠭���� ���ﭨ� ॣ. cwr
	ten				dw	10			;����⠭� ࠢ��� 10
	float32			dd	1.2345678e12	;���祭�� ���. �᫠ ࠧ��� � 32 ��� ��� �뢮��
	mant32			dd	0			;����� � ����筮� �।�⠢�����
	har32			dd	0			;�ࠪ���⨪� ��� �ଠ� � ����筮� �।�⠢�����
	int_har32			dd	0			;�ࠪ���⨪� 楫�� � ����筮� �।�⠢�����
	number			db	0
	char				db	0
	cursor_column	db	0
	cursor_line		db	0
	number_of_digits	db	9
	flag				db	0

.code

;��楤�� ᤢ��� ����� �� ���� ������ ��ࠢ� ******************************
;��易⥫쭮 ����稥 � �ணࠬ�� ᫥����� ��楤�� read_cursor_position, set_cursor_position
        next_cursor_column proc
                push	ax

                call		read_cursor_position
                inc		cursor_column
                call		set_cursor_position

                pop     	ax
                ret
        next_cursor_column endp
;******************************************************************************************

;��楤�� ����樮��஢���� �����
;�室�� ��ࠬ����
;db cursor_line - ��ப�
;db cursor_column - �������
        set_cursor_position proc
		push	ax
		push	dx
		
                mov		ah,02h
                mov		dh,cursor_line
                mov		dl,cursor_column
                int		10h

                pop		dx
                pop     	ax
                ret
        set_cursor_position endp
;*********************************************

;��楤�� ��।������ ⥪�饩 ����樨 ����� ***
;��室�� �����
;db cursor_line - ��ப�
;db cursor_column - �������
	read_cursor_position proc
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
	read_cursor_position endp
;**************************************************************


;��楤�� �뢮�� ᨬ���� � ��⮬ 梥� ***
;�室�� ��ࠬ����
;char - �뢮���� ᨬ���
	print_char proc
                push	ax
                push	dx

                mov		al,char		;����ᨬ � al ����
                mov		ah,09h          ;����� ��楤��� BIOS
                mov		bl,0Fh          ;�롮� 梥�
                mov		cx,01h          ;������⢮ ����७��
                int		10h             ;�맮� ��楤��� BIOS

                pop		dx
                pop		ax
                ret
	print_char endp
;*****************************************************


;�뤥����� ������� �� ���⪮�� �ଠ� (32���) � �� �८�ࠧ������ � ����筮-������� �ଠ�
;��� ������⥫쭮� �ࠪ���⨪�
;१���� � st(0)
	positive_har proc
		fimul	ten
        	sub		int_har32,6
        	
		lab_p_h:
			fidiv	ten
			cmp		int_har32,0
			dec		int_har32
			jg		lab_p_h
		ret
	positive_har endp
;***********************************************************************************************************************

;�뤥����� ������� �� ���⪮�� �ଠ� (32���) � �� �८�ࠧ������ � ����筮-������� �ଠ�
;��� ����⥫쭮� �ࠪ���⨪�
;१���� � st(0)
negative_har proc
	fidiv		ten
        sub		int_har32,7

	lab_n_h:
		fimul	ten
		cmp		int_har32,0
		inc		int_har32
		jl		lab_n_h
	ret
negative_har endp
;*******************************************************************************************************


;�뢮� ����⢥����� �᫠ (32���) � �����筮� ����
	fprint32 proc
		pusha

		;��⠭���� ࠧ��� ������� � 24 ���
        	fstcw	cwr
       		and		cwr,1111000011111111b
        	or		cwr,1111000011111111b
        	fldcw	cwr
		
		fld     	float32				;����㧪� 32-bit �᫠ � �⥪ ᮯ�����
		fxtract						;�뤥����� �������(st0) � �ࠪ���⨪�(st1)
		fstp		mant32				;���������� �������
		fist		har32				;���������� �ࠪ���⨪�
		
		;��ॢ�� ����� �ࠪ���⨪� � ��� �ࠪ���⨪�
        	fldlg2						;����㧪� ����� ��� ����
        	fimul	har32				;㬭������ ����筮� �� �� log10(2)
        	frndint						;���㣫����
        	fistp		int_har32				;��࠭���� ������ �ࠪ���⨪�
        	fild		int_har32
        	fbstp	dec_bin_har32		;��࠭���� ����筮-�����筮�� ���祭�� �ࠪ���⨪�

		;�롮� ��楤��� �� �뤥����� �������
        	fld	        float32				
        	cmp	        har32,0
        		jge	        case1
        		call	        negative_har		;�맢��� ��楤��� �८�ࠧ������ ������� �᫨ ��-�� ����⥫쭠� 
        		jmp	        end_case
        		
	        case1:  	
			call	        positive_har		;�맢��� ��楤��� �८�ࠧ������ ������� �᫨ ��-�� ������⥫쭠�
			
	        end_case:  	
		        fbstp	dec_bin_mant32	;��࠭���� ����筮-�����筮�� �।�⠢����� �������

		;�뢮� �� �࠭ ����⢥����� �᫠
		lea	        si,dec_bin_mant32
		add		si,9
		mov	        al,[si]
				
		;�뢮� ����� �᫠***
		cmp	        al,0
		je	        zero
		mov	        char,"-"
		call	        print_char
		call	        next_cursor_column
		;************************
		
	;����� �ࠣ���� �ய�᪠�� ����� � �㫥�� ᮤ�ন�� �� ��ࢮ�� ���� � ����饩 ��ன ***
	zero:
		dec		si
		dec		number_of_digits
		mov		al,[si]
		cmp		al,0
		jne		first_zero				;������ ���� ���� � ���祭��� �⫨�� �� ���
		jmp		zero					;���� ����� �㫥��� ���祭�� �த������ ����
		
	;��ᬮ�� ���㡠�⮢ ��ࢮ�� ���������� ���� � �� �㫥�� ���祭���
	first_zero:
		and		al,11110000b
		cmp		al,0
		je		second_digit			;�᫨ ���訩 ���㡠�� ���� ࠢ�� ���, ��稭��� �뢮� � ��ண� ����
		jmp		first_digit				;�᫨ ���訩 ���㡠�� ���� �� ࠢ�� ���, ��稭��� �뢮� � ��ࢮ�� ����
	;********************************************************************************************************************
			
	;��砫� 横�� �뢮�� ������� ***
	print_digits:
		dec		si					;
		dec		number_of_digits		;������ �뢮������ ����
		mov		al,[si]
		
	;�뢮� ��ࢮ�� ���㡠�� ᮤ�ঠ饣� ����
	first_digit:
		and		al,11110000b
		shr		al,4
		add	        al,30h
		mov		char,al
		call		print_char
		call	        next_cursor_column

		;�᫨ �뢮����� ��� ��ࢠ� � �뢮��� ��᫥ ��� ���
		cmp		flag,0
		jne		second_digit
		mov		char,"."
		call		print_char
		call	        next_cursor_column
		inc		flag
	
	;�뢮� ��ண� ���㡠�� ᮤ�ঠ饣� ����
	second_digit:
		mov		al,[si]
		and		al,00001111b
		add	        al,30h
		mov		char,al
		call		print_char
		call	        next_cursor_column

		;�᫨ �뢮����� ��� ��ࢠ� � �뢮��� ��᫥ ��� ���
		cmp		flag,0
		jne		nonfirst_digit
		mov		char,"."
		call		print_char
		call	        next_cursor_column
		inc		flag

	nonfirst_digit:
		cmp		number_of_digits,0
		jne		print_digits
		mov		flag,0
	;**************************************
		
		;�뢮� �ࠪ���⨪� �᫠ ***
		mov		char,"E"
		call	        print_char
		call	        next_cursor_column
		
		lea		si,dec_bin_har32
		
		;�뢮� ����� �᫠***
		add		si,9
		mov		al,[si]
		cmp	        al,0
		je	        print_har
		mov	        char,"-"
		call	        print_char
		call	        next_cursor_column
		;************************
		
		;���祭�� �ࠪ���⨪�
	print_har:
		sub		si,9
		mov		al,[si]
		
		;�뢮� ��ࢮ� ���� �ࠪ���⨪�
		and		al,11110000b
		shr		al,4
		add	        al,30h
		mov		char,al
		call		print_char
		call	        next_cursor_column
		;******************************************

		;�뢮� ��ன ���� �ࠪ���⨪�
		mov		al,[si]
		and		al,00001111b
		add	        al,30h
		mov		char,al
		call		print_char
		call	        next_cursor_column
		;******************************************
		;********************************************

		mov		flag,0
		popa
		ret
	fprint32 endp
;****************************************************
	main proc
        	mov     	ax,@data
        	mov     	ds,ax

		call         	fprint32

	exit:
		mov        	ax,4c00h
        	int		21h
	main endp

			

end main