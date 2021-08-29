OPTION DOTNAME
option casemap:none
include temphls.inc
include win64.inc
include kernel32.inc
includelib kernel32.lib
include user32.inc
includelib user32.lib
OPTION PROLOGUE:rbpFramePrologue
OPTION EPILOGUE:rbpFrameEpilogue
.code
WinMain proc 
msg	equ rbp-sizeof MSG

	enter 90h,0
	xor ebx,ebx
	push 10029h	;hIconSm
	lea rdi,ClassName
	push rdi	;lpszClassName
	push rbx	;lpszMenuName
	push COLOR_WINDOW;hbrBackground
	push 10005h	;hCursor
	push 10029h        ;hIcon
	mov esi,400000h
	push rsi	;hInstance
	push rbx        ;cbClsExtra & cbWndExtra
	lea rax,WndProc
	push rax	;lpfnWndProc
	push sizeof WNDCLASSEX;cbSize & style
	mov rcx,rsp	;addr WNDCLASSEX
	push rbx
	push rbx
	push rbx
	push rbx
    	call RegisterClassEx	
	push rbx
	push rsi	;rsi=400000h
	shl esi,9	;rsi=CW_USEDEFAULT
	push rbx
	push rbx
	push rsi
	push rsi
	push rsi
	push rsi
	mov r9d,WS_OVERLAPPEDWINDOW or WS_VISIBLE
	mov r8,rdi	;offset ClassName
	mov edx,edi	;offset ClassName
	xor ecx,ecx
	push rbx
	push rbx
	push rbx
	push rbx
    	call CreateWindowEx
    	lea edi,msg
@@:     mov ecx,edi
	xor edx,edx
	mov r8,rbx
	mov r9,rbx
        call GetMessage
	mov ecx,edi
        call DispatchMessage
        jmp @b
WinMain endp
WndProc:cmp edx,WM_DESTROY
	je wmDESTROY
        jmp DefWindowProc
wmDESTROY: xor ecx,ecx
        call ExitProcess
;---------------------------------------
ClassName db 'Win64 Iczelion lesson #3',0
end