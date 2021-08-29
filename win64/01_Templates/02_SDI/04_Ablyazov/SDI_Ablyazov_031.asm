include D:\bin\dev\ml64\VS2015\include\user32.inc
include D:\bin\dev\ml64\VS2015\include\kernel32.inc
includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
 
include D:\hob\dev\asm\x64\002_SDI\04_Ablyazov\Include\struct64_12.inc
 
.const
szTitleName db "64-bit SDI Application assembled with MASM",0
szClassName db "clsSDI64",0
button_class db "BUTTON",0
AboutTitle db "О программе",0
AboutText db "Источник: Руслан Аблязов, 2011, параграф 5.2.3 «GUI-приложения»",0
ExitTitle db "Выход",0

lbuttonup_msg db "Hello World!",0

err_caption db "Ошибка!",0
err_handle_msg db "Ошибка получения дескриптора",0
err_loop_msg db "GetMessage возвратил код ошибки (-1)",0

.data
hInst dq ?
main_hwnd dq ?	
AboutBtnHandle dq ?
ExitBtnHandle dq ?

hInst_fmt db "Дескриптор программы: %016Xh",0
hInst_n = $ - hInst_fmt + 11
hInst_msg db hInst_n dup (?)
hWnd_fmt db "Дескриптор главного окна: %016Xh",0
hWnd_n = $ - hWnd_fmt + 11
hWnd_msg db hWnd_n dup (?)
hAbout_fmt db "Регистр rax: %016Xh",0Ah, "AboutBtnHandle: %016Xh",0
hAbout_n = $ - hAbout_fmt + 22
hAbout_msg db hAbout_n dup (?)
hExit_fmt db "Регистр rax: %016Xh",0Ah, "ExitBtnHandle: %016Xh",0
hExit_n = $ - hExit_fmt + 22
hExit_msg db hExit_n dup (?)
compare_fmt db "Регистр r8: %016Xh",0Ah,  "Регистр r9: %016Xh",0Ah, "AboutBtnHandle: %016Xh",0Ah, "ExitBtnHandle: %016Xh",0Ah, 0
compare_n = $ - compare_fmt + 44
compare_msg db compare_n dup (?)

.code
WinMain proc
LOCAL wc:WNDCLASSEX64
LOCAL msg:MSG64

;Выравниваем стек и создаём буфер для процедуры WinMain
sub rsp, 68h	;8 байт выравнивание плюс 60h буфер для 12 параметров

;Получаем дескриптор программы
xor rcx, rcx
call GetModuleHandleA
;hInst - дескриптор программы
mov hInst, rax

  cmp rax, 0
  je err_handle
  ;Форматируем строку
  lea rcx, hInst_msg	;lpOut
  lea rdx, hInst_fmt	;lpFmt
  mov r8, rax		;arg_1
  xor r9, r9		;arg_n
  call wsprintf
  ;Выводим сообщение
  xor rcx, rcx		;hWnd
  lea rdx, hInst_msg	;lpText
  lea r8, szTitleName	;lpCaption
  mov r9, 40h		;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h = 40h
  call MessageBoxA

;Задаём значения переменных структуры для главного окна
mov eax, dword ptr sizeof WNDCLASSEX64
mov wc.cbSize, eax
mov wc.style, 4003h		;CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
lea rbx, WndProc
mov wc.lpfnWndProc, rbx
mov wc.cbClsExtra, 0
mov wc.cbWndExtra, 0
mov rax, hInst
mov wc.hInstance, rax
;Загружаем пиктограмму
xor rcx, rcx			;Загрузить из числа системных
mov rdx, 32515			;hIcon = IDI_APPLICATION = 32512
call LoadIconA
mov wc.hIcon, rax
;Загружаем курсор
xor rcx, rcx			;Загрузить из числа системных
mov rdx, 32649			;hCursor = IDC_ARROW = 32512
call LoadCursorA
mov wc.hCursor, rax
;Продолжаем заполнять структуру
mov wc.hbrBackground, 2		;COLOR_BACKGROUND+1
mov wc.lpszMenuName, 0
lea rbx, szClassName
mov wc.lpszClassName, rbx
mov wc.hIconSm, 0
;Регистрируем класс окна
lea rcx, wc
call RegisterClassEx

