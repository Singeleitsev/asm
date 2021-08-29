;-----------------DialogProc1-----------------------------------------
;DialogProc1 proc uses rbx rdi rsi @@hdlg:QWORD, @@message:QWORD, @@wparam:QWORD, @@lparam:QWORD
DialogProc1 proc @@hdlg:QWORD, @@message:QWORD, @@wparam:QWORD, @@lparam:QWORD
;Assembler puts these instructions automatically:
	;push rbp
	;mov rbp,rsp
	;push rbx
	;push rdi
	;push rsi

;Store retrieved Values:
        mov @@hdlg,rcx
        mov @@message,rdx
        mov @@wparam,r8
        mov @@lparam,r9

;Ensure the Stack is Aligned by 10h
        and rsp,-16

        cmp rdx,110h ;WM_INITDIALOG
        je @@wminitdialog
        cmp rdx,111h ;WM_COMMAND
        jne @@exit_false
        cmp r8,1 ;IDOK
        je @@idok
        cmp r8,2 ;IDCANCEL
        je @@idcancel
        jmp @@exit_false

@@wminitdialog:
	sub rsp,20h
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT11
	call GetDlgItem
	mov rcx,rax
	call SetFocus
	add rsp,20h
	jmp @@exit_false

@@idok:
;прочитаем Xstart UINT GetDlgItemText(
;HWND hDlg, // handle of dialog box
;int nIDDlgItem,  // identifier of control
;LPTSTR lpString, // address of buffer for text
;int nMaxCount    // maximum size of string);
	sub rsp,20h
	mov rcx,@@hdlg
	mov rdx,IDC_EDIT11
	lea r8,X_start
        mov r9,5
        call GetDlgItemTextA
        ;add rsp,20h

        ;sub rsp,20h
        mov rcx,@@hdlg
        lea rdx,X_start
        lea r8,szTitleName
        mov r9,40h ;MB_ICONINFORMATION+MB_OK
        call MessageBoxA
        add rsp,20h
        sim4_to_RAXbin X_start
mov rax,X_start
Spell64rax @@hdlg, lpdlg1, szRAX

;прочитаем Ystart
        sub rsp,20h
        mov rcx,@@hdlg
        mov rdx,IDC_EDIT12
        lea r8,Y_start
        mov r9,5
        call GetDlgItemTextA
        ;add rsp,20h

        ;sub rsp,20h
        mov rcx,@@hdlg
        lea rdx,Y_start
        lea r8,szTitleName
        mov r9,40h ;MB_ICONINFORMATION+MB_OK
        call MessageBoxA
        add rsp,20h
        sim4_to_RAXbin Y_start
mov rax,Y_start
Spell64rax @@hdlg, lpdlg1, szRAX

;прочитаем Xend
        sub rsp,20h
        mov rcx,@@hdlg
        mov rdx,IDC_EDIT13
        lea r8,X_end
        mov r9,5
        call GetDlgItemTextA
        ;add rsp,20h
        ;sub rsp,20h
        mov rcx,@@hdlg
        lea rdx,X_end
        lea r8,szTitleName
        mov r9,40h ;MB_ICONINFORMATION+MB_OK
        call MessageBoxA
        add rsp,20h
        sim4_to_RAXbin X_end
mov rax,X_end
Spell64rax @@hdlg, lpdlg1, szRAX

;прочитаем Yend
        sub rsp,20h
        mov rcx,@@hdlg
        mov rdx,IDC_EDIT14
        lea r8,Y_end
        mov r9,5
        call GetDlgItemTextA
        ;add rsp,20h
        ;sub rsp,20h
        mov rcx,@@hdlg
        lea rdx,Y_end
        lea r8,szTitleName
        mov r9,40h ;MB_ICONINFORMATION+MB_OK
        call MessageBoxA
        add rsp,20h
        sim4_to_RAXbin Y_end
mov rax,Y_end
Spell64rax @@hdlg, lpdlg1, szRAX

;завершаем диалог
        Call2 EndDialog,@@hdlg,1
        jmp @@exit_true
        
@@idcancel:
        Call2 EndDialog,@@hdlg,0
        jmp @@exit_false

@@exit_false:
;Crashes here <----
;inc nErr1
;mov rax,nErr1
;Spell64rax @@hdlg, lpdlg1, szRAX
	xor rax,rax
	;Assembler puts these instructions automatically:
	;pop rsi
	;pop rdi
	;pop rbx
	;leave
        ret ;<----- Wrong address

@@exit_true:
        mov rax,1
	;Assembler puts these instructions automatically:
	;pop rsi
	;pop rdi
	;pop rbx
	;leave
        ret

DialogProc1 endp
