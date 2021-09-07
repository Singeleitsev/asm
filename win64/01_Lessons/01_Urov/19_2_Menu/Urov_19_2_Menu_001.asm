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

.const
;Menu
	MYMENU equ 999h
	IDM_DRAWTEXT equ 100h
	IDM_TEXTOUT equ 101h
	IDM_LENGTH equ 102h
	IDM_RECTANGLE equ 103h
	IDM_PEACOCK equ 104h
	IDM_LACES equ 105h
	IDM_ABOUT equ 106h
;Sound files
	playFileCreate db 'create.wav',0
	playFilePaint db 'paint.wav',0
	playFileDestroy db 'destroy.wav',0	

.data
;Captions
	szClassName db '���������� Win64',0
	szTitleName db '��������� ���������� Win64 �� ����������',0
	MesWindow db '������! �� ��� ��� ������� ���������� ���������� �� ����������?',0
	MesWindowLen = $-MesWindow-1
;Handles
	hwnd dq 0
	hInst dq 0
	;hdc dq 0
	;lpVersionInformation OSVERSIONINFO <?>

.data?
;Structures
	wcl WNDCLASSEX64 <?>
	message MSG64 <?>
	ps PAINTSTRUCT64 <?>
	lpRect RECT64 <?>
.code
;����� ����� � ���������:
start proc

;Align the Stack by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;������ ���������� ���� 
;	lea rcx,lpVersionInformation
;	call GetVersionExA
;����� ����� �������� ��� ��� ������� ���������� � ������ Windows (���������� 11)
;�������� ��������� �� ��������� ������
;	call GetCommandLineA ;� �������� rax �����
;(��������� � �������� ���)
;�������� ��������� �� ���� � ����������� ���������
;	call GetEnvironmentStringsA ;� �������� rax ����� (��������� � �������� ���)
;��������� �� ��������� STARTUPINFO
;	lea rcx,lpStartupInfo
;	call GetStartupInfoA	
;(��������� � �������� ���)
;�������� �������� �������� ������, �� �������� �������� ������
	xor rcx,rcx
	call GetModuleHandleA
	mov hInst,rax
;����� hInst ����� �������������� � �������� ����������� ������� ����������
;����� ���������� ����

WinMain:

;���������� ����� ����
;��� ������ �������������� ���� ��������� WndClassEx
	mov wcl.cbSize,50h ;qword ptr sizeof WNDCLASSEX32 ;������ ���������
	mov wcl.style, 3 ;CS_HREDRAW+CS_VREDRAW
;����� ������� ���������
	lea rax,WindowProc
	mov wcl.lpfnWndProc,rax
	mov wcl.cbClsExtra,0
	mov wcl.cbWndExtra,0
;���������� ���������� � ���� hInstance ��������� wcl
	mov rax,hInst
	mov wcl.hInstance,rax
;������� ����� HICON LoadIcon (HINSTANCE hInstance,LPCTSTR lpIconName)
	xor rcx,rcx
	mov rdx,7F00h ;IDI_APPLICATION
	call LoadIconA
	mov wcl.hIcon,rax ;���������� ������ � ���� hIcon ��������� wcl
;������� ����� HCURSOR LoadCursorA (HINSTANCE hInstance,LPCTSTR lpCursorName)
	xor rcx,rcx
	mov rdx,7F00h ;IDC_ARROW
	call LoadCursorA
	mov wcl.hCursor,rax ;���������� ������� � ���� hCursor ��������� wcl
;��������� ���� ���� ���� - �����
;������� ����� HGDIOBJ GetStockObject(int fnObject) ;type of stock object
	xor rcx,rcx ;WHITE_BRUSH = 0
	call GetStockObject
	mov wcl.hbrBackground,rax
	mov wcl.lpszMenuName,MYMENU ;<----- new
;��� ������ ����
	lea rax,szClassName
	mov wcl.lpszClassName,rax
	mov wcl.hIconSm,0
;������������ ����� ���� - ������� ����� RegisterClassExA (&wndclass)
	lea rcx,wcl
	call RegisterClassExA
	test ax,ax ;��������� �� ����� ����������� ������ ����
	jz end_cycl_msg ;�������

