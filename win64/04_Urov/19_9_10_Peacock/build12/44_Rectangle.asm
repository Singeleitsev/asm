@@idmrectangle:
;вызываем диалоговое окно
	sub rsp,30h 
	mov rcx,hInst
	lea rdx,lpdlg2
	mov r8,@@hwnd
	lea r9,DialogProc2
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
	add rsp,30h

;вывод прямоугольника BOOL Rectangle(
	sub rsp,30h
;HDC hdc, // handle to device context
	mov rcx,memdc
;int nLeftRect, // x-coord of bounding rectangle's upper-left corner
	mov rdx,X_start
	mov rax,rdx
	show_rax
;int nTopRect, // y-coord of bounding rectangle's upper-left corner
	mov r8,Y_start
	mov rax,r8
	show_rax
;int nRightRect, // x-coord of bounding rectangle's lower-right corner
	mov r9,X_end
	mov rax,r9
	show_rax
;int nBottomRect); // y-coord of bounding rectangle's lower-right corner
	mov rax,Y_end
	mov qword ptr [rsp+20h],rax
	show_rax
	call Rectangle
	add rsp,30h

;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0

	jmp endMenuProc

