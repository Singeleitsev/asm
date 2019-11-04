includelib user32.lib
includelib kernel32.lib

extrn MessageBoxA : proc
extrn ExitProcess : proc

.data

lpCaption db 'Message', 0
lpText db 'Hello World!', 0

.code

main proc frame
    sub rsp, 28h
    .allocstack 28h
    .endprolog

    xor r9, r9        ;uType = MB_OK
    lea r8, lpCaption
    lea rdx, lpText
    xor rcx, rcx      ;hWnd = HWND_DESKTOP
    call MessageBoxA

    xor rcx, rcx
    call ExitProcess
    add rsp, 28h
main endp
end