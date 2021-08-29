wmSieveTimer:

;Call2 GetWindowLongPtrA,hwnd,0
;mov lpSieveData,rax

;Call1 GetDC, hwnd
;mov hdc, rax
;Call1 CreateSolidBrush, Color
;mov hBrush, rax


;Call2 SelectObject, hdc, hBrush


;Call5 Rectangle, hdc, xLeft, yBottom, xRight, yTop


;Call2 ReleaseDC, hwnd, hdc
;Call1 DeleteObject, hBrush

;return 0;
xor rax, rax
jmp endSieveWndProc

