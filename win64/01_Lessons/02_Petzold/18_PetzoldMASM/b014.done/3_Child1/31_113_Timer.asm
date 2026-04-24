wmChild1Timer:

mov rcx,hwnd
xor rdx,rdx
call GetWindowLongPtrA
mov lpChild1Data,rax

GetX:

;xLeft = rand () % lpChild1Data->cxClient ;
mov rax,lpChild1Data
movsx rcx,word ptr[rax] ;lpChild1Data->cxClient
rdrand rax
xor rdx,rdx
div ecx
mov r8,rdx ;We need Remainder only
and r8,0FFFFh

;xRight = rand () % lpChild1Data->cxClient ;
mov rax,lpChild1Data
movsx rcx,word ptr [rax] ;lpChild1Data->cxClient
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

;yTop = rand () % lpChild1Data->cyClient ;
mov rax,lpChild1Data
movsx rcx, word ptr [rax+8] ;lpChild1Data->cyClient
rdrand rax
xor rdx,rdx
div ecx
mov r8,rdx ;We need Remainder only
and r8,0FFFFh

;yBottom = rand () % lpChild1Data->cyClient ;
mov rax,lpChild1Data
movsx rcx, word ptr [rax+8] ;lpChild1Data->cyClient
rdrand rax
xor rdx,rdx
div ecx
mov r9,rdx ;We need Remainder only
and r9,0FFFFh

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
and rax,0FFFFFFh
mov nRGB,rax

;hdc = GetDC(hwnd);
mov rcx,hwnd
call GetDC
mov hdc,rax

;hBrush = CreateSolidBrush(RGB(nRed, nGreen, nBlue));
mov rcx,nRGB
call CreateSolidBrush
mov hBrush, rax

;SelectObject(hdc, hBrush);
mov rcx,hdc
mov rdx,hBrush
call SelectObject

;Rectangle(hdc, min(xLeft, xRight), min(yTop, yBottom), max(xLeft, xRight), max(yTop, yBottom));
mov rcx,hdc
mov rdx,xLeft
mov r8,yBottom
mov r9,xRight
mov rax,yTop
mov qword ptr[rsp+20h],rax
call Rectangle

;ReleaseDC(hwnd, hdc);
mov rcx,hwnd
mov rdx,hdc
call ReleaseDC

;DeleteObject(hBrush);
mov rcx,hBrush
call DeleteObject

;return 0
xor rax,rax
jmp endChild1WndProc

