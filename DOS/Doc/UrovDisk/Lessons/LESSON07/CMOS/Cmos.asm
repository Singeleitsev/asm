%TITLE "������� CMOS � RTS �����"

MASM
MODEL   small

;******************************************************************************

.386

.data   ;ᥣ���� ������ *******************************************************
        stroka          DB      00h     ;����� ��ப� ��뢮�� ᮮ�饭��
        kolonka         DB      00h     ;����� ������� ��뢮�� ᮮ�饭��
        tek_el          DB      00h     ;���祭�� �祩�� �� 㪠������ �����
        firstp_val      DB      00h     ;1-� ��⭠����筠� ��� � ���� ASCII
        secondp_val     DB      00h     ;2-� ��⭠����筠� ��� � ���� ASCII
        svalue          DB      00h     ;��砫�� ���� �⠥��� CMOS � RTS �����
        evalue          DB      00h     ;������ ���� �⠥��� CMOS � RTS �����
        color           DB      0Fh     ;��ਡ�� 梥� �뢮����� ��ப� ��� ᨬ����
        bit_number      DB      30h     ;����� ���
	file_name	DB	"CMOS.BAK",0
        file_name2      DB      "CMOS.SAV",0
	handle		DW	?
        screeng_mode    DB      ?       ;०�� �࠭�
	count		DB	1	;���稪
	chislo		DB	0	;bcd �᫮

        message1        DB      "Cmos Editor v2.3             "
        dlmessage1      =       $-message1
        message2        DB      "Programmed by Pashkov Aleksey"
        dlmessage2      =       $-message2
        message3        DB      "6.99"
        dlmessage3      =       $-message3
	message4	DB	"������ ।����㥬� ���� � hex �ଥ - "
	dlmessage4	=	$-message4
	message5	DB	" �.�.  Press any key"
	dlmessage5	=	$-message5
	message6	DB	"CMOS ᪮��஢��� � 䠩�. ����� ���� �������"
	dlmessage6	=	$-message6
	message7	DB	"������ ���祭�� � hex �ଥ - "
	dlmessage7	=	$-message7
	message8	DB	"�MOS ᪮��஢��� �� 䠩��. ����� ���� �������"
	dlmessage8	=	$-message8
        clear_str       DB      "                                                                                "
        dlclear_str     =       $-clear_str
        zagolovok       DB      "����� ���祭�� ��� ���� ���᭥���"
        Key_Menu        DB      "F2-������CMOS|F3-�⥭��CMOS|F4-������஢���|F10-EXIT                           "
        ascii_code      DB      0h
        scan_code       DB      0h
        page_index      DW      0h
	error_message	DB	"Can't create file"

        mes0            DB      "                         ᥪ㭤�                                                "
                        DB      "                         ᥪ㭤� �㤨�쭨��                                     "
                        DB      "                         ������                                                 "
                        DB      "                         ������ �㤨�쭨��                                      "
                        DB      "                         ���                                                   "
                        DB      "                         ��� �㤨�쭨��                                        "
                        DB      "                         ���� ������                                            "
                        DB      "                         ���� �����                                            "
                        DB      "                         �����                                                  "
                        DB      "                         ���                                                    "
                        DB      "                         RTS STATUS REGISTER A (����� ॣ����)                "
                        DB      "                         { ���� � 0 �� 3                                        "
                        DB      "                         ��室��� ���� ������,                              "
                        DB      "                         ��� ࠢ�� 1024 ��                                      "
                        DB      "                         ���� ������ ���� ࠢ�� 0110                           }"
                        DB      "                         ���������� �६���. 0=��⮢ � �⥭��                   "
                        DB      "                         { ���� � 4 �� 6 - ����⥫� �����,                    "
                        DB      "                         ��� 32.768 ���                                         "
                        DB      "                         ���� ������ ���� ࠢ�� 010                            }"
                        DB      "                                                                                "
                        DB      "                         RTS STATUS REGISTER B (����� ॣ����)                 "
                        DB      "                         ������/��⭥� �६�. 0=��४��祭�� ����饭�          "
                        DB      "                         12/24 - �ᮢ�� ०��: 1=24 �ᮢ��                    "
                        DB      "                         BCD/BIN �ଠ�: 0=BCD                                  "
                        DB      "                         ࠧ�襭�� ��室���� ������ (�. 0Ah): 0=����饭�    "
                        DB      "                         ࠧ��. ���뢠��� �� ����砭�� ᬥ�� �६���: 0=����  "
                        DB      "                         ࠧ�襭�� ���뢠��� �� �㤨�쭨��: 0=����饭�       "
                        DB      "                         ࠧ�襭�� ��८���᪨� ���뢠���: 0=����饭�       "
                        DB      "                         ��⠭���� �ᮢ: 0=��ଠ��� 室                      "
                        DB      "                                                                                "
                        DB      "                         RTS STATUSREGISTER C �⥭�� 䫠��� ������-� ���뢠���"
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         UF ���뢠��� �� ᬥ�� �६���                         "
                        DB      "                         AF ���뢠��� �� �㤨�쭨��                            "
                        DB      "                         PF ��८���᪨� ���뢠���                            "
                        DB      "                         IRQF ��騩 ����� ���뢠���                           "
        dl0             =       $-mes0

        mes0D           DB      "                         RTS STATUS REGISTER D                                  "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��⠭��: 1=��ଠ, 0=ࠧ�� ���३                     "
                        DB      "                                                                                "
                        DB      "                         POST DIAGNOSTIC STATUS BYTE                            "
                        DB      "                         1=��१�ࢨ஢��                                       "
                        DB      "                         1=��१�ࢨ஢��                                       "
                        DB      "                         1=Time Valid ��� �ଠ�쭮� �訡�� �ᮢ-���������25:98"
                        DB      "                         1=HDD Erorr �訡�� �� ���樠����樨 �������        "
                        DB      "                         1=��ᮮ�-��� ࠧ��� ���,��।-�� ��⮬ ����� � CMOS"
                        DB      "                         1=Bad Config - �訡�� ���䨣��樨                     "
                        DB      "                         1=Checksum Bad - �訡�� ����஫쭮� �㬬� CMOS         "
                        DB      "                         1=Power Lost - ��﫮�� ��⠭�� CMOS                   "
                        DB      "                                                                                "
                        DB      "                         �ᯮ������ POST ��� ��।������ �।���ਨ ��⠭����"
                        DB      "                         00=������� ��� �ணࠬ�� ���                     "
                        DB      "                         01=ࠧ��� ����� ��।����                             "
                        DB      "                         02=��� ����� ��襫                                  "
                        DB      "                         03=��� ����� ��� �訡��                           "
                        DB      "                         04=POST �����襭 ���� ��१���㧪� ��⥬�             "
                        DB      "                         05=JMR FAR [0:0467h] � ���樠�-� ����஫��� ���뢠���"
                        DB      "                         06=��� ���饭��� ०��� ��襫                       "
                        DB      "                         07=��� ���饭��� ०��� ��� �訡��                "
                        DB      "                         08=�訡�� �� ��।������ ࠧ��� �����               "
                        DB      "                         09=��६�饭 ���� Extendede Memory (INT15h)            "
                        DB      "                         0A=JMR FAR[0:0467h]��� ���樠�-� ����஫��� ���뢠���"
                        DB      "                         0B=�ᯮ������ 80386                                  "
                        DB      "                                                                                "
                        DB      "                         ���� ����                                              "
                        DB      "                         ��᪮���  B 0000=����, 0001=360 �����                  "
                        DB      "                         ��᪮���  B 0010=1,2 �����                             "
                        DB      "                         ��᪮���  B 0011=720 �����                             "
                        DB      "                         ��᪮���  B 0100=1,4 �����                             "
                        DB      "                         ��᪮���  A 0000=����, 0001=360 �����                  "
                        DB      "                         ��᪮���  A 0010=1,2 �����                             "
                        DB      "                         ��᪮���  A 0011=720 �����                             "
                        DB      "                         ��᪮���  A 0100=1,4 �����                             "
        dl0D            =       $-mes0D

        mes10           DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ���� ����                                              "
                        DB      "                         �ਢ�� 1  { 0000=���                                   "
                        DB      "                         �ਢ�� 1    ��������� ��⮢ � 0001 �� 1110            "
                        DB      "                         �ਢ�� 1    ᮮ⢥��⢥������ ⨯�� � 1 �� 14         "
                        DB      "                         �ਢ�� 1    1111=⨯ � ���� 19h                      }"
                        DB      "                         �ਢ�� 0  { 0000=���                                   "
                        DB      "                         �ਢ�� 0    ��������� ��⮢ � 0001 �� 1110            "
                        DB      "                         �ਢ�� 0    ᮮ⢥��⢥������ ⨯�� � 1 �� 14         "
                        DB      "                         �ਢ�� 0    1111=⨯ � ���� 1Ah                      }"
                        DB      "                                                                                "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ������������� ������������                             "
                        DB      "                         1=���� ����                                            "
                        DB      "                         1=��⥬���᪨� ᮯ�����                           "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१��ࢨ஢��                                        "
                        DB      "                         { ���� 2-3 ⨯ ��ࢨ筮�� ����������� 00-EGA ��� VGA "
                        DB      "                         01-CGA 40 �⮫�殢, 10-CGA 80 ��, 11-MDA 80 ��        }"
                        DB      "                         { ���� 6-7 ������⢮ ����:                            "
                        DB      "                         00 - 1, 01 - 2                                        }"
                        DB      "                                                                                "
                        DB      "                         { ������ ������� �����,Kb                             "
                        DB      "                           Low/High 0280h=640K                                 }"
                        DB      "                         { ������ ���७��� �����, Kb                        "
                        DB      "                           Low/High                                            }"
                        DB      "                         { ����७�� ⨯ ��᪠ C,D                            "
                        DB      "                           ( � PC/2 - ��१�ࢨ஢��� )                        }"
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
        dl10            =       $-mes10

        mes20           DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         ��१�ࢨ஢��                                         "
                        DB      "                         { ����஫쭠� �㬬� CMOS c�⠥��� �⭮�⥫쭮        "
                        DB      "                           ���ᮢ � 10h �� 20h (High/Low)                     }"
                        DB      "                         { ������ ࠧ��� ���७��� �����, Kb               "
                        DB      "                           (High/Low)                                          }"
                        DB      "                         � PS/2 ����஫쭠� CRS-�㬬� CMOS � 10h-31h (High/Low) "
                        DB      "                         ����� POST                                             "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         ?                                                      "
                        DB      "                         128Kb ��� ��� �࠭�� 1Mb,1=����,����㯭� ⥭���� ������"
                        DB      "                         SETUP 䫠�:1=��ࢠ� ����㧪� ��᫥ �믮������ SETUP    "
                        DB      "                                                                                "
                        DB      "                         ��१�ࢨ஢��� (����� ����� ᢮� ���ଠ��          "
                        DB      "                         ��� �ਢ離� �ணࠬ���� ���ᯥ祭�� � ��設�).        "
                        DB      "                         ��१�ࢨ஢��� (����� ����� ᢮� ���ଠ��          "
                        DB      "                         ��� �ਢ離� �ணࠬ���� ���ᯥ祭�� � ��設�).        "
                        DB      "                         ��१�ࢨ஢��� (����� ����� ᢮� ���ଠ��          "
                        DB      "                         ��� �ਢ離� �ணࠬ���� ���ᯥ祭�� � ��設�).        "
                        DB      "                         ��१�ࢨ஢��� (����� ����� ᢮� ���ଠ��          "
                        DB      "                         ��� �ਢ離� �ணࠬ���� ���ᯥ祭�� � ��設�).        "
                        DB      "                         ��१�ࢨ஢��� (����� ����� ᢮� ���ଠ��          "
                        DB      "                         ��� �ਢ離� �ணࠬ���� ���ᯥ祭�� � ��設�).        "
                        DB      "                         ��१�ࢨ஢��� (����� ����� ᢮� ���ଠ��          "
                        DB      "                         ��� �ਢ離� �ணࠬ���� ���ᯥ祭�� � ��設�).        "
