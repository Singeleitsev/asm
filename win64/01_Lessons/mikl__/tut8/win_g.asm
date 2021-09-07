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
ZZZ_TEST equ 0 
ZZZ_OPEN equ 1 
ZZZ_SAVE equ 2 
ZZZ_EXIT equ 3
.code
WinMain proc 
msg	equ [rbp-sizeof MSG]

	enter sizeof MSG+sizeof WNDCLASSEX+20h,0;90h,0
	xor ebx,ebx
	push 10029h	;hIconSm
	lea rdi,ClassName
	push rdi	;lpszClassName
	lea eax,menu_name
	push rax	;lpszMenuName
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
	add rsp,sizeof WNDCLASSEX+20h
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
WndProc:

		enter 20h,0

              cmp  edx,WM_DESTROY
              je   wmDESTROY
              cmp  edx,WM_COMMAND
              je   wmCOMMAND
              leave
        jmp DefWindowProc
wmDESTROY: xor ecx,ecx
        call ExitProcess
wmCOMMAND:cmp r8,ZZZ_EXIT 
        je wmDESTROY 
show_msg:mov r9,rbx;r9=MB_OK
	mov rdx,menu_handlers[r8*8]
        lea r8,menu_name
        call MessageBox
wmBYE:        leave
              retn
;---------------------------------------
ClassName db 'Win64 Iczelion''s lesson #8: Menu',0
menu_name db 'ZZZ_Menu',0
test_msg        db      'You select menu item TEST',0 
open_msg        db      'You select menu item OPEN',0 
save_msg        db      'You select menu item SAVE',0 
menu_handlers dq test_msg, open_msg, save_msg
end