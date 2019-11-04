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