dl20                    =       $-mes20

mes_adr         DW      mes0, mes0D, mes10, mes20
mes_dl          DW      dl0, dl0D, dl10, dl20
mas_evalue      DB      0Ch, 10h, 20h, 3Fh
mas_svalue      DB      00h,0Dh,11h,21h

;******************************************************************************

.stack  256     ;ᥣ���� �⥪� ************************************************

;******************************************************************************

.code   ;ᥣ���� ����

;��楤�� ��।������ ⥪�饣� ����᪮�� ०��� ***************************
;��室�� ��ࠬ����:
;screeng_mode - ����� ����᪮�� ०���
        get_screeng_mode proc
                push    ax
                mov     ah,0Fh
                int     10h
                mov     screeng_mode,al

                pop     ax
                ret
        get_screeng_mode endp
;******************************************************************************

;��楤�� ��⠭���� ����᪮�� ०��� **************************************
;�室�� ��ࠬ����:
;screeng_mode - ����� ����᪮�� ०��� ����� �릭� ��⠭�����
        set_screeng_mode proc
                mov     ah,00h
                mov     al,screeng_mode
                int     10h

                ret
        set_screeng_mode endp
;******************************************************************************

;��楤�� ���⪨ �࠭� *****************************************************
        clear_screeng proc
                mov     ah,00h
                mov     al,03h
                int     10h

                mov     ah,11h
                mov     al,12h
                mov     bl,00h
                int     10h

                ret
        clear_screeng endp
