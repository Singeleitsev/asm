;===========================================================
WndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp ;<-- ;sub rsp,8
	;mov rbp,rsp ;<--
;Align the Stack by 10h
	and rsp,-16
	sub rsp,80h

;Store Values retrieved by DispatchMessageA:
	mov hWnd,rcx
	mov uMsg,rdx
	mov wParam,r8
	mov lParam,r9

;Distributing with respect to uMsg
	cmp rdx,202h ;WM_LBUTTONUP = 0x0202
		je wmLButtonUp
	cmp rdx,111h ;WM_COMMAND ;<----- new
		je wmcommand ;<----- new
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmDestroy
	cmp rdx,6 ;WM_ACTIVATE = 0x0006
		je wmActivate
	cmp rdx,1 ;WM_CREATE = 0x0001
		je wmCreate
	jmp defWndProc

wmLButtonUp:
	mov rax,rsp
	Spell64rax hWnd,szAppTitle,szStackPointer
	jmp finWndProc

wmcommand:
	mov rcx,hWnd
	mov r8,wParam
	call MenuProc
	jmp finWndProc

wmDestroy:
	Call1 PostQuitMessage,0
	xor rax,rax
	jmp finWndProc

wmActivate:
	nop
	jmp finWndProc

wmCreate:
	;Get  Device Context
	mov rcx,hWnd
	call GetDC
	mov hDC,rax
	Spell64rax hWnd,szAppTitle,szDC
	jmp finWndProc

defWndProc:
	Call4 DefWindowProc,hWnd,uMsg,wParam,lParam
	;jmp finWndProc
finWndProc:
	ret
WndProc endp