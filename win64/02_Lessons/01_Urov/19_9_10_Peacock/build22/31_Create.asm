wmcreate:
;�������� ���������� �����������, ������������ � ����� ����������

;int GetSystemMetrics(int nIndex) // system metric or configuration setting to retrieve
	Call1 GetSystemMetrics,0 ;SM_CXSCREEN = 0
	mov X_max,rax
	Call1 GetSystemMetrics,1 ;SM_CYSCREEN = 1
	mov Y_max,rax

;�������� �������� ���������� ���� �� ������ @@hdc=GetDC(@@hwnd)
	Call1 GetDC,@@hwnd
	mov @@hdc,rax

;�������� ����������� �������� ���������� ������ 
;memdc=CreateCompatibleDC(@@hdc)
	Call1 CreateCompatibleDC,@@hdc
	mov memdc,rax ;!!! memdc - ���������� ����������

;�������� ���������� ���������� ����������� � ������
;@@hbit=CreateCompatibleBitmap(@@hdc,@@maxX,@@maxY)
	sub rsp,20h
	mov rcx,@@hdc
	mov rdx,X_max
	mov r8,Y_max
	call CreateCompatibleBitmap
	add rsp,20h
	mov @@hbit,rax

;�������� ����� � �������� ������ SelectObject(memdc,@@hbit)
	Call2 SelectObject,memdc,@@hbit

;�������� ��������� ���������� ������ ����� ������

;������� ���������� ����� ����� hbrush=GetStockObject(GRAY_BRUSH)
	Call1 GetStockObject,2 ;GRAY_BRUSH = 2
	mov @@hbrush,rax

;�������� ����� � �������� ������ SelectObject(memdc,@@hbrush)
	Call2 SelectObject,memdc,@@hbrush

;��������� ��������� ������ ����������� ����
;BOOL PatBlt(HDC hdc, // handle to device context
;int nXLeft, // x-coord. of upper-left corner of rect. to be filled
;int nYLeft, // y-coord. of upper-left corner of rect. to be filled
;int nWidth, // width of rectangle to be filled
;int nHeight, // height of rectangle to be filled
;DWORD dwRop) // raster operation code = dest = pattern = PATCOPY
	sub rsp,30h
	mov rcx,memdc
	xor rdx,rdx
	xor r8,r8
	mov r9,X_max
	mov rax,Y_max
	mov qword ptr [rsp+20h],rax
	mov qword ptr [rsp+28h],0F00021h
	call PatBlt
	add rsp,30h

;��������� �������� ���������� ReleaseDC(@@hwnd,@@hdc)
	Call2 ReleaseDC,@@hwnd,@@hdc

;��������� �������� ���� �������� ��������
;BOOL PlaySound(LPCSTR pszSound, HMODULE hmod, DWORD fdwSound)
;SND_SYNC+SND_FILENAME = 0
	Call3 PlaySoundA,offset playFileCreate,0,0 

;���������� �������� 0
	xor rax,rax
	jmp endWndProc
