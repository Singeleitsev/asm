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
msg	equ [rbp-sizeof MSG]

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
WndProc:
hwnd            equ [rbp+10h]
ps              equ [rbp-sizeof PAINTSTRUCT]
expRect         equ ps-sizeof RECT

	enter sizeof PAINTSTRUCT+sizeof RECT+28h,0

              mov  hwnd,rcx
              cmp  edx,WM_DESTROY
              je   wmDESTROY
              cmp  edx,WM_PAINT
              je   wmPAINT
              cmp  edx,WM_SIZE
              je   wmPAINT
              leave
        jmp DefWindowProc
wmDESTROY: xor ecx,ecx
        call ExitProcess
wmSIZE:       mov r8d,1
              xor edx,edx
              call InvalidateRect;send WM_PAINT if size changes
              jmp wmBYE
wmPAINT:      lea edx,ps
              call BeginPaint
              mov rcx,hwnd
              lea rdx,expRect
              call GetClientRect
              mov qword ptr [rbp-60h],DT_SINGLELINE or DT_CENTER or DT_VCENTER
              lea r9,expRect
              or r8,-1
              lea edx,expTxt
              mov rcx,ps.PAINTSTRUCT.hdc
              call DrawText
              lea edx,ps
              mov rcx,hwnd
              call EndPaint
wmBYE:        leave
              retn
;---------------------------------------
ClassName db 'Win64 Iczelion''s lesson #4: Painting with Text',0
expTxt    db 'Win64 assembly with MASM is great and easy',0

end