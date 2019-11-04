@@idmlength:
;вызываем диалоговое окно int DialogBoxParam(
	sub rsp,30h
;HINSTANCE hInstance, // handle to application instance
	mov rcx,hInst
;LPCTSTR lpTemplateName, // identifies dialog box template
	lea rdx,lpdlg1
;HWND hWndParent, // handle to owner window
	mov r8,@@hwnd
;DLGPROC lpDialogFunc, // pointer to dialog box procedure
	lea r9,DialogProc1
;LPARAM dwInitParam) // initialization value
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
	add rsp,30h

;установить текущую точку BOOL MoveToEx(
	sub rsp,20h
;HDC hdc, // handle to device context
	mov rcx,memdc
;int X, // x-coordinate of new current position
	mov rdx,X_start
;int Y, // y-coordinate of new current position
	mov r8,Y_start
;LPPOINT lpPoint) // pointer to old current position
	xor r9,r9 ;offset pt = 0
	call MoveToEx
	add rsp,20h

;вывод линии BOOL LineTo(
	sub rsp,20h
;HDC hdc, // device context handle
	mov rcx,memdc
;int nXEnd,  // x-coordinate of line's ending point
	mov rdx,X_end
;int nYEnd)   // y-coordinate of line's ending point
	mov r8,Y_end
	call LineTo
	add rsp,20h

;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0

	jmp endMenuProc
