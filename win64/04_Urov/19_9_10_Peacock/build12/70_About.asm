;-----------------AboutDialog-----------------------------------------
AboutDialog proc uses rbx rdi rsi @@hdlg:QWORD, @@message:QWORD, @@wparam:QWORD, @@lparam:QWORD

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
	jmp @@exit_false

@@wminitdialog:
	jmp @@exit_true

@@idok:
	sub rsp,20h
	mov rcx,@@hdlg
	xor rdx,rdx
	call EndDialog
	add rsp,20h
	jmp @@exit_true

@@exit_false:
	xor rax,rax
	ret

@@exit_true:
	mov rax,1
	ret

AboutDialog	endp