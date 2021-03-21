@@idmlength:

;вызываем диалоговое окно int DialogBoxParam(
;HINSTANCE hInstance, // handle to application instance
;LPCTSTR lpTemplateName, // identifies dialog box template
;HWND hWndParent, // handle to owner window
;DLGPROC lpDialogFunc, // pointer to dialog box procedure
;LPARAM dwInitParam) // initialization value
	sub rsp,30h
	mov rcx,hInst
	lea rdx,lpdlg1
	mov r8,@@hwnd
	lea r9,DialogProc1
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
	add rsp,30h

cmp rax,1
jne endMenuProc

;установить текущую точку BOOL MoveToEx(
;HDC hdc, // handle to device context
;int X, // x-coordinate of new current position
;int Y, // y-coordinate of new current position
;LPPOINT lpPoint) // pointer to old current position
	sub rsp,20h
	mov rcx,memdc
	mov rdx,X_start
	mov r8,Y_start
	xor r9,r9 ;offset pt = 0
	call MoveToEx
	;add rsp,20h

;вывод линии BOOL LineTo(
;HDC hdc, // device context handle
;int nXEnd,  // x-coordinate of line's ending point
;int nYEnd)   // y-coordinate of line's ending point
	;sub rsp,20h
	mov rcx,memdc
	mov rdx,X_end
	mov r8,Y_end
	call LineTo
	;add rsp,20h

;генерация сообщения WM_PAINT для вывода строки на экран
	;sub rsp,20h
	mov rcx,@@hwnd
	xor rdx,rdx
	xor r8,r8
	call InvalidateRect
	add rsp,20h

jmp endMenuProc
