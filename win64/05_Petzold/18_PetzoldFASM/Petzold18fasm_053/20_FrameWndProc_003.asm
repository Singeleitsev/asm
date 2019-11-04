;=================================================================================
;LRESULT CALLBACK FrameWndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
;=================================================================================
proc FrameWndProc uses rbx rsi rdi, hwnd:QWORD, iMsg:QWORD, wParam:QWORD, lParam:QWORD
;static HWND hwndClient;
;CLIENTCREATESTRUCT clientcreate;
;HWND hwndChild;
;MDICREATESTRUCT mdicreate;

locals
    hwndChild dq 0
endl

;Align the Stack by 10h
    ;and rsp,-16
;Store Values retrieved by DispatchMessageA
    mov [hwnd], rcx
    mov [iMsg], rdx
    mov [wParam], r8
    mov [lParam], r9

;switch(iMsg)
    cmp rdx, WM_CREATE ;0x0001
        je wmFrameCreate
    cmp rdx, WM_COMMAND ;0x0111
        je wmFrameCommand
    cmp rdx, WM_QUERYENDSESSION
        ;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
        je wmFrameEndSession
    cmp rdx, WM_CLOSE ;0x0010
        je wmFrameClose
    cmp rdx, WM_DESTROY ;0x0002
        je wmFrameDestroy
    jmp defFrameWndProc

include '21_Create_001gut.asm'

include '22_Command_001.asm'

wmFrameEndSession:
    ;jmp wmFrameClose

wmFrameClose: ;Attempt to close all children
    ;SendMessage(hwnd, WM_COMMAND, IDM_CLOSEALL, 0);
    ;if(NULL != GetWindow(hwndClient, GW_CHILD))
        ;return 0;
    ;break; // I.e., call DefFrameProc
        invoke SendMessage, [hwnd], WM_COMMAND, IDM_CLOSEALL, 0
        invoke GetWindow, [hwndClientF], GW_CHILD
        cmp rax, 0
            je defFrameWndProc
        xor rax, rax
        jmp endFrameWndProc

wmFrameDestroy:
        invoke PostQuitMessage, 0
        xor rax, rax
        jmp endFrameWndProc

; Pass unprocessed messages to DefFrameProc(not DefWindowProc)
defFrameWndProc:
    ;return DefFrameProc(hwnd, hwndClient, iMsg, wParam, lParam);
        invoke DefFrameProc, [hwnd], [hwndClientF], [iMsg], [wParam], [lParam]

endFrameWndProc:
    ret
endp ;FrameWndProc