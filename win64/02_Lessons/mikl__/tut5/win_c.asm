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
hwnd            equ [rbp+10h]
ps              equ [rbp-sizeof PAINTSTRUCT]

	enter sizeof PAINTSTRUCT+98h,0

              mov  hwnd,rcx
              cmp  edx,WM_DESTROY
              je   wmDESTROY
              cmp  edx,WM_PAINT
              je   wmPAINT
              leave
        jmp DefWindowProc
wmDESTROY: xor ecx,ecx
        call ExitProcess
wmPAINT:      lea edx,ps
              call BeginPaint
              mov edx,OBJ_FONT
               mov rcx,ps.PAINTSTRUCT.hdc
               call GetCurrentObject
               push rax       ;default font object
		lea rax,expFont
               push rax
               push DEFAULT_PITCH or FF_SCRIPT
               push rbx;DEFAULT_QUALITY
               push rbx;CLIP_DEFAULT_PRECIS
               push rbx;OUT_DEFAULT_PRECIS
               push OEM_CHARSET
               push rbx
               push rbx
               push rbx
               push 400
               mov r9,rbx
               mov r8,rbx
               mov edx,12
               mov ecx,26
	       push rbx
	       push rbx
	       push rbx
	       push rbx
               call CreateFont
                    mov rdx,rax
                    mov rcx,ps.PAINTSTRUCT.hdc
                    call SelectObject
                    mov edx,32C8C8h
                    mov rcx,ps.PAINTSTRUCT.hdc
                    call SetTextColor
                    mov edx,0FF0000h
                    mov rcx,ps.PAINTSTRUCT.hdc
                    call SetBkColor
                    lea ecx,expTxt
                    call lstrlen           ;help us to count the string length
                    push rax
                    lea r9,expTxt
                    xor edx,edx
                    mov r8,rdx
                    mov rcx,ps.PAINTSTRUCT.hdc
		    push rbx
		    push rbx
                    push rbx
                    push rbx
                    call TextOut
                    add rsp,30h
                    pop  rdx
                    mov rcx,ps.PAINTSTRUCT.hdc
                    call SelectObject
              lea edx,ps
              mov rcx,hwnd
              call EndPaint
wmBYE:        leave
              retn
;---------------------------------------
ClassName db 'Win64 Iczelion''s lesson #5:More about Text',0
expTxt    db 'Win64 assembly with MASM is great and easy',0
expFont   db   'script',0
end