;-------------------WindowProc-----------------------------------------------
WindowProc proc uses rbx rdi rsi @@hwnd:QWORD, @@mes:QWORD, @@wparam:QWORD, @@lparam:QWORD
	local @@hdc:QWORD,@@hbrush:QWORD,@@hbit:QWORD

;Ensure the Stack is Aligned by 10h
	and rsp,-16

;Store Values retrieved by DispatchMessageA:
	mov @@hwnd,rcx
	mov @@mes,rdx
	mov @@wparam,r8
	mov @@lparam,r9

	cmp rdx,0Fh ;WM_PAINT
		je wmpaint
	cmp rdx,111h ;WM_COMMAND
		je wmcommand
	cmp rdx,1 ;WM_CREATE
		je wmcreate	
	cmp rdx,2 ;WM_DESTROY
		je wmdestroy
	jmp default

wmcreate:
;создание растрового изображения, совместимого с окном приложения

;int GetSystemMetrics(int nIndex) // system metric or configuration setting to retrieve
	Call1 GetSystemMetrics,0 ;SM_CXSCREEN = 0
	mov X_max,rax
	Call1 GetSystemMetrics,1 ;SM_CYSCREEN = 1
	mov Y_max,rax

;получить контекст устройства окна на экране @@hdc=GetDC(@@hwnd)
	Call1 GetDC,@@hwnd
	mov @@hdc,rax

;получить совместимый контекст устройства памяти 
;memdc=CreateCompatibleDC(@@hdc)
	Call1 CreateCompatibleDC,@@hdc
	mov memdc,rax ;!!! memdc - глобальная переменная

;получить дескриптор растрового изображения в памяти
;@@hbit=CreateCompatibleBitmap(@@hdc,@@maxX,@@maxY)
	sub rsp,20h
	mov rcx,@@hdc
	mov rdx,X_max
	mov r8,Y_max
	call CreateCompatibleBitmap
	add rsp,20h
	mov @@hbit,rax

;выбираем растр в контекст памяти SelectObject(memdc,@@hbit)
	Call2 SelectObject,memdc,@@hbit

;выполним первичное заполнение растра серым цветом

;получим дескриптор серой кисти hbrush=GetStockObject(GRAY_BRUSH)
	Call1 GetStockObject,2 ;GRAY_BRUSH = 2
	mov @@hbrush,rax

;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	Call2 SelectObject,memdc,@@hbrush

;заполняем выбранной кистью виртуальное окно
	sub rsp,30h
;BOOL PatBlt(HDC hdc, // handle to device context
	mov rcx,memdc
;int nXLeft, // x-coord. of upper-left corner of rect. to be filled
	xor rdx,rdx
;int nYLeft, // y-coord. of upper-left corner of rect. to be filled
	xor r8,r8
;int nWidth, // width of rectangle to be filled
	mov r9,X_max
;int nHeight, // height of rectangle to be filled
	mov rax,Y_max
	mov qword ptr [rsp+20h],rax
;DWORD dwRop) // raster operation code = dest = pattern = PATCOPY
	mov qword ptr [rsp+28h],0F00021h
	call PatBlt
	add rsp,30h

;освободим контекст устройства ReleaseDC(@@hwnd,@@hdc)
	Call2 ReleaseDC,@@hwnd,@@hdc

;обозначим создание окна звуковым эффектом
;BOOL PlaySound(LPCSTR pszSound, HMODULE hmod, DWORD fdwSound)
;SND_SYNC+SND_FILENAME = 0
	Call3 PlaySoundA,offset playFileCreate,0,0 

;возвращаем значение 0
	xor rax,rax
	jmp endWndProc

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

wmdestroy:
;удалить виртуальное окно DeleteDC(memdc)
	Call1 DeleteDC,memdc

;обозначим завершение работы приложения звуковым эффектом
;SND_SYNC+SND_FILENAME = 0
	Call3 PlaySoundA,offset playFileDestroy,0,0 

;послать сообщение WM_QUIT
;готовим вызов VOID PostQuitMessage(int nExitCode) // exit code
	Call1 PostQuitMessage,0

;возвращаемое значение 0
	xor rax,rax
	jmp endWndProc

wmcommand:
;вызов процедуры обработки сообщений от меню
;MenuProc (DWORD @@hwnd, DWORD @@wparam)
	Call4 MenuProc,@@hwnd,@@wparam,@@hdc,@@hbrush
	jmp endWndProc

default:
;обработка по умолчанию
	Call4 DefWindowProc,@@hwnd,@@mes,@@wparam,@@lparam
	;jmp endWndProc
;... ... ...

endWndProc:
	ret

WindowProc endp
