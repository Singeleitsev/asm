OPTION DOTNAME
option casemap:none

include temphls.inc
include win64.inc
include kernel32.inc
includelib kernel32.lib
include user32.inc
includelib user32.lib

OPTION PROLOGUE:rbpFramePrologue
OPTION EPILOGUE:rbpFrameEpilogue

.const
wcex label WNDCLASSEX
    cbSize dd sizeof WNDCLASSEX
    style dd 0
    lpfnWndProc dq offset WndProc
    cbClsExtra dd 0
    cbWndExtra dd 0
    hInstance dq 100400000h
    hIcon dq 10003h			;IDI_APPLICATION = 32512
    hCursor dq 10003h			;IDC_ARROW = 32512
    hbrBackground dq 1
    lpszMenuName dq 0
    lpszClassName dq offset lpClassName
    hIconSm dq 10003h			;IDI_APPLICATION = 32512

    lpWindowName db 'MASM 64 SDI Application',0
    lpClassName db 'wcex64',0

.code
WinMain proc <12>;parmarea 12*8 bytes
LOCAL msg:MSG
;Регистрируем класс окна
    lea rcx, wcex
    call RegisterClassEx
;Создаём окно
    mov r10d,80000000h
    invoke CreateWindowEx,0,addr lpClassName,addr lpWindowName,10CF0000h,\
        80000000h,80000000h,80000000h,80000000h,0,0,hInstance,0

;Создаем цикл для обработки сообщений окна
    lea rdi,msg
    .while TRUE
        invoke GetMessage,rdi,0,0,0
        .break .if ~eax
        invoke TranslateMessage,rdi
        invoke DispatchMessage,rdi
    .endw
    invoke ExitProcess,[rdi][MSG.wParam]
WinMain endp

WndProc proc <4> hWnd:QWORD,uMsg:QWORD,wParam:WPARAM,lParam:LPARAM
    .if edx==WM_DESTROY
        invoke PostQuitMessage,NULL
    .else
        leavef
        jmp DefWindowProc
    .endif
    xor eax,eax
    ret
WndProc endp
end

