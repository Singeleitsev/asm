wmHelloActivate:
    ; Set the Hello menu if gaining focus
        ;if(lParam ==(LPARAM) hwnd)
            ;SendMessage(hwndClient, WM_MDISETMENU, (WPARAM) hMenuHello,(LPARAM) hMenuHelloWindow);
    ; Check or uncheck menu item
        ;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
        ;CheckMenuItem(hMenuHello, lpHelloData->iColor, (lParam ==(LPARAM) hwnd) ? MF_CHECKED : MF_UNCHECKED);
    ; Set the Init menu if losing focus
        ;if(lParam !=(LPARAM) hwnd)
            ;SendMessage(hwndClient, WM_MDISETMENU,(WPARAM) hMenuInit, (LPARAM) hMenuInitWindow);
        ;DrawMenuBar(hwndFrame);

;mov rcx, [hwnd]
;mov r9, [lParam]
cmp r9, rcx
    jne notHello

;Hello:
    invoke SendMessage, [hwndClientH], WM_MDISETMENU, [hMenuHello], [hMenuHelloWindow]
    invoke GetWindowLongPtrA, [hwnd], 0
    mov [lpHelloData], rax
    mov rdx, qword [rax]
    invoke CheckMenuItem, [hMenuHello], rdx, MF_CHECKED
    jmp @f

notHello:
    invoke GetWindowLongPtrA, [hwnd], 0
    mov [lpHelloData], rax
    mov rdx, qword [rax]
    invoke CheckMenuItem, [hMenuHello], rdx, MF_UNCHECKED
    invoke SendMessage, [hwndClientH], WM_MDISETMENU, [hMenuInit], [hMenuInitWindow]

;return 0;
@@:
    invoke DrawMenuBar, [hwndFrameH]
    xor rax, rax
    jmp endHelloWndProc