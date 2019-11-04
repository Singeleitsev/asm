;mmx32.asm
.586p
locals	;разрешает применение локальных меток (с префиксом @@) в программе
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
%NOINCL	
include	WindowA.inc	
include	mmx32.inc	
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	ExitProcess:PROC
.data
mem3	dd	0ffff1111h
.code
start	proc	near
;точка входа в программу:
;начало стартового кода 
	finit
	movd	rmmx0,mem3
;	movd	eax,rmmx0	
;	movq	rmmx0,mem3	
	movd	mem3,rmmx0	
	emms
;выход из приложения
;готовим вызов VOID ExitProcess(UINT uExitCode)   // exit code for all threads
	push	NULL
	call	ExitProcess
start	endp
end	start