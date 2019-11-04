wmHelloPaint:
; Paint the window

;hdc = BeginPaint(hwnd, &ps);
    invoke BeginPaint, [hwnd], ps
    mov [hdc], rax

;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
    invoke GetWindowLongPtrA, [hwnd], 0
    mov [lpHelloData], rax

;SetTextColor(hdc, lpHelloData->clrText);
    mov rax, [lpHelloData]
    add rax, 8
    mov rdx, qword [rax]
    invoke SetTextColor, [hdc], rdx

;GetClientRect(hwnd, &rect);
    invoke GetClientRect, [hwnd], rect

;DrawText(hdc, "Hello, World!", -1, &rect, DT_SINGLELINE | DT_CENTER | DT_VCENTER);
    invoke DrawText, [hdc], szHello, -1, rect, DT_SINGLELINE or DT_CENTER or DT_VCENTER

;EndPaint(hwnd, &ps);
    invoke EndPaint, [hwnd], ps

;return 0;
xor rax, rax
jmp endHelloWndProc