;******************************************************************************

;�⥭�� ��⭠����筮�� �᫠ � ���������� *************************************************
;������� ���������
;�������� ���������
;
	read_int proc
		push	ax
	
cyclRC:         call    press_key
		
		cmp	scan_code,01h
		je	exit_nsk
		
                cmp     ascii_code,00h
                je      cyclRC
		
		;�⮡ࠦ���� ����⮩ ������ �� �࠭�
		mov     al,ascii_code
                mov     tek_el,al
                call    print_el 

		;ᨬ��� ������ �ਭ�������� �� 0 �� 9
cyclRC1:	cmp	ascii_code,30h
		jnae	cyclRC
		cmp	ascii_code,39h
		jna	RC1	

		;���� �� "A" �� "F"
cyclRC2:	cmp	ascii_code,41h
		jnae	cyclRC
		cmp	ascii_code,46h
		jna	RC2	

		;���� �� "a" ��	"f"
cyclRC3:	cmp	ascii_code,61h
		jnae	cyclRC
		cmp	ascii_code,66h
		jnbe	cyclRC
		
		sub	ascii_code,57h
		jmp	next_int
		
RC1:		sub	ascii_code,30h
		jmp	next_int
		
RC2:		sub	ascii_code,37h
		jmp	next_int

next_int:	call	cursor_position
		call	cursor_sdvig
		
		cmp	count,2
		je	second_int

		mov	ah,ascii_code
		shl	ah,4
		
