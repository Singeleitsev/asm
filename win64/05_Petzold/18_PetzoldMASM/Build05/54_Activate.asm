;mdidemo401860:
wmHelloActivate:

;// Set the Hello menu if gaining focus
;if (lParam == (LPARAM) hwnd)
        ;SendMessage(hwndClient, WM_MDISETMENU, (WPARAM) hMenuHello,(LPARAM) hMenuHelloWindow);
        ;// Check or uncheck menu item
        ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);

;CheckMenuItem(hMenuHello, lpHelloData->iColor, (lParam ==(LPARAM) hwnd) ? MF_CHECKED : MF_UNCHECKED);

;// Set the Init menu if losing focus
;if(lParam !=(LPARAM) hwnd)
        ;SendMessage(hwndClient, WM_MDISETMENU,(WPARAM) hMenuInit, (LPARAM) hMenuInitWindow);
        ;DrawMenuBar(hwndFrame);

;return 0 ;

mov r9, lParam
cmp r9, hwnd
        jne notHello

;Hello:
        ;WM_MDISETMENU = 0x0230
        Call4 SendMessageA,hwndClientH,230h,hMenuHello,hMenuHelloWindow
        Call2 GetWindowLongPtr,hwnd,0
        mov lpHelloData,rax
        mov rax,qword ptr [rax] ;HelloData.iColor
        Call3 CheckMenuItem,hMenuHello,rax,8 ;MF_CHECKED = 8
        jmp drwHelloMenuAndQuit

notHello:
        Call2 GetWindowLongPtr,hwnd,0
        mov lpHelloData,rax
        mov rax,qword ptr [rax] ;HelloData.iColor
        Call3 CheckMenuItem,hMenuHello,rax,0 ;MF_UNCHECKED = 0
        ;WM_MDISETMENU = 0x0230
        Call4 SendMessageA,hwndClientH,230h,hMenuInit,hMenuInitWindow

drwHelloMenuAndQuit:
        Call1 DrawMenuBar,hwndFrameH
        xor rax,rax
        jmp endHelloWndProc ;mdidemo4019D0


