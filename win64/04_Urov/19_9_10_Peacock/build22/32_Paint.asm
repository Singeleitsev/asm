wmpaint:

;получим контекст устройства
;HDC BeginPaint( HWND hwnd, // handle to window LPPAINTSTRUCT lpPaint
;// pointer to structure for paint information);
	Call2 BeginPaint,@@hwnd,offset ps
	mov @@hdc,rax

;обозначим перерисовку окна звуковым эффектом
;SND_SYNC+SND_FILENAME = 0
	Call3 PlaySoundA,offset playFilePaint,0,0
 
;выведем строку текста в окно BOOL TextOut(
;HDC hdc, // handle to device context
;int nXStart, // x-coordinate of starting position
;int nYStart, // y-coordinate of starting position
;LPCTSTR lpString, // pointer to string
;int cbString // number of characters in string);
	sub rsp,30h
	mov rcx,memdc
	mov rdx,0Ah
	mov r8,12Ch
	lea r9,MesWindow
	mov qword ptr[rsp+20h],MesWindowLen
	call TextOutA
	add rsp,30h

;вывод виртуального окна в реальное окно
;BOOL BitBlt(HDC hdcDest, // handle to destination device context
;int nXDest,  // x-coordinate of destination rectangle's upper-left corner
;int nYDest,  // y-coordinate of destination rectangle's upper-left corner
;int nWidth,  // width of destination rectangle
;int nHeight, // height of destination rectangle
;HDC hdcSrc,  // handle to source device context
;int nXSrc,   // x-coordinate of source rectangle's upper-left corner
;int nYSrc,   // y-coordinate of source rectangle's upper-left corner
;DWORD dwRop)  // raster operation code = dest = source = SRCCOPY
	sub rsp,50h
	mov rcx,@@hdc
	xor rdx,rdx
	xor r8,r8
	mov r9,X_max
	mov rax,Y_max
	mov qword ptr [rsp+20h],rax
	m64m64 qword ptr [rsp+28h],memdc
	mov qword ptr [rsp+30h],0
	mov qword ptr [rsp+38h],0
	mov qword ptr [rsp+40h],0CC0020h
	call BitBlt
	add rsp,50h

;освободить контекст BOOL EndPaint(HWND hWnd, // handle to window 
;CONST PAINTSTRUCT *lpPaint // pointer to structure for paint data);
	sub rsp,20h
	mov rcx,@@hwnd
	lea rdx,ps
	call EndPaint
	add rsp,20h

;возвращаемое значение 0
	xor rax,rax
	jmp endWndProc