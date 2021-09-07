;================================================================================
;LRESULT CALLBACK RectWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;================================================================================
proc RectWndProc uses rbx rsi rdi, hwnd:QWORD, iMsg:QWORD, wParam:QWORD, lParam:QWORD
    ;static HWND hwndClient, hwndFrame;
    ;HBRUSH hBrush;
    ;HDC hdc;
    ;LPRECTDATA lpRectData;
    ;PAINTSTRUCT ps;
    ;int xLeft, xRight, yTop, yBottom;
    ;short nRed, nGreen, nBlue;

locals
    hBrush dq ?
    hdc dq ?
    lpRectData dq ?
    xLeft dq 0
    xRight dq 50
    yTop dq 50
    yBottom dq 0
    nRGB dq ?
endl

;Align the Stack by 10h
    ;and rsp,-16
;Store Values retrieved by DispatchMessageA:
    mov [hwnd], rcx
    mov [iMsg], rdx
    mov [wParam], r8
    mov [lParam], r9

;switch(iMsg)
    cmp rdx, WM_CREATE ;0x0001
        je wmRectCreate
    cmp rdx, WM_SIZE ;0x0005
        je wmRectSize
    cmp rdx, WM_TIMER ;0x0113
        je wmRectTimer
    cmp rdx, WM_PAINT ;0x000F
        je wmRectPaint
    cmp rdx, WM_MDIACTIVATE ;0x0222
        je wmRectActivate
    cmp rdx, WM_DESTROY ;0x0002
        je wmRectDestroy
    jmp defRectWndProc

;case WM_CREATE :
    include '51_Create_003.asm'

;case WM_SIZE:
    include '52_Size_005.asm'

;case WM_TIMER :
    include '53_Timer_008.asm'

;case WM_PAINT :
    include '54_Paint_002gut.asm'

;case WM_ACTIVATE :
    include '55_Activate_002gut.asm'

;case WM_DESTROY :
    include '56_Destroy_003.asm'

; Pass unprocessed message to DefMDIChildProc
defRectWndProc:
    invoke DefMDIChildProc, [hwnd], [iMsg], [wParam], [lParam]

endRectWndProc: ;return 0;
    ret
endp ;RectWndProc