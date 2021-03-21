@@idmtextout:

;выведем строку текста в окно
;BOOL TextOut(HDC hdc, // handle to device context
;int nXStart, // x-coordinate of starting position
;int nYStart, // y-coordinate of starting position
;LPCTSTR lpString, // pointer to string
;int cbString // number of characters in string);
	sub rsp,30h
	mov rcx,memdc
	mov rdx,0Ah
	mov r8,96h
	lea r9,@@TXT_TEXTOUT
	mov qword ptr [rsp+20h],lenTXT_TEXTOUT
	call TextOutA
	add rsp,30h

;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0

jmp endMenuProc
