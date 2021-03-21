@@idmpeacock:	;"Павлин"

;очистим окно
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти hbrush=GetStockObject(GRAY_BRUSH)
	Call1 GetStockObject,2 ;GRAY_BRUSH = 2
	mov @@hbrush,rax

;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	Call2 SelectObject,memdc,@@hbrush

;заполняем выбранной кистью виртуальное окно BOOL PatBlt(
;HDC hdc, // handle to device context
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
	
;готовим цикл
	mov rcx,icycl
	push rcx
@@m1:
	finit
;вычислим x2=120+100*sin(x1/30)
	pop rcx
	mov x1,rcx
	cmp rcx,0	
	je @@m2
	dec rcx
	push rcx
	fild x1
	fidiv i30
	fsin
	fimul i100
	fiadd i120
	fistp x2
;вычислим y2=120+100*cos(x1/30)
	fild x1
	fidiv i30
	fcos
	fimul i100
	fiadd i90
	fistp y2
;рисуем отрезок:
	sub rsp,20h
	mov rcx,memdc
	mov rdx,x1
	mov r8,icenter
	xor r9,r9
	call MoveToEx
	;add rsp,20h
	;sub rsp,20h
	mov rcx,memdc
	mov rdx,x2
	mov r8,y2
	call LineTo
	add rsp,20h
;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0
	jmp	@@m1
@@m2:	
	jmp endMenuProc
