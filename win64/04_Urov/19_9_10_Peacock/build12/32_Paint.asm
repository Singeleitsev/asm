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
	sub rsp,30h
;HDC hdc, // handle to device context
	mov rcx,memdc
;int nXStart, // x-coordinate of starting position
	mov rdx,0Ah
;int nYStart, // y-coordinate of starting position
	mov r8,12Ch
;LPCTSTR lpString, // pointer to string
	lea r9,MesWindow
;int cbString // number of characters in string);	
	mov qword ptr[rsp+20h],MesWindowLen
	call TextOutA
	add rsp,30h

;вывод виртуального окна в реальное окно
	sub rsp,50h
;BOOL BitBlt(HDC hdcDest, // handle to destination device context
	mov rcx,@@hdc
;int nXDest,  // x-coordinate of destination rectangle's upper-left corner
	xor rdx,rdx
;int nYDest,  // y-coordinate of destination rectangle's upper-left corner
	xor r8,r8
;int nWidth,  // width of destination rectangle
	mov r9,X_max
;int nHeight, // height of destination rectangle
	mov rax,Y_max
	mov qword ptr [rsp+20h],rax
;HDC hdcSrc,  // handle to source device context
	m64m64 qword ptr [rsp+28h],memdc
;int nXSrc,   // x-coordinate of source rectangle's upper-left corner
	mov qword ptr [rsp+30h],0
;int nYSrc,   // y-coordinate of source rectangle's upper-left corner
	mov qword ptr [rsp+38h],0
;DWORD dwRop)  // raster operation code = dest = source = SRCCOPY
	mov qword ptr [rsp+40h],0CC0020h
	call BitBlt
	add rsp,50h

;освободить контекст BOOL EndPaint(HWND hWnd, // handle to window 
;CONST PAINTSTRUCT *lpPaint // pointer to structure for paint data);
	Call2 EndPaint,@@hwnd,offset ps

;возвращаемое значение 0
	xor rax,rax
	jmp endWndProc