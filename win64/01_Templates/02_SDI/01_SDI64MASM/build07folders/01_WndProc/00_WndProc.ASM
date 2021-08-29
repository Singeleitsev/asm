;===========================================================
WndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Ensure the Stack is Aligned by 10h
	and rax,-16

;Store Values retrieved by DispatchMessageA:
	mov hWnd,rcx
	mov uMsg,rdx
	mov wParam,r8
	mov lParam,r9

;Distributing with respect to uMsg
	;cmp rdx,0Fh ;WM_PAINT = 0x000F
		;je wmPaint
	cmp rdx,202h ;WM_LBUTTONUP = 0x0202
		je wmLButtonUp
	cmp rdx,0100h ;WM_KEYDOWN = 0x0100
		je wmKeyDown
	cmp rdx,6 ;WM_ACTIVATE = 0x0006
		je wmActivate
	cmp rdx,5 ;WM_SIZE = 0x0005
		je wmSize
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmClose
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmDestroy
	cmp rdx,1 ;WM_CREATE = 0x0001
		je wmCreate
	jmp defWndProc

wmCreate:
	mov rax,rsp
	Spell64rax hWnd,szAppTitle,szStackPointer
	xor rax,rax
	jmp endWndProc
wmActivate:
	xor rax,rax
	jmp endWndProc
wmSize:
	xor rax,rax
	jmp endWndProc
;wmPaint:
	;xor rax,rax
	;jmp endWndProc
wmKeyDown:
	cmp r8d,01Bh ;VK_ESCAPE = 0x001B
	jne defWndProc
	Call4 MessageBoxA,hWnd,offset szExit,offset szAppTitle,21h
	cmp rax,1 ;IDOK
	jne defWndProc
	sub rsp,20h
	mov rcx,hWnd
	mov rdx,2 ;WM_CLOSE
	xor r8,r8
	xor r9,r9
	call SendMessageA
	add rsp,20h
	jmp defWndProc
wmLButtonUp:
	mov rax,rsp
	Spell64rax hWnd,szAppTitle,szStackPointer
	xor rax,rax
	jmp endWndProc
wmClose:
	Call4 MessageBoxA,hWnd,offset szExit,offset szAppTitle,21h
	cmp rax,1 ;IDOK
	je defWndProc
	xor rax,rax
	jmp endWndProc
wmDestroy:
	Call1 PostQuitMessage,0
	xor rax,rax
	jmp endWndProc
defWndProc:
	Call4 DefWindowProcA,hWnd,uMsg,wParam,lParam
endWndProc:
;Assembler will add this epilogue automatically:
	;leave 
	ret
WndProc endp


