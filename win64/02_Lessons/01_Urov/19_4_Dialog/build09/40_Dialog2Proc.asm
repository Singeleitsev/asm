;========================================================================================
;Dialog2Proc proc uses rax rbx rdi rsi, hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
Dialog2Proc proc hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
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
		jne lbl_dlg2exit0
	cmp rdx,110h ;WM_INITDIALOG
		je lbl_wminitdialog2
	cmp r8,IDOK
		je lbl_idok2
	cmp r8,IDCANCEL
		je lbl_idcancel2
	jmp lbl_dlg2exit0

lbl_wminitdialog2:
	jmp lbl_dlg2exit0

lbl_idok2:
;прочитаем X_start
	mov rcx,hWnd
	mov rdx,IDC_EDIT21
	lea r8,X_start
	mov r9,5
	call GetDlgItemTextA
	sim4_to_RAXbin X_start
;прочитаем Y_start
	mov rcx,hWnd
	mov rdx,IDC_EDIT22
	lea r8,Y_start
	mov r9,5
	call GetDlgItemTextA
	sim4_to_RAXbin Y_start
;прочитаем X_end
	mov rcx,hWnd
	mov rdx,IDC_EDIT23
	lea r8,X_end
	mov r9,5
	call GetDlgItemTextA
	sim4_to_RAXbin X_end
;прочитаем Y_end
	mov rcx,hWnd
	mov rdx,IDC_EDIT24
	lea r8,Y_end
	mov r9,5
	call GetDlgItemTextA
	sim4_to_RAXbin Y_end
;завершаем диалог
	mov rcx,hWnd
	mov rdx,1
	call EndDialog
	jmp lbl_dlg2exit1

lbl_idcancel2:
	mov rcx,hWnd
	xor rdx,rdx
	call EndDialog
	jmp lbl_dlg2exit0

lbl_dlg2exit0:
	xor rax,rax
	ret
lbl_dlg2exit1:
	mov rax,rsp
	Spell64rax 0,szAppTitle,szStackPointer
	mov rax,1
	ret
Dialog2Proc endp