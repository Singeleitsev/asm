@@idmtextout:
;выведем строку текста в окно
	sub rsp,30h
;BOOL TextOut(HDC hdc, // handle to device context
	mov rcx,memdc
;int nXStart, // x-coordinate of starting position
	mov rdx,0Ah
;int nYStart, // y-coordinate of starting position
	mov r8,96h
;LPCTSTR lpString, // pointer to string
	lea r9,@@TXT_TEXTOUT
;int cbString // number of characters in string);	
	mov qword ptr [rsp+20h],lenTXT_TEXTOUT
	call TextOutA
	add rsp,30h

;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0
	jmp endMenuProc
