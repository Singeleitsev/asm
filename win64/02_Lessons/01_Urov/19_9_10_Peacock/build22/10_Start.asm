;prg20_1.asm
;������ ���������� ��� Win64 � �������������� ����, 
;���� ��������, �������� �������� ����������� ����������� ����,
;������������ ��������� ��������� ������ � �������� � 
;�������� ������������� ������������

	option casemap:none

;Standard Libraries
        includelib F:\bin\dev\asm\ml64\VS2019\lib\user32.lib
        includelib F:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
        includelib F:\bin\dev\asm\ml64\VS2019\lib\gdi32.lib
	includelib F:\bin\dev\asm\ml64\VS2019\lib\winmm.lib
;Custom Includes
        include include\API64.inc
        include include\struct64.inc
        include include\Mem.inc
        include include\Call.inc
	include include\Spell.inc
;Urov Includes
	include Urov\show_rax.inc
	include Urov\sim4_to_RAXbin.inc
	;include urov\WindowA64.inc

.const
;System
	IDOK equ 1
	IDCANCEL equ 2
;Menu & Dialog
	include Urov\Urov19.inc
;Dialog Names
	lpmenu db "MYMENU",0
	lpdlg1 db "IDD_DIALOG1",0
	lpdlg2 db "IDD_DIALOG2",0
	lpdlg3 db "AboutBox",0
;Sound files
	playFileCreate db 'Urov\create.wav',0
	playFilePaint db 'Urov\paint.wav',0
	playFileDestroy db 'Urov\destroy.wav',0
;Captions and Labels
	szClassName db '���������� Win64',0
	szTitleName db '���������� Win64 �� ����� ����������',0
	MesWindow db '������! �� ��� ��� ������� ���������� ���������� �� ����� ����������?'
	MesWindowLen = $-MesWindow
;TextOut ex-Locals
	@@TXT_TEXTOUT db '����� ������� �������� TEXTOUT'
	lenTXT_TEXTOUT=$-@@TXT_TEXTOUT
;DrawText ex-Locals
	@@TXT_DRAWTEXT db '����� ������� �������� DRAWTEXT',0
;Peacock Constants
	i30 dw 30
	i90 dw 90
	i100 dw 100
	i120 dw 120
	icenter dq 100
	icycl dq 319
;Laces Constants
	N equ 18 ;N is number of Vertices
	X_c equ 160
	Y_c equ 100

.data
;Handles
	hInst dq 0
	hwnd dq 0
	lpCmdLine dq 0
	lpEnvString dq 0
;System Metrics
	memdc dq 0 ;!!!��� ���������� ����������
	X_max dq 0 ;!!!��� ���������� ����������
	Y_max dq 0 ;!!!��� ���������� ����������
;Coordinates
	X_start dq 0	
	X_end dq 0	
	Y_start dq 0	
	Y_end dq 0
;Peacock Variables
	x1 dq 1
	x2 dq 0
	y2 dq 0
;Laces Variables
	X_mas dq N dup (0)
	Y_mas dq N dup (0)
	i_N dw N
	R dw 99
	DTT dq 0
	t dq 0
	i dq 0
	j dq 0
	i2 dw 2	
;Structures
	osvi OSVERSIONINFO64 <>
	startupinfo STARTUPINFO64 <>
	wcl WNDCLASSEX64 <>
	message MSG64 <>
	ps PAINTSTRUCT64 <>
	lpRect RECT64 <>
	pt POINT64 <>
;show_eax
	eedx db	17 dup (0)
	;eecx dq 0
	template db '0123456789ABCDEF'
	MesMsgBox db '������� (���������� rax):',0
;Debug messages
	nErr1 dq 0
	nErr2 dq 0
	szErr db "Error",0
	szRAX db "������� rax: 0000.0000.0000.0000h",0

.code
;����� ����� � ���������:
;������ ���������� ����
start proc
;Align the Stack by 10h
        and rsp,-16

;���������� � ������ Windows (���������� 11)
	sub rsp,20h
	lea rcx,osvi
	call GetVersionExA
	;add rsp,20h
;�������� ��������� �� ��������� ������
	;sub rsp,20h
	call GetCommandLineA
	;add rsp,20h
	mov lpCmdLine,rax
;��������� �� ���� � ����������� ���������
	;sub rsp,20h
	call GetEnvironmentStringsA
	;add rsp,20h
	mov lpEnvString,rax
;����� VOID GetStartupInfo(LPSTARTUPINFO lpStartupInfo)	;��������� �� ��������� STARTUPINFO
	;sub rsp,20h
	lea rcx,startupinfo
	call GetStartupInfoA
	;add rsp,20h
;�������� �������� �������� ������, �� �������� �������� ������
	;sub rsp,20h
	xor rcx,rcx
	call GetModuleHandleA
	mov hInst,rax
	add rsp,20h
;����� hInst ����� �������������� � �������� ����������� ������� ����������
;����� ���������� ����

	include 20_WinMain.asm

start endp

;WindowProc
	include 30_WindowProc.asm
;MenuProc
	include 40_MenuProc.asm
;DialogProc1
	include 50_DialogProc1.asm
;DialogProc2
	include 60_DialogProc2.asm
;AboutDialog
	include 70_About.asm

end