;===========================================================
WndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Ensure the Stack is Aligned by 10h
	and rsp,-16

;Store Values retrieved by DispatchMessageA:
	mov hWnd,rcx
	mov uMsg,rdx
	mov wParam,r8
	mov lParam,r9

;Distributing with respect to uMsg
	cmp rdx,1 ;WM_CREATE = 0x0001
		je wmCreate
	cmp rdx,6 ;WM_ACTIVATE = 0x0006
		je wmActivate
	cmp rdx,202h ;WM_LBUTTONUP = 0x0202
		je wmLButtonUp
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmClose ;mdidemo4018F5
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmDestroy
	jmp defWndProc

wmCreate:
	mov rax,rsp
	Spell64rax hWnd,szAppTitle,szStackPointer
	xor rax,rax
	jmp endWndProc
wmActivate:
	xor rax,rax
	jmp endWndProc
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


