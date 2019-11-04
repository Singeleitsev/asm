@@idmabout:
;вызываем диалоговое окно 
	sub rsp,30h
	mov rcx,hInst
	lea rdx,lpdlg3
	mov r8,@@hwnd
	lea r9,AboutDialog
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
	add rsp,30h
	;jmp endMenuProc

