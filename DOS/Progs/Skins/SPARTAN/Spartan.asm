INCLUDE minica2.inc
;********************************
;The Spartan Interface
;For Minica's Assembler Programs
;FEATURES:
;	- Fast Speed,
;	- Text-Based Data Notification,
;	- Lots Of Indicators And Monitors
;********************************
MinicaInfo	SEGMENT PARA PUBLIC 'DATA'
Info_Mes db 10,13,'***'
	 db 10,13,'This program has been developed by Minica V. SENGHEELIEYTZEFF'
	 db 10,13,'Copyright (C) Minica, 2003. All rights reserved'
	 db 10,13,'***'
	 db 10,13,'Minica`s Address:'
	 db 10,13,'443125, Samara, Novo-Sadovaya st., 359-50. Postbox 9828'
	 db 10,13,'***'
	 db 10,13,'Minica`s Phone No.: (846-2) 45-30-06'
	 db 10,13,'***'
	 db 10,13,'Minica`s On Line:'
	 db 10,13,'http:\\www.minica.com'
	 db 10,13,'***'
Info_Mes_Len=$-Info_Mes
MinicaInfo	ENDS

ProgVars	SEGMENT PARA PUBLIC 'DATA'
hello		db	10,13, 'You`re done!$'
hello_len=$-hello
ProgVars	ENDS
;*******************************
stk	SEGMENT	stack
	db	256 dup (0)
stk	ENDS
;*******************************
code	SEGMENT PARA PUBLIC 'CODE'
ASSUME	CS: code, ES: MinicaInfo, DS: ProgVars, SS:stk
main	PROC
;Point es to MinicaInfo
	mov	ax, MinicaInfo
	mov	es, ax
;Point ds to ProgVars
	mov	ax, ProgVars
	mov	ds, ax
;Print Info About The Architect
	call	Architect
prn:
	mov	ah, 9h
	mov	dx, offset hello
	int	21h
exit:
	call	Architect
        mov	ax,4c00h
	int	21h
main	ENDP
;*******************************
Architect	PROC
PutASCII Info_Mes, Info_Mes_Len		;About Me
        ret
Architect	ENDP
;*******************************
Code    ENDS
        END      main