;Создаём главное окно
xor rcx, rcx			;dwExStyle
lea rdx, szClassName
lea r8, szTitleName
mov r9, 00CF0000h		;dwStyle = WS_OVERLAPPEDWINDOW = 00CF.0000h
mov qword ptr [rsp+20h], 50	;x
mov qword ptr [rsp+28h], 50	;y
mov qword ptr [rsp+30h], 300	;nWidth
mov qword ptr [rsp+38h], 250	;nHeight
mov qword ptr [rsp+40h], 0	;hWndParent
mov qword ptr [rsp+48h], 0	;hMenu
mov rbx, hInst
mov qword ptr [rsp+50h], rbx	;hInstance
mov qword ptr [rsp+58h], 0	;lpParam
call CreateWindowExA
;main_hwnd - дескриптор главного окна
mov main_hwnd, rax

  cmp rax, 0
  je err_handle
  ;Форматируем строку
  lea rcx, hWnd_msg	;lpOut
  lea rdx, hWnd_fmt	;lpFmt
  mov r8, rax		;arg_1
  xor r9, r9		;arg_n
  call wsprintf
  ;Выводим сообщение
  mov rcx, main_hwnd	;hWnd
  lea rdx, hWnd_msg	;lpText
  lea r8, szTitleName	;lpCaption
  mov r9, 40h		;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h = 40h
  call MessageBoxA

;Создаём кнопку About
xor rcx, rcx			;dwExStyle
lea rdx, button_class		;lpClassName
lea r8, AboutTitle		;lpWindowName
mov r9, 40000000h		;dwStyle = WS_CHILD + BS_PUSHBUTTON = 4000.0000h + 0 = 4000.0000h
mov qword ptr [rsp+20h], 50	;x
mov qword ptr [rsp+28h], 50	;y
mov qword ptr [rsp+30h], 200	;nWidth
mov qword ptr [rsp+38h], 50	;nHeight
mov rbx, main_hwnd
mov qword ptr [rsp+40h], rbx	;hWndParent
mov qword ptr [rsp+48h], 0	;hMenu
mov rbx, hInst
mov qword ptr [rsp+50h], rbx	;hInstance
mov qword ptr [rsp+58h], 0	;lpParam
call CreateWindowExA
;AboutBtnHandle - дескриптор окна About
mov AboutBtnHandle, rax

  cmp rax, 0
  je err_handle
  ;Форматируем строку
  lea rcx, hAbout_msg		;lpOut
  lea rdx, hAbout_fmt		;lpFmt
  mov r8, rax			;arg_1
  mov r9, AboutBtnHandle	;arg_n
  call wsprintf
  ;Выводим сообщение
  mov rcx, main_hwnd	;hWnd
  lea rdx, hAbout_msg	;lpText
  lea r8, szTitleName	;lpCaption
  mov r9, 40h		;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h = 40h
  call MessageBoxA

;Создаём кнопку Exit
xor rcx, rcx			;dwExStyle
lea rdx, button_class		;lpClassName
lea r8, ExitTitle		;lpWindowName
mov r9, 40000000h		;dwStyle = WS_CHILD + BS_PUSHBUTTON = 4000.0000h + 0 = 4000.0000h
mov qword ptr [rsp+20h], 50	;x
mov qword ptr [rsp+28h], 150	;y
mov qword ptr [rsp+30h], 200	;nWidth
mov qword ptr [rsp+38h], 50	;nHeight
mov rbx, main_hwnd
mov qword ptr [rsp+40h], rbx	;hWndParent
mov qword ptr [rsp+48h], 0	;hMenu
mov rbx, hInst
mov qword ptr [rsp+50h], rbx	;hInstance
mov qword ptr [rsp+58h], 0	;lpParam
call CreateWindowExA
;ExitBtnHandle - дескриптор окна Exit
mov ExitBtnHandle, rax

  cmp rax, 0
  je err_handle
  ;Форматируем строку
  lea rcx, hExit_msg		;lpOut
  lea rdx, hExit_fmt		;lpFmt
  mov r8, rax			;arg_1
  mov r9, ExitBtnHandle		;arg_n
  call wsprintf
  ;Выводим сообщение
  mov rcx, main_hwnd	;hWnd
  lea rdx, hExit_msg	;lpText
  lea r8, szTitleName	;lpCaption
  mov r9, 40h		;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h = 40h
  call MessageBoxA