second_int:	inc	count
		cmp	count,2
		jna	cyclRC
		or	ah,ascii_code
		mov	tek_el,ah
		mov	chislo,ah

		call	cursor_sdvig
		mov	count,1
exitRI:
		pop	ax
                ret
        read_int endp
;*****************************************************************************

;��楤�� �뢮�� ��⭠����筮�� �᫠ � ��⮬ 梥� *********************
;�室�� ��ࠬ����
;firstp_val - ���� ࠧ�� �᫠
;secondp_val - ��ன ࠧ�� �᫠
        print_h_el proc
                push    ax
                push    bx
                push    cx
                push    dx

                mov     al,firstp_val   ;����ᨬ � al �ॢ�� ���� �᫠
                mov     ah,09h          ;����� ��楤��� BIOS
                mov     bl,0Fh          ;�롮� 梥�
                mov     cx,01h          ;������⢮ ����७��
                int     10h             ;�맮� ��楤��� BIOS

                ;ᤢ�� �� ���� ����� �� ⥪�饩
                call    cursor_sdvig

                mov     al,secondp_val  ;����ᨬ � al ����� ���� �᫠
                mov     ah,09h          ;����� ��楤��� BIOS
                mov     bl,0Fh          ;�롮� 梥�
                mov     cx,01h          ;������⢮ ����७��
                int     10h             ;�맮� ��楤��� BIOS

                call    cursor_sdvig

                mov     al,"h"
                mov     ah,09h
                mov     bl,07h
                mov     cx,01h
                int     10h

                pop     dx
                pop     cx
                pop     bx
                pop     ax
                ret
        print_h_el endp
;*****************************************************************************

;��楤�� �뢮�� ���祭�� �祪�� � ����筮� ��⥬� ***************************
;�室�� ��ࠬ����
;tek_el - ���祭�� �࠭�饥�� � �祩��
;svalue - ����� �뢮������ ���祭��
        print_el_bin proc
                push    ax
                push    dx

                call    readSR

                mov     dl,tek_el
                mov     ah,00000001b

                ;�뢮� ���� �祩��
                mov     dh,svalue
                mov     tek_el,dh
                call    filter
                call    cursor_position
                add     kolonka,2
                call    print_position
                call    print_h_el
                ;*******************

                ;�뢮� ���祭�� �祩�� � ��⭠����筮� �ଥ
                mov     dh,dl
                mov     tek_el,dh
                call    filter
                mov     kolonka,10
                call    print_position
                call    print_h_el
                ;***********************************************

        startpeb:
                mov     dh,dl
                mov     tek_el,dh

                ;�뢮� ����� ���
                push    ax

                mov     ah,bit_number
                mov     tek_el,ah
                mov     kolonka,17
                call    print_position
                call    print_el

                inc     ah
                mov     bit_number,ah
                pop     ax
                ;*****************

                ;�뢮� ���祭�� �祩�� � ����筮� �ଥ
                mov     al,dl
                and     al,ah

                cmp     al,00h
                je      noll
                mov     tek_el,"1"
                jmp     peb1
        noll:
                mov     tek_el,"0"
        peb1:
                mov     kolonka,21
                call    print_position

                call    print_el
                call    corretka
                call    cursor_position
                ;***************************************

                shl     ah,1

                cmp     ah,00h
                jne     startpeb

                mov     bit_number,30h

                call    corretka

                pop     dx
                pop     ax
                ret
        print_el_bin endp
