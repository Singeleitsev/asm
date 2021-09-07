;=================================================================================
;LRESULT CALLBACK HelloWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;=================================================================================
proc HelloWndProc uses rbx rsi rdi, hwnd:QWORD, iMsg:QWORD, wParam:QWORD, lParam:QWORD
;static COLORREF clrTextArray[] =
;{ RGB(0, 0, 0), RGB(255, 0, 0), RGB(0, 255, 0), RGB( 0, 0, 255), RGB(255, 255, 255) };
;static HWND hwndClient, hwndFrame;
;HDC hdc;
;HMENU hMenu;
;LPHELLODATA lpHelloData;
;PAINTSTRUCT ps;
;RECT rect;

locals
    hdc dq 0
    hMenu dq 0
    lpHelloData dq 0
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
        je wmHelloCreate
    cmp rdx, WM_COMMAND ;0x0111
        je wmHelloCommand
    cmp rdx, WM_PAINT ;0x000F
        je wmHelloPaint
    cmp rdx, WM_MDIACTIVATE ;0x0222
        je wmHelloActivate
    cmp rdx, WM_QUERYENDSESSION ;0x0011
        ;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
        je wmHelloEndSession
    cmp rdx, WM_CLOSE ;0x0010
        je wmHelloClose
    cmp rdx, WM_DESTROY ;0x0002
        je wmHelloDestroy
    jmp defHelloWndProc

;case WM_CREATE :
    include '41_Create_004.asm'

;case WM_COMMAND :
    include '42_Command_006.asm'

;case WM_PAINT :
    include '43_Paint_006.asm'

;case WM_MDIACTIVATE
    include '44_Activate_004.asm'

;case WM_QUERYENDSESSION :
wmHelloEndSession:
    ;jmp wmHelloClose

;case WM_CLOSE :
    include '45_Close_002gut.asm'

;case WM_DESTROY :
    include '46_Destroy_003.asm'

defHelloWndProc: ;Pass unprocessed message to DefMDIChildProc
    invoke DefMDIChildProc, [hwnd], [iMsg], [wParam], [lParam]

endHelloWndProc: ;return 0;
    ret

endp ;HelloWndProc
