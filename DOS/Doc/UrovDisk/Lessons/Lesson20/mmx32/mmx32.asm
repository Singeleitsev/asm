;mmx32.asm
.586p
locals	;��������� ���������� ��������� ����� (� ��������� @@) � ���������
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	
include	WindowA.inc	
include	mmx32.inc	
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	ExitProcess:PROC
.data
mem3	dd	0ffff1111h
.code
start	proc	near
;����� ����� � ���������:
;������ ���������� ���� 
	finit
	movd	rmmx0,mem3
;	movd	eax,rmmx0	
;	movq	rmmx0,mem3	
	movd	mem3,rmmx0	
	emms
;����� �� ����������
;������� ����� VOID ExitProcess(UINT uExitCode)   // exit code for all threads
	push	NULL
	call	ExitProcess
start	endp
end	start