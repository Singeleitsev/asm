;mdidemo40175D:
wmHelloCommand:

;switch (wParam)
cmp wParam,IDM_BLACK
        jl @f ;Return 0
cmp wParam,IDM_WHITE
        jg @f ;Return 0

;case IDM_BLACK :
;case IDM_RED :
;case IDM_GREEN :
;case IDM_BLUE :
;case IDM_WHITE :

;// Change the text color

;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
        Call2 GetWindowLongPtr,hwnd,0
        mov lpHelloData,rax
Spell64rax hwnd, szHelloTitle, szGetWindow
        ;cmp lpGlobalData,rax
        ;jne errHelloWndProc

;hMenu = GetMenu (hwndFrame) ;
        Call1 GetMenu,hwndFrameH
        mov hMenu,rax

;CheckMenuItem (hMenu, lpHelloData->iColor, MF_UNCHECKED) ;
        sub rsp,20h
        mov rcx,hMenu
        mov rax,lpHelloData                             
        mov rdx,qword ptr [rax]
        mov r8,0 ;MF_UNCHECKED
        call CheckMenuItem
        add rsp,20h

;lpHelloData->iColor = wParam ;
        mov rax,lpHelloData
        mov r8,wParam
        mov qword ptr [rax],r8
;CheckMenuItem (hMenu, lpHelloData->iColor, MF_CHECKED) ;
        sub rsp,20h
        mov rcx,hMenu
        mov rax,lpHelloData                             
        mov rdx,qword ptr [rax]
        mov r8,8 ;MF_CHECKED
        call CheckMenuItem
        add rsp,20h

;lpHelloData->clrText = clrTextArray[wParam - IDM_BLACK] ;
        mov r8,wParam
        sub r8,IDM_BLACK
        shl r8,3 ;mul r8, 8
        lea rax,clrTextArray
        add rax,r8
        mov rcx,qword ptr [rax]
        mov rax,lpHelloData
        add rax,8 ;lpHelloData->clrText
        mov qword ptr [rax],rcx

;InvalidateRect (hwnd, NULL, FALSE) ;
        Call3 InvalidateRect,hwnd,0,0

@@: ;Return 0
        xor rax,rax
        jmp endHelloWndProc ;mdidemo4019D0

