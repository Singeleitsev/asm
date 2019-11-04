;----------------------------------------------------------
;		dll
;----------------------------------------------------------
.486
locals
.model flat,STDCALL	;модель пам€ти flat,
;STDCALL - передача параметров в стиле — (справа налево), 
;	вызываема€ процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
;ќбъ€вление внешними используемых в данной программе функций Win32 (ASCII):
extrn	GetStdHandle:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	SetConsoleTextAttribute:PROC
extrn	WriteConsoleA:PROC
extrn	ExitProcess:PROC
extrn	GetVersion:proc
;объ€вление процедуры WriteCon общедоступной
publicdll	WriteCon
;макроопределени€ типов
SSHORT	equ	<dw	0>
;структура дл€ установки положени€ курсора в консоли:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
con	Coord	<>
dIn	dd	0	;дескриптор ввода консоли
dOut	dd	0	;дескриптор вывода консоли
NumWri	dd	0	;количество действительно введенных-выведенных символов
.code
dllEntry	proc	
arg	@@hInst:dword,	@@event:dword,@@no_use:dword
@@m:		mov	eax,1
		ret
dllEntry	endp	

WriteCon	proc	
arg	@@adr_str:dword,@@len_str:dword
;получим стандартные дескрипторы ввода-вывода
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-дескриптор вывода консоли
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-дескриптор ввода консоли
;выведем строку
;установим курсор в позицию (2,6)
	mov	con.xx,2
	mov	con.yy,6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;если неуспех
;выведем строку в окно консоли с различных позиций и с разными цветами
;курсор в позиции (2,6)
	mov	ecx,10	;строку выведем 10 раз
	mov	bl,10000001b	;начальные атрибуты
m1:
push	ecx
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;определим атрибуты выводимых символов - будем получать их циклически сдвигом - регистр bl
	xor	eax,eax
	rol	bl,1
	mov	al,bl
	push	eax
	push	dOut
	call	SetConsoleTextAttribute
	cmp	eax,0
	jz	exit	;если неуспех
;вывести строку
	push	0
	push	offset NumWri	;действительное количество выведенных на экран
	push	@@len_str	;Len_TitleText	;длина строки дл€ вывода на экран
	push	@@adr_str	;offset TitleText	;адрес строки дл€ вывода на экран
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
pop	ecx
	loop	m1
exit:
	mov	eax,0ffffffffh
	mov	edx,0ffffffffh
	mov	ebx,0ffffffffh
	mov	ecx,0ffffffffh
	ret
endp	WriteCon
end	dllEntry