;******************************************************************************

;��楤�� �뢮�� ᨬ���� � ��⮬ 梥� *************************************
;�室�� ��ࠬ����
;tek_el - �뢮���� ᨬ���
        print_el proc
                push    ax
                push    dx

                mov     al,tek_el       ;����ᨬ � al ����� ���� �᫠
                mov     ah,09h          ;����� ��楤��� BIOS
                mov     bl,0Fh          ;�롮� 梥�
                mov     cx,01h          ;������⢮ ����७��
                int     10h             ;�맮� ��楤��� BIOS

                pop     dx
                pop     ax
                ret
        print_el endp
;*****************************************************************************

;��楤�� �뢮�� ᮮ�饭�� � ��⮬ 梥� ***********************************
;������� ��������� bp - 㪠��⥫� �� ᮮ�饭��, cx - ����� ��ப�
        print_string proc
                push    ax

                mov     ah,13h
                mov     al,01h          ;०�� �ࢨ� ��� �뢮�� ᮮ�饭��
                mov     bh,00h          ;����� ��࠭��� �࠭�
                mov     bl,color
                mov     dh,stroka
                mov     dl,kolonka
                int     10h

                ;���⠭������� �⠭���⭮�� 梥�
                mov     color,0Fh
                ;********************************

                pop     ax
                ret
        print_string endp
;*****************************************************************************

;��楤�� ᤢ��� ����� �� ���� ������ ��ࠢ� ******************************
        cursor_sdvig proc
                push    ax

                call    cursor_position
                inc     kolonka
                call    print_position

                pop     ax
                ret
        cursor_sdvig endp
;******************************************************************************

;��楤�� ��।������ ⥪�饩 ����樨 ����� ********************************
;��室�� �����
;stroka - ��ப�
;kolonka - �������
        cursor_position proc
                push    ax
                push    bx
                push    dx

                mov     ah,03h
                mov     bh,00h
                int     10h

                mov     stroka,dh
                mov     kolonka,dl

                pop     dx
                pop     bx
                pop     ax
                ret
        cursor_position endp
;******************************************************************************

;��楤�� ���⪨ ��ப� *****************************************************
;������� ���������
;color
;kolonka
;stroka
	clear_string proc
		push	bp
		push	cx
		
		call	print_position
                mov     bp,offset clear_str
                mov     cx,dlclear_str
                call    print_string
		
		pop	cx
		pop	bp
		ret
	clear_string endp
;******************************************************************************

;��楤�� ����樮��஢���� ����� *******************************************
;�室�� ��ࠬ����
;stroka - ��ப�
;kolonka - �������
        print_position proc
                push    ax
                push    dx

                mov     ah,02h
                mov     dh,stroka
                mov     dl,kolonka
                int     10h

                pop     dx
                pop     ax
                ret
        print_position endp
;*****************************************************************************

