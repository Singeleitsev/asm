wmRectDestroy:

    ;lpRectData =(LPRECTDATA) GetWindowLong(hwnd, 0);
        invoke GetWindowLongPtrA, [hwnd], 0
        mov [lpRectData], rax

    ;HeapFree(GetProcessHeap(), 0, lpRectData);
        invoke GetProcessHeap
        invoke HeapFree, rax, 0, [lpRectData]

    ;KillTimer(hwnd, 1);
        invoke KillTimer, [hwnd], 1

;return 0;
xor rax, rax
jmp endRectWndProc