;������� ����:
	xor rcx,rcx
	lea rdx,szClassName ;��� ������ ����
	lea r8,szTitleName ;������ ��������� ����
	mov r9,0CF0000h ;WS_OVERLAPPEDWINDOW ;����� ����
	mov qword ptr [rsp+20h],80000000h ;CW_USEDEFAULT ;���������� x ������ �������� ����
	mov qword ptr [rsp+28h],80000000h ;CW_USEDEFAULT ;���������� y ������ �������� ����
	mov qword ptr [rsp+30h],80000000h ;CW_USEDEFAULT ;������ ����
	mov qword ptr [rsp+38h],80000000h ;CW_USEDEFAULT ;������ ����	
	mov qword ptr [rsp+40h],0 ;parent hwnd
	mov qword ptr [rsp+48h],0 ;menu
	mov rax,hInst
	mov qword ptr [rsp+50h],rax ;hInstance
	mov qword ptr [rsp+58h],0 ;lpParam
	call CreateWindowExA
	mov hwnd,rax ;hwnd - ���������� ����

;�������� ����:
	mov rcx,hwnd
	mov rdx,1 ;SW_SHOWNORMAL
	call ShowWindow
;�������������� ���������� ����
	mov rcx,hwnd
	call UpdateWindow

;��������� ���� ���������:
cycl_msg:
	lea rcx,message ;lpMsg
	xor rdx,rdx ;hWnd
	xor r8,r8 ;wMsgFilterMin
	xor r9,r9 ;wMsgFilterMax
	call GetMessageA
	cmp ax,0
	je end_cycl_msg
;���������� ����� � ����������
	lea rcx,message
	call TranslateMessage
;�������� ��������� ������� ���������
	lea rcx,message
	call DispatchMessageA
	jmp cycl_msg

;����� �� ����������
end_cycl_msg:
	xor rcx,rcx
	call ExitProcess
start endp

;-------------------WindowProc-------------------
WindowProc proc uses rbx rdi rsi, @@hwnd:QWORD, @@mes:QWORD, @@wparam:QWORD, @@lparam:QWORD

	local @@hdc:QWORD

;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax


;Store Values retrieved by DispatchMessageA:
	mov @@hwnd,rcx
	mov @@mes,rdx
	mov @@wparam,r8
	mov @@lparam,r9

	cmp rdx,0Fh ;WM_PAINT
		je wmpaint
	cmp rdx,111h ;WM_COMMAND ;<----- new
		je wmcommand ;<----- new
	cmp rdx,1 ;WM_CREATE
		je wmcreate	
	cmp rdx,2 ;WM_DESTROY
		je wmdestroy
	jmp default

wmcreate:
;��������� �������� ���� �������� ��������
	lea rcx,playFileCreate
	xor rdx,rdx
	xor r8,r8 ;SND_SYNC+SND_FILENAME = 0
	call PlaySoundA
	xor rax,rax ;������������ �������� 0
	jmp exit_wndproc

wmcommand:
;����� ��������� ��������� ��������� �� ����
;MenuProc (QWORD @@hwnd, QWORD @@wparam)
	mov rcx,@@hwnd
	mov r8,@@wparam
	call MenuProc
	jmp exit_wndproc

wmpaint:
	lea rcx,playFilePaint
	xor rdx,rdx
	xor r8,r8 ;SND_SYNC+SND_FILENAME = 0
	call PlaySoundA
;������� �������� ����������
	mov rcx,@@hwnd
	lea rdx,ps
	call BeginPaint
	mov @@hdc,rax
;������� ������ ������ � ����
	mov rcx,@@hdc
	mov rdx,0Ah ;10
	mov r8,64h ;100
	lea r9,MesWindow
	mov qword ptr [rsp+20h],MesWindowLen	
	call TextOutA
;���������� ��������
	mov rcx,@@hdc
	lea rdx,ps
	call EndPaint
	xor rax,rax ;������������ �������� 0
	jmp exit_wndproc