;䨫��� ��뢮�� �� �࠭, �८�஧஢뢠�� ��� � ��⭠������� ��� *********************
;�室�� ��ࠬ����
;tek_el - �뢮����� �᫮
        filter proc
                push    ax
                push    dx

                ;��ࠡ�⪠ ��ன ������ ******************************************
                mov     ah,tek_el       ;� ah 䨫���㥬�� ���祭��
                and     ah,00001111b    ;�뤥�塞 ����� ������

                cmp     ah,0Ah          ;�ࠢ������ �� � 0Ah
                jae     symb1           ;��८室 �᫨ AL>=0Ah

                add     ah,30h          ;� al ASCII ��� ���� ᮮ⢥�����騩 ��� � al
                mov     secondp_val,ah  ;��।�� �.�.�. �� ������ ��६�����
                jmp     tetr2

        symb1:  ;�᫨ ��� ᮮ⢥����� ��⭠����筠� ��� - ABCDEF
                add     ah,37h          ;� al ASCII ��� ���� ᮮ⢥�����饩 ��� � al
                mov     secondp_val,ah  ;��।�� �.�.�. �� ������ ��६�����
                jmp     tetr2

        tetr2:  ;��ࠡ�⪠ ��ன ������ ***********************************
                mov     ah,tek_el       ;� al 䨫���㥬�� ���祭��
                shr     ah,4            ;ᤢ�� � ��ࠢ� �� ���� ��� ��� ����祭�� ��ࢮ� ������

                cmp     ah,0Ah          ;�ࠢ������ al � 0Ah
                jae     symb2   ;���室 �᫨ AL>=0Ah

                add     ah,30h          ;� al ASCII ��� ���� ᮮ⢥�����饩 ��� � al
                mov     firstp_val,ah   ;��।�� �.�.�. �� ������ ��६�����
                jmp     exit
        symb2:
                add     ah,37h          ;� al ASCII ��� ���� ᮮ⢥�����饩 ��� � al
                mov     firstp_val,ah   ;��।�� �.�.�. �� ������ ��६�����

        exit:   pop     dx
                pop     ax
                ret
        filter endp
;*****************************************************************************

;��楤�� ���室� �� ᫥������ ��ப� **************************************
        corretka proc
                push    ax
                push    dx

                mov     ah,02h
                mov     dl,13
                int     21h
                mov     ah,02h
                mov     dl,10
                int     21h

                pop     dx
                pop     ax
                ret
        corretka endp
;*****************************************************************************

;��楤�� �⥭�� ���祭�� CMOS � RTS ****************************************
;�室�� ��ࠬ����
;svalue - ���� �祩�� �⥭�� ���祭�� ���ன �ந��������
;��室�� ��ࠬ����
;tek_el - ���⥭��� ���祭��
        readSR proc
                push    ax

                mov     al,svalue       ;����� �祩�� �� ���ன �ந���������⥭��
                out     70h,al          ;����ᨬ �� ���筨� � ���� smoc rts
                wait
                xor     ax,ax           ;���⪠ ॣ���� ax
                in      al,71h          ;������ � ॣ���� al �� ���� ���祭�� �祩�� smoc rts
                wait
                mov     tek_el,al       ;��ᢠ����� tek_el ���祭�� �祩��

                pop     ax
                ret
        readSR endp
;*****************************************************************************

;��楤�� ����� ���祭�� � �祩�� CMOS **************************************
;������� ���������
;tek_el - �����뢠���� ���祭��
        writeSR proc
                push    ax

                mov     al,svalue
                out     70h,al
                mov     al,tek_el
                out     71h,al

                pop     ax
                ret
        writeSR endp
;******************************************************************************

;�㭪�� ����� �� ������ ****************************************************
        press_key proc
                push    ax

                mov     ah,00h
                int     16h
                mov     ascii_code,al
                mov     scan_code,ah

                pop     ax
                ret
        press_key endp
;******************************************************************************

;��楤�� �뢮�� ����� ����� ************************************************
;��室�� ��ࠬ����
;svalue - ��砫�� ����
;page_index - ����� ��࠭���
        scr_page    proc
                push    ax
                push    bx
                push    si

                mov     si,page_index
                mov     al,mas_evalue[si]
		mov     evalue,al
		mov	al,mas_svalue[si]
		mov	svalue,al
                mov     bx,si
                add     bx,bx
                mov     bp,mes_adr[bx]
                mov     cx,mes_dl[bx]

                pop     si
                pop     bx
                pop     ax

                push    ax

                call    clear_screeng

                push    bp
                push    cx

                ;ᮧ����� ���������
                call    cursor_position
                mov     bp,offset zagolovok
                mov     cx,34
                mov     color,02h
                call    print_string
                call    corretka

                ;���� �-� ������
                mov     kolonka,0
                mov     stroka,49
                mov     color,0Dh
                mov     bp,offset Key_Menu
                mov     cx,60
                call    print_string
                ;******************

                pop     cx
                pop     bp

                ;�뢮� ���᭥���
                mov     stroka,02h
                call    print_string
                ;***************

                ;�뢮� ���� � ᮤ�ন����
                call    print_position
                call    menu_byte       ;����� ���� � ���祭�� �� �⮬� �����
                ;**************************

                ;call    press_key

                pop     ax
                ret
        scr_page endp
