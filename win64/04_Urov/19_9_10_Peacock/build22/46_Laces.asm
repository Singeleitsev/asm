@@idmlaces:	;"Кружева"

;очистим окно
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти hbrush=GetStockObject(GRAY_BRUSH)
	Call1 GetStockObject,2 ;GRAY_BRUSH = 2
	mov @@hbrush,rax

;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	Call2 SelectObject,memdc,@@hbrush

;заполняем выбранной кистью виртуальное окно
;BOOL PatBlt(HDC hdc, // handle to device context
;int nXLeft, // x-coord. of upper-left corner of rect. to be filled
;int nYLeft,  // y-coord. of upper-left corner of rect. to be filled
;int nWidth,  // width of rectangle to be filled
;int nHeight, // height of rectangle to be filled
;DWORD dwRop)  // raster operation code = dest = pattern = PATCOPY
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

;вычислим DTT=2*Пи/N
	finit
	fldpi
	fidiv i_N
	fimul i2
	fistp DTT
	mov t,0
	mov i,0
;заполняем массивы masX и masY координатами вершин прямоугольника
@@m3:	
	mov rax,i
	add rax,DTT
	mov t,rax
	
	fild t
	fcos
	fimul R
	mov rsi,i
	fistp X_mas[rsi*8]
	add X_mas[rsi*8],X_c

	fild t
	fsin
	fimul R
	fistp Y_mas[rsi*8]
	mov rax,Y_c
	sub rax,Y_mas[rsi*8]
	mov Y_mas[rsi*8],rax

	inc i
	cmp i,N
	jl @@m3
;соединим вершины многоугольника:
	mov i,0
@@m5:
	mov rax,i
	mov j,rax
@@m4:	inc j	
;рисуем отрезок:
	mov rsi,i
	sub rsp,20h
	mov rcx,memdc
	mov rdx,X_mas[rsi*8]
	mov r8,Y_mas[rsi*8]
	xor r9,r9
	call MoveToEx
	;add rsp,20h
	mov rdi,j
	;sub rsp,20h
	mov rcx,memdc
	mov rdx,X_mas[rdi*8]
	mov r8,Y_mas[rdi*8]
	call LineTo
	add rsp,20h
	cmp j,N
	jl @@m4
	inc i
	cmp i,N
	jl @@m5
;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0	

jmp endMenuProc
