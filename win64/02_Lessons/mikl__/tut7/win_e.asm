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

	enter sizeof MSG+sizeof WNDCLASSEX+20h,0
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

	enter sizeof PAINTSTRUCT+30h,0

              mov  hwnd,rcx
              cmp  edx,WM_DESTROY
              je   wmDESTROY
              cmp  edx,WM_PAINT
              je   wmPAINT
              cmp edx,WM_LBUTTONDOWN
              je wmLBUTTONDOWN
              leave
        jmp DefWindowProc
wmDESTROY: 	xor ecx,ecx
        	call ExitProcess
wmLBUTTONDOWN:  ;low order lParam  = x
                ;high order lParam = y
                mov word ptr expHPoint.x,r9w;eax
                shr r9,16
                mov expHPoint.y,r9d
                or expClick,TRUE
                mov r8d,TRUE
                xor edx,edx
                call InvalidateRect
                jmp  wmBYE
wmPAINT:      	lea edx,ps
              	call BeginPaint
              	cmp expClick,TRUE
                jne  wmPAINT_END
                mov qword ptr [rsp+20h],lengthof expTxt
                lea r9,expTxt
                mov r8d,expHPoint.y
                mov edx,expHPoint.x
                mov rcx,ps.PAINTSTRUCT.hdc
                call TextOut
wmPAINT_END:    lea edx,ps
              	mov rcx,hwnd
              	call EndPaint
wmBYE:        	leave
              	retn
;---------------------------------------
ClassName db 'Win64 Iczelion''s lesson #7:Mouse Input',0
expTxt    db 'You clicked here!',0
expClick  db   0
expHPoint POINT <0>
end