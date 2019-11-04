INCLUDE putbcd.inc
INCLUDE putascii.inc
;*****************************************************************************
;Minica's Standard Shell Macro
;*****************************************************************************
;Вход: Name of variable containing the NAME OF PROGRAM PRODUCT
;and its length
;Выход: Screen-displayed information about THE DEVELOPER (ME),
;request for executing, and EXECUTION PERMISSION BYTE in al
;*****************************************************************************
Intro MACRO var, len
LOCAL	GetChk, OhYes, OhNo, Over
INTRO_MES_0 db 10,13,'Minica`s (tm) Standard Shell (r) Version 1.0'
db 10,13,'***'
db 10,13,'Copyright (C) Minica V. SENGHEELIEYTZEFF, 2003. All rights reserved'
db 10,13,'Copyright (C) Михаил Викторович СЕНГИЛЕЙЦЕВ, 2003. Все права защищены'
db 10,13,'***'
db 10,13,'This program has been developed by Minica V. SENGHEELIEYTZEFF'
db 10,13,'Эта программа разработана Михаилом Викторовичем СЕНГИЛЕЙЦЕВЫМ'
db 10,13,'***'
db 10,13,'Minica`s Address:'
db 10,13,'443125, Samara, Novo-Sadovaya st., 359-50. Postbox 9828'
db 10,13,'Мой адрес:'
db 10,13,'443125, Самара, ул.Ново-Садовая,д.359, кв.50. А/я 9828'
db 10,13,'***'
db 10,13,'Minica`s Phone No.: (846-2) 45-30-06'
db 10,13,'Мой телефон: (846-2) 45-30-06'
db 10,13,'***'
db 10,13,'Minica`s On Line:'
db 10,13,'http:\\www.minica.com'
db 10,13,'***'
INTRO_MES_0_LEN=$-INTRO_MES_0
INTRO_MES_1 db 10, 13, 'Execute '
INTRO_MES_1_LEN=$-INTRO_MES_1
INTRO_MES_2 db ' [Y,N]?'
INTRO_MES_2_LEN=$-INTRO_MES_2
INTRO_MES_3 db 10, 13, 'Yes or No? '
INTRO_MES_3_LEN=$-INTRO_MES_3
PutASCII INTRO_MES_0, INTRO_MES_0_LEN
PutASCII INTRO_MES_1, INTRO_MES_1_LEN
PutASCII var, len
PutASCII INTRO_MES_2, INTRO_MES_2_LEN
	xor	ax, ax
	mov	ah, 1h		;1h int 21h (one char with echo from console)
	int	21h		;char is put to al
GetChk:
        cmp     al, 'y'
	je	OhYes
        cmp     al, 'Y'
	je	OhYes
        cmp     al, 'n'
	je	OhNo
        cmp     al, 'N'
	je	OhNo
PutASCII INTRO_MES_3, INTRO_MES_3_LEN
	jmp	GetChk
OhYes:
	mov	al, 1
	jmp	Over
OhNo:
	xor	ax, ax
Over:
	xor	ah, ah
		ENDM
;*****************************************************************************
.model small
.stack 256
.data
var	db	10, 13, 'Minica`s Geodesy Killing System'
len=$-var
.code
main	proc
	mov	ax, @data
	mov	ds, ax
INTRO var, len
	cmp	al, 1
	jne	exit
PutASCII var, len
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main