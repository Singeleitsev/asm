;prg20_1.asm
;ѕример приложени€ дл€ Win64 с использованием меню, 
;окон диалогов, решением проблемы перерисовки содержимого окна,
;демонстрации некоторых принципов работы с графикой и 
;примером использовани€ сопроцессора
	option casemap:none
;Standard Includes and Libs
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	include D:\bin\dev\ml64\include\gdi32.inc
	include D:\bin\dev\ml64\include\winmm.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\gdi32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\winmm.lib
;Custom Includes
	include include\struct64_20.inc
	include include\Spell_09.inc
	include include\Mem_03.inc
	include include\Call_04.inc
;Urov Includes
	include include\show_rax.inc
	include include\sim4_to_RAXbin.inc

OSVERSIONINFO64 struct
	dwOSVersionInfoSize dd 0 ;ULONG
	dwMajorVersion dd 0 ;ULONG
	dwMinorVersion dd 0 ;ULONG
	dwBuildNumber dd 0 ;ULONG
	dwPlatformId dd 0 ;ULONG
	szCSDVersion db 128 dup (0) ;WCHAR
	wServicePackMajor dd 0 ;USHORT
	wServicePackMinor dd 0 ;USHORT
	wSuiteMask dd 0 ;USHORT
	wProductType db 0 ;UCHAR
	wReserved db 0 ;UCHAR
OSVERSIONINFO64 ends

STARTUPINFO64 struct
	cb dd ?,? ;DWORD
	lpReserved dq ? ;LPSTR
	lpDesktop dq ? ;LPSTR
	lpTitle dq ? ;LPSTR
	dwX dd ? ;DWORD
	dwY dd ? ;DWORD
	dwXSize dd ? ;DWORD
	dwYSize dd ? ;DWORD
	dwXCountChars dd ? ;DWORD
	dwYCountChars dd ? ;DWORD
	dwFillAttribute dd ? ;DWORD
	dwFlags dd ? ;DWORD
	wShowWindow dw ? ;WORD
	cbReserved2 dw ?,?,? ;WORD
	lpReserved2 dq ? ;LPBYTE
	hStdInput dq ? ;HANDLE
	hStdOutput dq ? ;HANDLE
	hStdError dq ? ;HANDLE
STARTUPINFO64 ends

.const
;System
	IDOK equ 1
	IDCANCEL equ 2
;Menu & Dialog
	include 11_Menu.inc
;Dialog Names
	lpmenu db "MYMENU",0
	lpdlg1 db "IDD_DIALOG1",0
	lpdlg2 db "IDD_DIALOG2",0
	lpdlg3 db "AboutBox",0
;Sound files
	playFileCreate db 'create.wav',0
	playFilePaint db 'paint.wav',0
	playFileDestroy db 'destroy.wav',0
;Text
	szClassName db 'ѕриложение Win64',0
	szTitleName db 'ѕриложение Win64 на ассемблере',0
	MesWindow db 'ѕривет! Ќу, как вам процесс разработки приложени€ на ассемблере?'
	MesWindowLen = $-MesWindow
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
	memdc dq 0 ;!!!это глобальна€ переменна€
	X_max dq 0 ;!!!это глобальна€ переменна€
	Y_max dq 0 ;!!!это глобальна€ переменна€
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
	MesMsgBox db 'ќтладка (содержимое rax):',0
;Debug messages
	szErr db "Error",0
	szRAX db "–егистр rax: 0000.0000.0000.0000h",0

.code
;точка входа в программу:
;начало стартового кода
start proc
;Align the Stack by 10h
        and rsp,-16

;»нформации о версии Windows (ѕриложение 11)
	sub rsp,20h
	lea rcx,osvi
	call GetVersionExA
	;add rsp,20h
;ѕолучить указатель на командную строку
	;sub rsp,20h
	call GetCommandLine
	;add rsp,20h
	mov lpCmdLine,rax
;”казатель на блок с переменными окружени€
	;sub rsp,20h
	call GetEnvironmentStrings
	;add rsp,20h
	mov lpEnvString,rax
;вызов VOID GetStartupInfo(LPSTARTUPINFO lpStartupInfo)	;указатель на структуру STARTUPINFO
	;sub rsp,20h
	lea rcx,startupinfo
	call GetStartupInfo
	;add rsp,20h
;получить значение базового адреса, по которому загружен модуль
	;sub rsp,20h
	xor rcx,rcx
	call GetModuleHandle
	mov hInst,rax
;далее hInst будет использоватьс€ в качестве дескриптора данного приложени€
;конец стартового кода

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