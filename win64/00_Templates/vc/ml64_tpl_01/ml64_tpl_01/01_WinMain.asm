;includelib user32.lib
;includelib kernel32.lib

extrn MessageBoxA : proc
extrn ExitProcess : proc

.data

lpCaption db 'Message', 0
lpText db 'Hello World!', 0

.code

WinMain proc

    sub rsp, 28h
    xor r9, r9        ;uType = MB_OK
    lea r8, lpCaption
    lea rdx, lpText
    xor rcx, rcx      ;hWnd = HWND_DESKTOP
    call MessageBoxA

    xor rcx, rcx
    call ExitProcess
WinMain endp
end