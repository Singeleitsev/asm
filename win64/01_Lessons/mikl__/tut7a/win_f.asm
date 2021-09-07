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
MAXRECTS = 40;the maximum number of processed mouse clicks
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
lParam          equ [rbp+28h]
ps              equ [rbp-sizeof PAINTSTRUCT]

	enter sizeof PAINTSTRUCT+30h,0
              	mov lParam,r9
		xor eax,eax
              	mov  hwnd,rcx
              	cmp  edx,WM_DESTROY
              	je   wmDESTROY
              	cmp  edx,WM_PAINT
              	je   wmPAINT
              	cmp edx,WM_LBUTTONDOWN
              	je wmLBUTTONDOWN
                cmp edx,WM_RBUTTONDOWN
                je wmRBUTTONDOWN
              	leave
        	jmp DefWindowProc
wmDESTROY: 	xor ecx,ecx
        	call ExitProcess
wmLBUTTONDOWN:  ;low order lParam  = x
                ;high order lParam = y
                mov eax,80000000h
wmRBUTTONDOWN:  add eax,lParam
                cmp nextRect,MAXRECTS-1 
                jge @f 
                inc nextRect
                mov ecx,nextRect
                mov [ecx*4+recs],eax
                xor edx,edx
                mov rcx,hwnd
                mov r8d,TRUE
                call InvalidateRect
                jmp wmBYE
@@:             xor ecx,ecx
                call MessageBeep
                jmp  wmBYE
wmPAINT:      	mov ebx,nextRect
                inc ebx;cmp nextRect,-1
                jz wmBYE
		lea edx,ps
              	call BeginPaint
              	mov edx,TRANSPARENT
                mov rcx,rax
                call SetBkMode
@@:             mov eax,[ebx*4+recs-4]
                mov ecx,1
                shl eax,1
                adc ecx,0
                shr eax,1
                shl ecx,4
                xor edx,edx
                mov dx,ax;nYStart
                shr eax,16
                mov r8d,eax;nXStart
                mov rax,[PS+ecx]
                mov [rsp+20h],rax;cchString
                mov r9,[PS+ecx+8];lpString
                mov rcx,ps.PAINTSTRUCT.hdc
                call TextOut
                dec  ebx
                jnz @b
wmPAINT_END:    lea edx,ps
              	mov rcx,hwnd
              	call EndPaint
wmBYE:        	leave
              	retn
;---------------------------------------
ClassName db 'Win64 Iczelion''s lesson #7a: Mouse Input',0
text1   db 'right-clicking'
text2   db 'left-clicking'
PS      dq 0,0,lengthof text1, text1, lengthof text2, text2
recs    dd MAXRECTS dup(?)
nextRect dd     -1
end                    