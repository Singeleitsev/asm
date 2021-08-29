OPTION DOTNAME
option casemap:none
include temphls.inc
include win64.inc
include kernel32.inc
includelib kernel32.lib
include user32.inc
includelib user32.lib
include gdi32.inc
includelib gdi32.lib
OPTION PROLOGUE:rbpFramePrologue
OPTION EPILOGUE:rbpFrameEpilogue
.code
WinMain proc 
msg	equ [rbp-sizeof MSG]

	enter sizeof MSG+sizeof WNDCLASSEX+20h,0;90h,0
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
	add rsp,sizeof WNDCLASSEX+20h
	push rbx
	push rsi	;rsi=400000h
	shl esi,9	;rsi=CW_USEDEFAULT
	push rbx
	push rbx
	push 352
	push 512
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
        call TranslateMessage
        mov ecx,edi
        call DispatchMessage
        jmp @b
WinMain endp
WndProc:
hwnd            equ [rbp+10h]
ps              equ [rbp-sizeof PAINTSTRUCT]

		enter sizeof PAINTSTRUCT+20h,0

              	mov  hwnd,rcx
              	cmp  edx,WM_DESTROY
              	je   wmDESTROY
              	cmp edx,WM_CHAR
              	je wmCHAR
              	cmp  edx,WM_PAINT
              	je   wmPAINT
              	leave
              	jmp DefWindowProc
wmDESTROY: 	xor ecx,ecx
        	call ExitProcess
 wmCHAR:        mov expChar,r8
                mov r8d,TRUE
                xor edx,edx
                call InvalidateRect
                jmp wmBYE
wmPAINT:      	lea edx,ps
              	call BeginPaint
                sub rsp,10h
                mov qword ptr [rsp+20h],lengthof Message
                lea r9,Message
                mov r8d,90
                mov edx,192
                mov rcx,ps.PAINTSTRUCT.hdc
                call TextOut
                mov qword ptr [rsp+20h],1
                lea r9,expChar
                mov r8d,150
                mov edx,242
                mov rcx,ps.PAINTSTRUCT.hdc
                call TextOut
                add rsp,10h
                lea edx,ps
                mov rcx,hwnd
                call EndPaint
wmBYE:          leave
                retn
;---------------------------------------
ClassName db 'Win64 Iczelion''s lesson #6: Keyboard Input',0
Message   db 'Press any key'
expChar   dq   '?'
end