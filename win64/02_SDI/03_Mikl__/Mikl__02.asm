OPTION DOTNAME
option casemap:none

include D:\bin\dev\mikl__\masm64\Include\temphls.inc
include D:\bin\dev\mikl__\masm64\Include\win64.inc
include D:\bin\dev\mikl__\masm64\Include\kernel32.inc
includelib D:\bin\dev\mikl__\masm64\Lib\kernel32.lib
include D:\bin\dev\mikl__\masm64\Include\user32.inc
includelib D:\bin\dev\mikl__\masm64\Lib\user32.lib

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
    hIcon dq 10003h
    hCursor dq 10003h
    hbrBackground dq COLOR_WINDOW
    lpszMenuName dq 0
    lpszClassName dq offset ClassName
    hIconSm dq 10003h
    ClassName db 'Asm64 window',0
    AppName db 'The window',0

.code
WinMain proc <12> ;parmarea 12*8 bytes
LOCAL msg:MSG
    invoke RegisterClassEx,&wcex ;можно написать по старому addr wcex
    mov r10d,CW_USEDEFAULT
    invoke CreateWindowEx,0,addr ClassName,addr AppName,WS_OVERLAPPEDWINDOW or WS_VISIBLE,\
        dptr CW_USEDEFAULT,dptr CW_USEDEFAULT,dptr CW_USEDEFAULT,dptr CW_USEDEFAULT,\
        0,0,hInstance,0
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

