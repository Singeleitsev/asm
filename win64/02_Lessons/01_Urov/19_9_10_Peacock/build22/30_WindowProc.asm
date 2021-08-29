;-------------------WindowProc-----------------------------------------------
WindowProc proc uses rbx rdi rsi @@hwnd:QWORD, @@mes:QWORD, @@wparam:QWORD, @@lparam:QWORD
	local @@hdc:QWORD,@@hbrush:QWORD,@@hbit:QWORD

;Ensure the Stack is Aligned by 10h
	and rsp,-16

;Store Values retrieved by DispatchMessageA:
	mov @@hwnd,rcx
	mov @@mes,rdx
	mov @@wparam,r8
	mov @@lparam,r9

	cmp rdx,0Fh ;WM_PAINT
		je wmpaint
	cmp rdx,111h ;WM_COMMAND
		je wmcommand
	cmp rdx,1 ;WM_CREATE
		je wmcreate	
	cmp rdx,2 ;WM_DESTROY
		je wmdestroy
	jmp default

;wmcreate:
	include 31_Create.asm

;wmpaint:
	include 32_Paint.asm

wmdestroy:
;������� ����������� ���� DeleteDC(memdc)
	Call1 DeleteDC,memdc

;��������� ���������� ������ ���������� �������� ��������
;SND_SYNC+SND_FILENAME = 0
	Call3 PlaySoundA,offset playFileDestroy,0,0 

;������� ��������� WM_QUIT
;������� ����� VOID PostQuitMessage(int nExitCode) // exit code
	Call1 PostQuitMessage,0

;������������ �������� 0
	xor rax,rax
	jmp endWndProc

wmcommand:
;����� ��������� ��������� ��������� �� ����
;MenuProc (DWORD @@hwnd, DWORD @@wparam)
	Call4 MenuProc,@@hwnd,@@wparam,@@hdc,@@hbrush
	jmp endWndProc

default:
;��������� �� ���������
	Call4 DefWindowProcA,@@hwnd,@@mes,@@wparam,@@lparam
	;jmp endWndProc
;... ... ...

endWndProc:
	ret

WindowProc endp