;Показываем главное окно
mov rcx, main_hwnd
mov rdx, 1			;nCmdShow = SW_SHOWNORMAL = 1
call ShowWindow
;Обновляем главное окно
mov rcx, main_hwnd
call UpdateWindow
;Показываем окно About
mov rcx, AboutBtnHandle
mov rdx, 1			;nCmdShow = SW_SHOWNORMAL = 1
call ShowWindow
;Показываем окно Exit
mov rcx, ExitBtnHandle
mov rdx, 1			;nCmdShow = SW_SHOWNORMAL = 1
call ShowWindow

;Цикл обработки сообщений окна
 msg_loop:
lea rcx, msg			;lpMsg
xor rdx, rdx			;hWnd
xor r8, r8			;wMsgFilterMin
xor r9, r9			;wMsgFilterMax
call GetMessageA

cmp rax, 1
jb goodbye			;Если WM_QUIT = 0
jne err_loop			;Код_ошибки = -1

lea rcx, msg
call TranslateMessage
lea rcx, msg
call DispatchMessageA
jmp msg_loop

;Ошибки
 err_handle:
xor rcx, rcx			;hWnd
lea rdx, err_handle_msg		;lpText
lea r8, err_caption		;lpCaption
mov r9, 10h			;uType = MB_OK + MB_ICONERROR = 0 + 10h = 10h
call MessageBoxA
jmp goodbye
 err_loop:
xor rcx, rcx			;hWnd
lea rdx, err_loop_msg		;lpText
lea r8, err_caption		;lpCaption
xor r9, r9			;uType = MB_OK = 0
call MessageBoxA

 goodbye:
xor rcx, rcx
call ExitProcess	;В процедуре WinMain должен быть ExitProcess
WinMain endp

WndProc proc
;Выравниваем стек и создаём буфер для процедуры WndProc
 sub rsp, 38h	;8 байт выравнивание плюс 30h буфер для 6 параметров		

;Функция DispatchMessageA возвращает следующие значения:
;rcx = hWnd
;rdx = message
;r8 = wParam
;r9 = lParam

cmp rdx, 2		;WM_DESTROY = 2
je wmdestroy
cmp rdx, 202h		;WM_LBUTTONUP  = 0x0202
je lbuttonup
cmp rdx, 111h		;WM_COMMAND = 0x0111
jne default

  push r9
  push r8
  push rdx
  push rcx
  ;Форматируем строку
  lea rcx, compare_msg	;lpOut
  lea rdx, compare_fmt	;lpFmt
  ;r8 = wParam
  ;r9 = lParam
  mov rax, AboutBtnHandle
  mov qword ptr [rsp+20h], rax
  mov rax, ExitBtnHandle
  mov qword ptr [rsp+28h], rax
  call wsprintf
  ;Выводим сообщение
  mov rcx, main_hwnd	;hWnd
  lea rdx, compare_msg	;lpText
  lea r8, szTitleName	;lpCaption
  mov r9, 40h		;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h = 40h
  call MessageBoxA
  pop rcx
  pop rdx
  pop r8
  pop r9

mov rax, r8
shr rax, 16
cmp rax, 0		;BN_CLICKED = 0
jne default
cmp r9, AboutBtnHandle
je about
cmp r9, ExitBtnHandle
je wmdestroy

 default:
call DefWindowProc		;Параметры считаются заданными (см. выше)
jmp finish
 about:
mov rcx, AboutBtnHandle		;hWnd
lea rdx, AboutText		;lpText
lea r8, AboutTitle		;lpCaption
xor r9, r9			;uType = MB_OK = 0
call MessageBoxA
jmp finish
 lbuttonup:
;mov rcx, main_hwnd		;hWnd итак в регистре rcx
lea rdx, lbuttonup_msg		;lpText
lea r8, szTitleName		;lpCaption
mov r9, 30h			;uType = MB_OK + MB_ICONEXCLAMATION = 0 + 30h = 30h
call MessageBoxA
jmp finish
 wmdestroy:
xor rcx, rcx
call PostQuitMessage		;В процедуре WndProc должен быть PostQuitMessage
xor eax, eax
 finish:
add rsp, 38h			;Восстановление стека после процедуры WndProc
ret
WndProc endp
end