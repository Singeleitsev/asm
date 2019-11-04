wmRectTimer: ;Display a random rectangle

;lpRectData =(LPRECTDATA) GetWindowLong(hwnd, 0);
    invoke GetWindowLongPtrA, [hwnd], 0
    mov [lpRectData], rax

   ;mov [xLeft], 1
   ;mov [xRight], 049Eh
   ;mov [yTop], 1
   ;mov [yBottom], 01B6h

GetX:
;xLeft = rand () % lpRectData->cxClient ;
    mov rax, [lpRectData]
    movsx rcx, word [rax] ;lpRectData->cxClient
    rdrand rax
    xor rdx, rdx ;cdq
    div ecx
    mov r8, rdx ;We need Remainder only
;xRight = rand () % lpRectData->cxClient ;
    mov rax, [lpRectData]
    movsx rcx, word [rax] ;lpRectData->cxClient
    rdrand rax
    xor rdx, rdx ;cdq
    div ecx
    mov r9, rdx ;We need Remainder only

;min(xLeft, xRight)
    cmp r8, r9
    jl SetLeftRight
    jg SetRightLeft
    jmp GetX ;They can't be equal

SetLeftRight:
    and r8, 0FFFFh
    mov [xLeft], r8
    and r9, 0FFFFh
    mov [xRight], r9
    jmp GetY
SetRightLeft:
    and r8, 0FFFFh
    mov [xRight], r8
    and r9, 0FFFFh
    mov [xLeft], r9

GetY:
;yTop = rand () % lpRectData->cyClient ;
    mov rax, [lpRectData]
    movsx rcx, word [rax+8] ;lpRectData->cyClient
    rdrand rax
    xor rdx, rdx ;cdq
    div ecx
    mov r8, rdx ;We need Remainder only
;yBottom = rand () % lpRectData->cyClient ;
    mov rax, [lpRectData]
    movsx rcx, word [rax+8] ;lpRectData->cyClient
    rdrand rax
    xor rdx,rdx ;cdq
    div ecx
    mov r9, rdx ;We need Remainder only

;min(yTop, yBottom)
    cmp r8, r9
    jg SetTopBottom
    jl SetBottomTop
    jmp GetY ;They can't be equal

SetTopBottom:
    and r8, 0FFFFh
    mov [yTop], r8
    and r9, 0FFFFh
    mov [yBottom], r9
    jmp GetColor
SetBottomTop:
    and r8, 0FFFFh
    mov [yBottom], r8
    and r9, 0FFFFh
    mov [yTop], r9

GetColor:
;nRed = rand() & 255;
;nGreen = rand() & 255;
;nBlue = rand() & 255;
    rdrand rax
    and rax, 0FFFFFFh
    mov [nRGB], rax

;hdc = GetDC(hwnd);
    invoke GetDC, [hwnd]
    mov [hdc], rax

;hBrush = CreateSolidBrush(RGB(nRed, nGreen, nBlue));
    invoke CreateSolidBrush, [nRGB]
    mov [hBrush], rax

;SelectObject(hdc, hBrush);
    invoke SelectObject, [hdc], [hBrush]

;Rectangle(hdc, min(xLeft, xRight), min(yTop, yBottom), max(xLeft, xRight), max(yTop, yBottom));
    invoke Rectangle, [hdc], [xLeft], [yBottom], [xRight], [yTop]

;ReleaseDC(hwnd, hdc);
    invoke ReleaseDC, [hwnd], [hdc]

;DeleteObject(hBrush);
    invoke DeleteObject, [hBrush]

;return 0;
xor rax, rax
jmp endRectWndProc
