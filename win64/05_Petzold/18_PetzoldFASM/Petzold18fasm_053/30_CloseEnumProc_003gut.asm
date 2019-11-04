;=====================================================
;BOOL CALLBACK CloseEnumProc(HWND hwnd, LPARAM lParam)
;=====================================================
proc CloseEnumProc uses rbx rsi rdi, hwnd:QWORD, lParam:QWORD
    ;mov rcx, [hwndChild] ;Closes all Child Windows
    mov [hwnd], rcx
    ;mov [lParam], r9 ;not used
;Align the Stack by 10h
    ;and rsp,-16

;if(GetWindow(hwnd, GW_OWNER)) // Check for icon title
    ;return 1;
;SendMessage(GetParent(hwnd), WM_MDIRESTORE,(WPARAM) hwnd, 0);
;if(!SendMessage(hwnd, WM_QUERYENDSESSION, 0, 0))
    ;return 1;
;SendMessage(GetParent(hwnd), WM_MDIDESTROY,(WPARAM) hwnd, 0);
;return 1;

    invoke GetWindow, [hwnd], GW_OWNER ;Check for icon title
    cmp rax, 0
        jne finCloseEnumProc

    invoke GetParent, [hwnd]
    invoke SendMessage, rax, WM_MDIRESTORE, [hwnd], 0

    invoke SendMessage, [hwnd], WM_QUERYENDSESSION, 0, 0
    cmp rax, 0
        je finCloseEnumProc

    invoke GetParent, [hwnd]
    invoke SendMessage, rax, WM_MDIDESTROY, [hwnd], 0

finCloseEnumProc:
    mov rax, 1
    ret
endp ;CloseEnumProc
