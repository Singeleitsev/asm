wmRectTimer:

Call2 GetWindowLongPtrA,hwnd,0
mov lpRectData,rax

GetX:
;xLeft = rand () % lpRectData->cxClient ;
	mov rax,lpRectData
	movsx rcx,word ptr [rax] ;lpRectData->cxClient
	rdrand rax
	xor rdx,rdx
	div ecx
	mov r8,rdx ;We need Remainder only
	and r8,0FFFFh
;xRight = rand () % lpRectData->cxClient ;
	mov rax,lpRectData
	movsx rcx,word ptr [rax] ;lpRectData->cxClient
	rdrand rax
	xor rdx,rdx
	div ecx
	mov r9,rdx ;We need Remainder only
	and r9,0FFFFh
;min(xLeft, xRight)
	cmp r8,r9
	jl SetLeftRight
	jg SetRightLeft
	jmp GetX ;They can't be equal

SetLeftRight:
	mov xLeft,r8
	mov xRight,r9
	jmp GetY
SetRightLeft:
	mov xRight,r8
	mov xLeft,r9

GetY:
;yTop = rand () % lpRectData->cyClient ;
	mov rax,lpRectData
	movsx rcx, word ptr [rax+8] ;lpRectData->cyClient
	rdrand rax
	xor rdx,rdx
	div ecx
	mov r8,rdx ;We need Remainder only
	and r8, 0FFFFh
;yBottom = rand () % lpRectData->cyClient ;
	mov rax,lpRectData
	movsx rcx, word ptr [rax+8] ;lpRectData->cyClient
	rdrand rax
	xor rdx,rdx
	div ecx
	mov r9,rdx ;We need Remainder only
	and r9, 0FFFFh
;min(yTop, yBottom)
	cmp r8,r9
	jg SetTopBottom
	jl SetBottomTop
	jmp GetY ;They can't be equal

SetTopBottom:
	mov yTop,r8
	mov yBottom,r9
	jmp GetColor
SetBottomTop:
	mov yBottom,r8
	mov yTop,r9

GetColor:
;nRed = rand() & 255;
;nGreen = rand() & 255;
;nBlue = rand() & 255;
	rdrand rax
	and rax, 0FFFFFFh
	mov nRGB, rax

;hdc = GetDC(hwnd);
	Call1 GetDC, hwnd
	mov hdc, rax

;hBrush = CreateSolidBrush(RGB(nRed, nGreen, nBlue));
	Call1 CreateSolidBrush, nRGB
	mov hBrush, rax

;SelectObject(hdc, hBrush);
	Call2 SelectObject, hdc, hBrush

;Rectangle(hdc, min(xLeft, xRight), min(yTop, yBottom), max(xLeft, xRight), max(yTop, yBottom));
	Call5 Rectangle, hdc, xLeft, yBottom, xRight, yTop

;ReleaseDC(hwnd, hdc);
	Call2 ReleaseDC, hwnd, hdc

;DeleteObject(hBrush);
	Call1 DeleteObject, hBrush

;return 0;
	xor rax, rax
	jmp endRectWndProc

