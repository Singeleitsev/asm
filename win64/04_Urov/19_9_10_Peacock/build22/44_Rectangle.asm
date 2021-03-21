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

cmp rax,1
jne endMenuProc

;вывод прямоугольника BOOL Rectangle(
;HDC hdc, // handle to device context
;int nLeftRect, // x-coord of bounding rectangle's upper-left corner
;int nTopRect, // y-coord of bounding rectangle's upper-left corner
;int nRightRect, // x-coord of bounding rectangle's lower-right corner
;int nBottomRect); // y-coord of bounding rectangle's lower-right corner
	sub rsp,30h
	mov rcx,memdc
	mov rdx,X_start
	mov rax,rdx
	show_rax
	mov r8,Y_start
	mov rax,r8
	show_rax
	mov r9,X_end
	mov rax,r9
	show_rax
	mov rax,Y_end
	mov qword ptr [rsp+20h],rax
	show_rax
	call Rectangle
	add rsp,30h

;генерация сообщения WM_PAINT для вывода строки на экран
	sub rsp,20h
	mov rcx,@@hwnd
	xor rdx,rdx
	xor r8,r8
	call InvalidateRect
	add rsp,20h

jmp endMenuProc

