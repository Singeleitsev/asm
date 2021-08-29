wmRectSize: ;If not minimized, save the window size

    ;if(wParam != SIZE_MINIMIZED)
        cmp [wParam],1
        je defRectWndProc
        ;lpRectData =(LPRECTDATA) GetWindowLong(hwnd, 0);
            invoke GetWindowLongPtrA, [hwnd], 0
            mov [lpRectData], rax
        ;lpRectData->cxClient = LOWORD(lParam);
            mov r9, [lParam]
            and r9,0FFFFh ;LOWORD(lParam)
            mov rax, [lpRectData]
            mov qword [rax], r9 ;Write to Memory
        ;lpRectData->cyClient = HIWORD(lParam);
            mov r9, [lParam]
            shr r9, 16 ;HIWORD(lParam)
            mov rax, [lpRectData]
            add rax, 8
            mov qword [rax], r9 ;Write to Memory

;// WM_SIZE must be processed by DefMDIChildProc
    jmp defRectWndProc ;break; 
