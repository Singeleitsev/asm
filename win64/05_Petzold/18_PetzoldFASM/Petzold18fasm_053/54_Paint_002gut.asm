wmRectPaint: ;Clear the window

;InvalidateRect(hwnd, NULL, TRUE);
    invoke InvalidateRect, [hwnd], NULL, TRUE

;hdc = BeginPaint(hwnd, &ps);
     invoke BeginPaint, [hwnd], ps
     mov [hdc], rax

;EndPaint(hwnd, &ps);
     invoke EndPaint, [hwnd], ps

;return 0;
xor rax, rax
jmp endRectWndProc