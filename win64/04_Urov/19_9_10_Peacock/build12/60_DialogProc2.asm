;-----------------DialogProc2-----------------------------------------
DialogProc2 proc uses rbx rdi rsi @@hdlg:QWORD, @@message:QWORD, @@wparam:QWORD, @@lparam:QWORD

;Ensure the Stack is Aligned by 10h
        and rsp,-16

;Store retrieved Values:
        mov @@hdlg,rcx
        mov @@message,rdx
        mov @@wparam,r8
        mov @@lparam,r9

        cmp rdx,110h ;WM_INITDIALOG
        je @@wminitdialog
        cmp rdx,111h ;WM_COMMAND
        jne @@exit_false
        cmp r8,IDOK
        je @@idok
        cmp r8,IDCANCEL
        je @@idcancel
        jmp @@exit_false

@@wminitdialog:
        jmp @@exit_true

@@idok:
;прочитаем Xstart UINT GetDlgItemText(
        sub rsp,20h
;HWND hDlg, // handle of dialog box
        mov rcx,@@hdlg
;int nIDDlgItem,  // identifier of control
        mov rdx,IDC_EDIT1
;LPTSTR lpString, // address of buffer for text
        lea r8,X_start
;int nMaxCount    // maximum size of string);
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
Spell64rax @@hdlg, lpdlg2, szRAX

;прочитаем Ystart
        sub rsp,20h
        mov rcx,@@hdlg
        mov rdx,IDC_EDIT2
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
Spell64rax @@hdlg, lpdlg2, szRAX

;прочитаем Xend
        sub rsp,20h
        mov rcx,@@hdlg
        mov rdx,IDC_EDIT3
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
Spell64rax @@hdlg, lpdlg2, szRAX

;прочитаем Yend
        sub rsp,20h
        mov rcx,@@hdlg
        mov rdx,IDC_EDIT4
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
Spell64rax @@hdlg, lpdlg2, szRAX

;завершаем диалог
        Call2 EndDialog,@@hdlg,0
        jmp @@exit_true

@@idcancel:
        Call2 EndDialog,@@hdlg,0
        jmp @@exit_true

@@exit_false:
        xor rax,rax
        ret

@@exit_true:
        mov rax,1
        ret

DialogProc2 endp