;******************************************************************************
;��楤�� �뢮�� ���� � ���祭�� �祩�� �� �⮬� ����� � ���� *************
;�室�� ��ࠬ����
;svalue - ����
        menu_byte proc
                push    ax
                push    dx

        start:
                mov     dh,svalue       ;����頥� � dh ����� �⠥� �祩��
                mov     tek_el,dh       ;����� �� �祩�� � tek_el

                ;�롮� ������ ��� ��⭠������ �뢮� ᮤ�ন���� �祩��
                cmp     dh,0Ah
                je      bin_el
                cmp     dh,0Bh
                je      bin_el
                cmp     dh,0Ch
                je      bin_el
                cmp     dh,0Dh
                je      bin_el
                cmp     dh,0Eh
                je      bin_el
                cmp     dh,10h
                je      bin_el2
                cmp     dh,12h
                je      bin_el
                cmp     dh,14h
                je      bin_el
                cmp     dh,33h
                je      bin_el
                ;*************************************************************

                ;ᤢ����� ����� ��ࠢ� �� 2 ����権 ��। �뢮��� ���� �祩��
                call    cursor_position ;��। ����� �����
                add     kolonka,02h     ;㢥��稢��� ����� ⥪�饩 ������� �� 2
                call    print_position  ;ᤢ����� �����
                ;***************************************************************

                call    filter
                call    print_h_el      ;�뢮��� ��� �� ��

                ;ᤢ����� ����� ��ࠢ� �� 6 ����権 ��। �뢮��� ���祭�� �祩��
                call    cursor_position ;��। ����� �����
                add     kolonka,6h      ;㢥��稢��� ����� ⥪�饩 ������� �� 2
                call    print_position  ;ᤢ����� �����
                ;*****************************************************************

                ;�뢮� ��⭠����筮�� ���祭�� �祩��
                call    readSR
                call    filter
                call    print_h_el
                call    corretka
                ;****************************************

        exit_mbp:
                mov     ah,svalue
                inc     ah
                mov     svalue,ah

        cmp     ah,evalue
        jbe start

                pop     dx
                pop     ax
                ret
        bin_el:
                call    corretka
                call    print_el_bin
                jp exit_mbp
        bin_el2:
                mov     stroka,36
                call    print_position
                call    corretka
                call    print_el_bin
                jp exit_mbp
        menu_byte endp
;******************************************************************************

;��ࠡ�⪠ �訡�� ᮧ����� 䠩�� **********************************************
	error_file proc
		mov	bp,offset error_message
		mov	cx,16
		call print_string
		jmp	exit_dos

		ret
	error_file endp
;******************************************************************************

;����⨥ 䠩�� ***************************************************************
	open_file proc
                push    ax
                push    dx

                mov     ah,3Dh
                mov     al,02h
                mov     dx,offset file_name
                int     21h
                mov     handle,ax
		jnc	ok
	        call    error_file
ok:
                pop     dx
                pop     ax
		ret
	open_file endp
;******************************************************************************

;�����⨥ 䠩��****************************************************************
	close_file proc
                push    ax
                push    bx

		;�����⨥ 䠩��
		mov	ah,3Eh
		mov	bx,handle
		int	21h

                pop     bx
                pop     ax
		ret
	close_file endp
;******************************************************************************

;������ 䠩�� *****************************************************************
;������� ���������
;svalue
;ax - ��� 䠩��
        save_file proc
                mov     dl,svalue
		pusha

		;ᮧ����� 䠩��
                mov     dx,ax
		mov	ah,3Ch
		mov	cx,00h
		int	21h
		mov	handle,ax
		jc	error_file

		;����஢���� CMOS � 䠩�		
		mov	svalue,00h
cycl1:		call	readSR

		mov	ah,40h
		mov	bx,handle
		mov	cx,1
		mov	dx,offset tek_el
		int	21h

		inc	svalue
		cmp	svalue,40h
		jne	cycl1
                call    close_file

		;�뢮� ᮮ�饭��
		mov     kolonka,0
                mov     stroka,47
		call	print_position
		mov     color,0Ah
                mov     bp,offset message6
                mov     cx,dlmessage6
                call    print_string
		call	press_key
		call	clear_string		
		

		popa
		mov	svalue,dl
                ret
        save_file endp
;******************************************************************************

;����㧨�� 䠩� ***************************************************************
;������� ���������
;svalue
;ax - ��� 䠩��
        load_file proc
		mov	dl,svalue
		pusha

                call    open_file
		mov	svalue,00h
