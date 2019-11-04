        wmHelloCommand:

;switch (wParam)
cmp r8,IDM_BLACK
        jl @f ;Return 0
cmp r8,IDM_WHITE
        jg @f ;Return 0

;case IDM_BLACK :
;case IDM_RED :
;case IDM_GREEN :
;case IDM_BLUE :
;case IDM_WHITE :

;// Change the text color

;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
    invoke GetWindowLongPtrA, [hwnd], 0
    mov [lpHelloData], rax

;hMenu = GetMenu (hwndFrame) ;
    invoke GetMenu, [hwndFrameH]
    mov [hMenu], rax

;CheckMenuItem (hMenu, lpHelloData->iColor, MF_UNCHECKED) ;
    mov rax, [lpHelloData]
    mov rdx, qword [rax]
    ;MF_UNCHECKED = 0
    invoke CheckMenuItem, [hMenu], rdx, 0

;lpHelloData->iColor = wParam ;
    mov rax, [lpHelloData]
    mov r8, [wParam]
    mov qword [rax], r8
;CheckMenuItem (hMenu, lpHelloData->iColor, MF_CHECKED) ;
    mov rax, [lpHelloData]
    mov rdx, qword [rax]
    ;MF_CHECKED = 8
    invoke CheckMenuItem, [hMenu], rdx, 8

;lpHelloData->clrText = clrTextArray[wParam - IDM_BLACK] ;
    mov r8, [wParam]
    sub r8, IDM_BLACK
    shl r8, 3 ;mul r8, 8
    lea rax, [clrTextArray]
    add rax, r8
    mov rcx, qword [rax]
    mov rax, [lpHelloData]
    add rax, 8 ;lpHelloData->clrText
    mov qword [rax], rcx ;Write to memory

;InvalidateRect (hwnd, NULL, FALSE) ;
    invoke InvalidateRect, [hwnd], 0, 0

;Return 0
@@:
    xor rax, rax
    jmp endHelloWndProc ;mdidemo4019D0