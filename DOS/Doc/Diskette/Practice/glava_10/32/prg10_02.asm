;----------------------------------------------------------
;prg10_02.asm - программа вычислени€ скал€рного произведени€ двух векторов.
;----------------------------------------------------------
.486
.model flat,STDCALL	;модель пам€ти flat,
;STDCALL - передача параметров в стиле — (справа налево), 
;	вызываема€ процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
include xmm_32.inc
;ќбъ€вление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	SetConsoleTitleA:PROC
extrn	ExitProcess:PROC
.stack	256
.586
.data
xmm_pack_1	dd	1.0, 2.0, 3.0, 4.0
xmm_pack_2	dd	5.0, 6.0, 7.0, 8.0
rez_sum	dd	0.0	;результат сложени€
TitleText	db	'—кал€рное произведение двух векторов',0
.code
start	proc	near	;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	eax,eax
	jz	exit	;неудача
;выведем заголовок окна консоли SetConsoleTitle:
	push	offset TitleText
	call	SetConsoleTitleA
;проверить успех вывода заголовка
	test	eax,eax
	jz	exit	;неудача
;-------------------------------------------------------
	movaps	rxmm0,xmm_pack_1	;rxmm0= 4.0, 3.0, 2.0, 1.0
	mulps	rxmm0,xmm_pack_2	;rxmm0= 4.0і8.0, 3.0і7.0, 2.0і6.0, 1.0і5.0
	movaps	rxmm1, rxmm0	;rxmm1= 4.0і8.0, 3.0і7.0, 2.0і6.0, 1.0і5.0
	shufps	rxmm1,rxmm1,4eh	;rxmm1= 2.0і6.0, 1.0і5.0, 4.0і8.0, 3.0і7.0
	addps	rxmm0, rxmm1	;складываем:
;rxmm0= 4.0і8.0, 3.0і7.0, 2.0і6.0, 1.0і5.0
;+
;rxmm1= 2.0і6.0, 1.0і5.0, 4.0і8.0, 3.0і7.0
;=
;rxmm0= 4.0і8.0+2.0і6.0, 3.0і7.0+1.0і5.0, 2.0і6.0+4.0і8.0, 1.0і5.0+3.0і7.0
;или
;rxmm0= 44.0, 26.0, 44.0, 26.0
	movaps	rxmm1, rxmm0	;rxmm1= 44.0, 26.0, 44.0, 26.0
	shufps	rxmm1,rxmm1,11h	;rxmm1= 26.0, 44.0, 26.0, 44.0
	addps	rxmm0, rxmm1	;складываем:
;rxmm0= 44.0, 26.0, 44.0, 26.0
;+
;rxmm1= 26.0, 44.0, 26.0, 44.0
;=
;rxmm0= 70.0, 70.0, 70.0, 70.0
;сохран€ем результат
	movss	rez_sum,rxmm0
exit:	;выход из программы
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
