include D:\bin\dev\ml64\VS2015\include\user32.inc
include D:\bin\dev\ml64\VS2015\include\kernel32.inc
includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib

.data
MsgCaption      db "Iczelion's tutorial #2b",0
fmt db "hInstance = %016Xh",0Ah,"hIcon = %016Xh",0Ah,"hCursor =%016Xh",0
n = $ - fmt + 33
buffer db n dup(?)
x1 dq ?
x2 dq ?
x3 dq ?

.code
WinMain proc
;Выравниваем стек и создаём буфер для процедуры WinMain
sub rsp, 28h
;Получаем дескриптор программы
xor rcx, rcx		;lpModuleName
call GetModuleHandle
;hInstance - дескриптор программы
mov x1, rax
;Загружаем значок
xor rcx, rcx		;Загрузить из числа системных
mov rdx, 32515		;hIcon = IDI_EXCLAMATION = 32515
call LoadIconA
mov x2, rax
;Загружаем курсор
xor rcx, rcx		;Загрузить из числа системных
mov rdx, 32649		;hCursor = IDC_HAND = 32649
call LoadCursorA
mov x3, rax

sub rsp, 10h

	lea rcx, buffer
	lea rdx, fmt
	mov r8, x1
	mov r9, x2
	mov rax, x3
	mov [rsp+20h], eax
	call wsprintf

add rsp, 10h

;Выводим диалог
xor rcx, rcx		;hWnd = HWND_DESKTOP = 0
lea rdx, buffer		;lpText
lea r8, MsgCaption	;lpCaption
mov r9, 40h		;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h
call MessageBoxA

xor rcx, rcx
call ExitProcess
WinMain endp
end