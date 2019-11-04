;-------------------MenuProc-----------------------------------------------
;обработка сообщений от меню
MenuProc proc uses rbx @@hwnd:QWORD, @@wparam:QWORD, @@hdc:QWORD, @@hbrush:QWORD

;Ensure the Stack is Aligned by 10h
	and rsp,-16

;Store retrieved Values:
	mov @@hwnd,rcx
	mov @@wparam,rdx
	mov @@hdc,r8
	mov @@hbrush,r9

;r8 is the proper place for wParam
	mov r8,rdx

;Select Command
	cmp r8,IDM_DRAWTEXT	
		je @@idmdrawtext
	cmp r8,IDM_TEXTOUT
		je @@idmtextout
	cmp r8,IDM_LENGTH
		je @@idmlength
	cmp r8,IDM_RECTANGLE
		je @@idmrectangle
	cmp r8,IDM_PEACOCK
		je @@idmpeacock
	cmp r8,IDM_LACES
		je @@idmlaces
	cmp r8,IDM_ABOUT
		je @@idmabout
	jmp endMenuProc

@@idmdrawtext:
;получим размер рабочей области BOOL GetClientRect(
;HWND hWnd, // handle to window
;LPRECT lpRect // address of structure for client coordinates);
	Call2 GetClientRect,@@hwnd,offset lpRect

;выведем строку текста в окно int DrawText(
	sub rsp,30h
;HDC hDC, // handle to device context
	mov rcx,memdc
;LPCTSTR lpString, // pointer to string to draw
	lea rdx,@@TXT_DRAWTEXT
;int nCount, // string length, in characters
	mov r8,-1
;LPRECT lpRect, // pointer to struct with formatting dimensions
	lea r9,lpRect
	mov qword ptr [rsp+20h],28h ;DT_SINGLELINE+DT_BOTTOM = 20h+8h
;UINT uFormat // text-drawing flags);
	call DrawTextA
	add rsp,30h

;генерация сообщения WM_PAINT для вывода строки на экран BOOL InvalidateRect(
;HWND hWnd, // handle of window with changed update region
;CONST RECT *lpRect, address of rectangle coordinates
;BOOL bErase) // erase-background flag
	Call3 InvalidateRect,@@hwnd,0,1

	jmp endMenuProc

@@idmtextout:
;выведем строку текста в окно
	sub rsp,30h
;BOOL TextOut(HDC hdc, // handle to device context
	mov rcx,memdc
;int nXStart, // x-coordinate of starting position
	mov rdx,0Ah
;int nYStart, // y-coordinate of starting position
	mov r8,96h
;LPCTSTR lpString, // pointer to string
	lea r9,@@TXT_TEXTOUT
;int cbString // number of characters in string);	
	mov qword ptr [rsp+20h],lenTXT_TEXTOUT
	call TextOutA
	add rsp,30h

;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0
	jmp endMenuProc

@@idmlength:
;вызываем диалоговое окно int DialogBoxParam(HINSTANCE
	sub rsp,30h
;hInstance, // handle to application instance
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

@@idmrectangle:
;вызываем диалоговое окно
	sub rsp,30h 
	mov rcx,hInst
	lea rdx,lpdlg2
	mov r8,@@hwnd
	lea r9,DialogProc2
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
	add rsp,30h

;вывод прямоугольника BOOL Rectangle(
	sub rsp,30h
;HDC hdc, // handle to device context
	mov rcx,memdc
;int nLeftRect, // x-coord of bounding rectangle's upper-left corner
	mov rdx,X_start
	mov rax,rdx
	show_rax
;int nTopRect, // y-coord of bounding rectangle's upper-left corner
	mov r8,Y_start
	mov rax,r8
	show_rax
;int nRightRect, // x-coord of bounding rectangle's lower-right corner
	mov r9,X_end
	mov rax,r9
	show_rax
;int nBottomRect); // y-coord of bounding rectangle's lower-right corner
	mov rax,Y_end
	mov qword ptr [rsp+20h],rax
	show_rax
	call Rectangle
	add rsp,30h

;генерация сообщения WM_PAINT для вывода строки на экран
	Call3 InvalidateRect,@@hwnd,0,0

	jmp endMenuProc

@@idmpeacock:	;"Павлин"
;очистим окно
;выполним первичное заполнение растра серым цветом
;получим дескриптор серой кисти hbrush=GetStockObject(GRAY_BRUSH)
	Call1 GetStockObject,2 ;GRAY_BRUSH = 2
	mov @@hbrush,rax

;выбираем кисть в контекст памяти SelectObject(memdc,@@hbrush)
	Call2 SelectObject,memdc,@@hbrush

;заполняем выбранной кистью виртуальное окно BOOL PatBlt(
	sub rsp,30h
;HDC hdc, // handle to device context
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

@@idmlaces:	;"Кружева"
;очистим окно
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
;int nYLeft,  // y-coord. of upper-left corner of rect. to be filled
	xor r8,r8
;int nWidth,  // width of rectangle to be filled
	mov r9,X_max
;int nHeight, // height of rectangle to be filled
	mov rax,Y_max
	mov qword ptr [rsp+20h],rax
;DWORD dwRop)  // raster operation code = dest = pattern = PATCOPY
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

@@idmabout:
;вызываем диалоговое окно 
	sub rsp,30h
	mov rcx,hInst
	lea rdx,lpdlg3
	mov r8,@@hwnd
	lea r9,AboutDialog
	mov qword ptr [rsp+20h],0
	call DialogBoxParamA
	add rsp,30h
	;jmp endMenuProc
;... ... ...

endMenuProc:
	mov	eax,0
	ret

@@TXT_TEXTOUT	db	'Текст выведен функцией TEXTOUT'
lenTXT_TEXTOUT=$-@@TXT_TEXTOUT	
@@TXT_DRAWTEXT	db	'Текст выведен функцией DRAWTEXT',0

MenuProc	endp