cycl2:          mov     ah,3Fh
		mov	bx,handle
		mov	cx,1
		mov	dx,offset tek_el
		int	21h

                call    writeSR
		inc	svalue
		cmp	svalue,40h
                jne     cycl2
                call    close_file

		;�뢮� ᮮ�饭��
		mov     kolonka,0
                mov     stroka,47
		call	print_position
		mov     color,0Ah
                mov     bp,offset message8
                mov     cx,dlmessage8
                call    print_string
		call	press_key
		call	clear_string		

		call	scr_page

		popa
		mov	svalue,dl
                ret                
        load_file endp
;******************************************************************************
;�ࠢ����� ��楤�� ********************************************************
        main proc
                ;���樠������ ᥣ���� ������
                mov     ax,@data
                mov     ds,ax
                mov     es,ax
                xor     ax,ax
                ;*****************************

                ;���樠������ ⥪�饣� ����᪮�� ०���
                call    get_screeng_mode

                ;���⪠ �࠭�
                call    clear_screeng

                ;��뢮� ᮡ饭�� �� ����᪨� �ࠢ��
                mov     bp,offset message1
                mov     cx,dlmessage1
                call    print_string
                call    corretka

                call    cursor_position
                mov     bp,offset message2
                mov     cx,dlmessage2
                call    print_string
                call    corretka

                call    cursor_position
                mov     bp,offset message3
                mov     cx,dlmessage3
                call    print_string
                call    corretka
                ;***********************************

                ;mov     al,svalue
                ;mov     mas_svalue[0],al
                call    press_key
                call    scr_page

non_sys_key:    call    press_key

                ;����� �� ��⥬��� ������
                cmp     ascii_code,00
                jne     non_sys_key

                ;��ࠡ�⪠ ��⥬��� ������
                cmp     scan_code,51h
                je      PgDn

                cmp     scan_code,49h
                je      PgUp

                cmp     scan_code,44h
                je      exit_dos
		
		cmp	scan_code,3Ch
                je      save_cmos

		cmp	scan_code,3Dh
                je      load_cmos

		cmp	scan_code,3Eh
		je	edit_cmos

                jmp     non_sys_key

                ;************************************************************
PgDn:           cmp     svalue,40h
                je      non_sys_key
                inc     page_index
                mov     si,page_index
                call    scr_page
                jmp     non_sys_key

PgUp:           cmp     svalue,0Dh
                je      non_sys_key
                dec     page_index
                mov     si,page_index
                mov     ah,mas_svalue[si]
                mov     svalue,ah
                call    scr_page
                jmp     non_sys_key
		
save_cmos:      mov     ax,offset file_name
                call    save_file

		jmp	non_sys_key
                ;**************************************************************

load_cmos:      ;����㧪� CMOS �� 䠩�� ***************************************
                call    load_file
		jmp	non_sys_key

edit_cmos:	;।���஢���� CMOS ******************************************
		pusha

                mov     ax,offset file_name2
                call    save_file

		;���� ����
                mov     kolonka,0
                mov     stroka,47
		call	print_position
		
		mov     color,0Ah
		
                mov     bp,offset message4
                mov     cx,dlmessage4
                call    print_string
		
		call    read_int
		
		mov	al,chislo
		push	ax
		
		mov     bp,offset message5
                mov     cx,dlmessage5
                call    print_string
		
		call	press_key
		
		;���⪠ ⥪�饩 ��ப�
                mov     kolonka,0
                mov     stroka,47
		call	clear_string
                mov     color,0Ah

		;���� ������ ���祭�� �� ���������� �����
                mov     bp,offset message7
                mov     cx,dlmessage7
                call    print_string
		
		call    read_int
		
		mov	al,chislo
		push	ax
		
                mov     bp,offset message5
                mov     cx,dlmessage5
                call    print_string
	
		pop	ax
		mov	tek_el,al

		pop	ax
		mov	svalue,al
	
		call 	writeSR

		call	press_key

exit_nsk:	;���⪠ ⥪�饩 ��ப�
                mov     kolonka,0
                mov     stroka,47
                mov     color,0Ah
		call	clear_string

		call	scr_page
		
		popa
		jmp	non_sys_key
;******************************************************************************

		;**************************************************************
                ;���⠭������� ����᪮�� ०��� ����� �� �� ����᪠ �ணࠬ��
exit_dos:       call set_screeng_mode
                ;************************

        ;�맮� �⠭���⭮� �㭪樨 DOS ��室 �� �ணࠬ��
        mov     ax,4c00h
        int     21h
        ;************************************************

        main endp
;******************************************************************************

end main
