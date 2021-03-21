@@idmdrawtext:

;получим размер рабочей области BOOL GetClientRect(
;HWND hWnd, // handle to window
;LPRECT lpRect // address of structure for client coordinates);
	Call2 GetClientRect,@@hwnd,offset lpRect

;выведем строку текста в окно int DrawText(
;HDC hDC, // handle to device context
;LPCTSTR lpString, // pointer to string to draw
;int nCount, // string length, in characters
;LPRECT lpRect, // pointer to struct with formatting dimensions
;UINT uFormat // text-drawing flags);
	sub rsp,30h
	mov rcx,memdc
	lea rdx,@@TXT_DRAWTEXT
	mov r8,-1
	lea r9,lpRect
	mov qword ptr [rsp+20h],28h ;DT_SINGLELINE+DT_BOTTOM = 20h+8h
	call DrawTextA
	add rsp,30h

;генерация сообщения WM_PAINT для вывода строки на экран BOOL InvalidateRect(
;HWND hWnd, // handle of window with changed update region
;CONST RECT *lpRect, address of rectangle coordinates
;BOOL bErase) // erase-background flag
	Call3 InvalidateRect,@@hwnd,0,1

jmp endMenuProc