wmdestroy:
	lea rcx,playFileDestroy
	xor rdx,rdx
	xor r8,r8 ;SND_SYNC+SND_FILENAME = 0
	call PlaySoundA
;������� ��������� WM_QUIT
	xor rcx,rcx
	call PostQuitMessage
	xor rax,rax ;������������ �������� 0
	jmp exit_wndproc

;��������� �� ���������
default:
	mov rcx,@@hwnd
	mov rdx,@@mes
	mov r8,@@wparam
	mov r9,@@lparam
	call DefWindowProcA
	jmp exit_wndproc

exit_wndproc:
	ret
WindowProc endp

;-------------------MenuProc-----------------------------------------------
;��������� ��������� �� ����
MenuProc proc @@hwnd:QWORD, @@wparam:QWORD

local @@hdc:QWORD

;Ensure the Stack is Aligned by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Store retrieved Values:
	mov @@hwnd,rcx
	mov @@wparam,r8

	cmp r8,IDM_DRAWTEXT	
	je @@idmdrawtext
	cmp r8, IDM_TEXTOUT	
	je @@idmtextout
	cmp r8, IDM_LENGTH
	je @@idmlength
	cmp r8, IDM_RECTANGLE
	je @@idmrectangle
	cmp r8, IDM_PEACOCK
	je @@idmpeacock
	cmp r8, IDM_LACES
	je @@idmlaces
	cmp r8, IDM_ABOUT
	je @@idmabout
	jmp @@exit

@@idmdrawtext:
;������� �������� ����������
	mov rcx,@@hwnd
	call GetDC
	mov @@hdc,rax
;������� ������ ������� �������
	mov rcx,@@hwnd
	lea rdx,lpRect
	call GetClientRect
;������� ������ ������ � ����
	mov rcx,@@hdc
	lea rdx,@@TXT_DRAWTEXT
	mov r8,-1
	lea r9,lpRect
	mov qword ptr [rsp+20h],28h ;DT_SINGLELINE+DT_BOTTOM = 20h+8h
	call DrawTextA
;���������� ��������
	mov rcx,@@hwnd
	mov rdx,@@hdc
	call ReleaseDC
	jmp @@exit

@@idmtextout:
;������� �������� ����������
	mov rcx,@@hwnd
	call GetDC
	mov @@hdc,rax
;������� ������ ������ � ����
	mov rcx,@@hdc
	mov rdx,0Ah ;10
	mov r8,96h ;150
	lea r9,@@TXT_TEXTOUT
	mov qword ptr [rsp+20h],lenTXT_TEXTOUT
	call TextOutA
;��������� �������� ����������
	mov rcx,@@hdc
	mov rdx,@@hwnd
	call ReleaseDC
	jmp @@exit

@@idmlength:
	mov rcx,@@hwnd
	lea rdx,@@TXT_LENGTH
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	jmp @@exit

@@idmrectangle:
	mov rcx,@@hwnd
	lea rdx,@@TXT_RECTANGLE
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	jmp @@exit

@@idmpeacock:
	mov rcx,@@hwnd
	lea rdx,@@TXT_PEACOCK
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	jmp @@exit

@@idmlaces:
	mov rcx,@@hwnd
	lea rdx,@@TXT_LACES
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	jmp @@exit

@@idmabout:
	mov rcx,@@hwnd
	lea rdx,@@TXT_ABOUT
	lea r8,szTitleName
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA
	jmp @@exit

@@exit:
	mov eax,0
	ret

@@TXT_DRAWTEXT db '����� ������� �������� DRAWTEXT',0
@@TXT_TEXTOUT db '����� ������� �������� TEXTOUT'
lenTXT_TEXTOUT=$-@@TXT_TEXTOUT
@@TXT_LENGTH db 'IDM_LENGTH',0
@@TXT_RECTANGLE db 'IDM_RECTANGLE',0
@@TXT_PEACOCK db 'IDM_PEACOCK',0
@@TXT_LACES db 'IDM_LACES',0
@@TXT_ABOUT db 'IDM_ABOUT',0	

MenuProc endp
end