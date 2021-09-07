;========================================================================================
;Dialog3Proc proc uses rax rbx rdi rsi, hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
Dialog3Proc proc hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
;========================================================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp ;<-- ;sub rsp,8
	;mov rbp,rsp ;<--
;Align the Stack by 10h
	and rsp,-16
	sub rsp,80h

;Store retrieved Values:
	mov hWnd,rcx
	mov uMsg,rdx
	mov wParam,r8
	mov lParam,r9

	cmp rdx,111h ;WM_COMMAND
		jne dlg3exit0
	cmp rdx,110h ;WM_INITDIALOG
		je wminitdialog3
	cmp r8,IDOK
		je idok3
	jmp dlg3exit0

wminitdialog3:
	jmp dlg3exit1

idok3:
	mov rcx,hWnd
	xor rdx,rdx
	call EndDialog
	jmp dlg3exit1

dlg3exit0:
	xor rax,rax
	ret
dlg3exit1:
	mov rax,1
	ret
Dialog3Proc endp

