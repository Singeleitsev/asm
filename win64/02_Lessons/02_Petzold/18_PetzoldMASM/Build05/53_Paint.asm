;mdidemo4017F5:
wmHelloPaint:

;hdc = BeginPaint (hwnd, &ps) ;
        sub rsp,20h
        mov rcx,hwnd
        lea rdx,ps
        call BeginPaint
        mov hdc,rax
        add rsp,20h

;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
        Call2 GetWindowLongPtr,hwnd,0 ;<-- GetWindowLong crashed here
        mov lpHelloData,rax
Spell64rax hwnd, szFrameTitle, szGetWindow
        ;cmp rax,lpGlobalData
        ;jne errHelloWndProc

;SetTextColor (hdc, lpHelloData->clrText) ;
        sub rsp,20h
        mov rcx,hdc
        mov rax,lpHelloData
        mov rdx,qword ptr [rax+8] ;lpHelloData.clrText
        call SetTextColor
        add rsp,20h

;GetClientRect (hwnd, &rect) ;
        sub rsp,20h
        mov rcx,hwnd
        lea rdx,rect
        call GetClientRect
        add rsp,20h

;DrawText (hdc, "Hello, World!", -1, &rect, DT_SINGLELINE | DT_CENTER | DT_VCENTER) ;
        sub rsp,20h
        mov rcx,hdc
        lea rdx,szHelloTitle
        mov r8,-1
        lea r9,rect
        mov qword ptr [rsp+20h],25h ;DT_SINGLELINE + DT_CENTER + DT_VCENTER = 25h
        call DrawText
        add rsp,20h

;EndPaint (hwnd, &ps) ;
        sub rsp,20h
        mov rcx,hwnd
        lea rdx,ps
        call EndPaint
        add rsp,20h

;return 0 ;
        xor rax,rax
        jmp endHelloWndProc ;mdidemo4019D0

