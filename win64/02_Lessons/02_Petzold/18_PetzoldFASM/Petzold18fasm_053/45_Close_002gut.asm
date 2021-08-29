wmHelloClose:
    ;if(IDOK != MessageBox(hwnd, "OK to close window?", "Hello", MB_ICONQUESTION | MB_OKCANCEL))
        ;return 0;
    ;break; // I.e., call DefMDIChildProc
 
    invoke MessageBox, [hwnd], szClose, szHelloTitle, MB_ICONQUESTION or MB_OKCANCEL
    cmp rax, IDOK
        je defHelloWndProc ;I.e., call DefMDIChildProc
    xor rax, rax  ;return 0;
    jmp endHelloWndProc


