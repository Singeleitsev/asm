include D:\hob\dev\asm\x64\include\user32.inc
include D:\hob\dev\asm\x64\include\kernel32.inc
includelib D:\hob\dev\asm\x64\lib\user32.lib
includelib D:\hob\dev\asm\x64\lib\kernel32.lib

.data

Caption db 'Message', 0
Text db 'Hello World!', 0

.code

WinMain proc
    sub rsp, 28h

    xor rcx, rcx	;hWnd = HWND_DESKTOP = 0
    lea rdx, Text	;lpText
    lea r8, Caption	;lpCaption
    mov r9, 30h       ;uType = MB_OK + MB_ICONEXCLAMATION = 0 + 30h
    call MessageBoxA

    xor rcx, rcx
    call ExitProcess
WinMain endp
end