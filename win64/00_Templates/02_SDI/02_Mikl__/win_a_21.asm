include D:\bin\dev\ml64\VS2015\include\user32.inc
include D:\bin\dev\ml64\VS2015\include\kernel32.inc
includelib D:\bin\dev\ml64\VS2015\lib\user32.lib
includelib D:\bin\dev\ml64\VS2015\lib\kernel32.lib

include D:\hob\dev\asm\x64\002_SDI\02_Mikl__\include\struct64_02.inc

.const
 WindowName db 'MASM 64 SDI Application',0
 ClassName db 'Asm64 window',0

.data
wcSDI64 label WNDCLASSEX64
  cbSize dd sizeof WNDCLASSEX64
  style dd 0
  lpfnWndProc dq offset WndProc
  cbClsExtra dd 0
  cbWndExtra dd 0
  hInstance dq 	100400000h	;Значение взято из дебаггера
  hIcon dq 10029h		;IDI_WARNING - взял из дебаггера результат функции LoadIcon
  hCursor dq 1001Fh		;IDC_HAND - взял из дебаггера результат функции LoadCursor
  hbrBackground dq 1
  lpszMenuName dq 0
  lpszClassName dq offset ClassName
  hIconSm dq 0

ptSDI64 label POINT64
  x dd 0
  y dd 0

msgSDI64 label MSG64
    hWnd dq ?
    message dd ?
    wParam dd 0
    lParam dd 0
    time dd 0
    pt dq offset ptSDI64

.code
WinMain proc

;Выравниваем стек
  sub rsp, 8h

;Регистрируем класс окна
  lea rcx, wcSDI64
  call RegisterClassEx
;Создаём окно
  push 0		;lpParam
  push 400000h		;hInstance
  push 0		;hMenu
  push 0		;hWndParent
  push 80000000h	;nHeight = CW_USEDEFAULT = 8000.0000h
  push 80000000h	;nWidth = CW_USEDEFAULT = 8000.0000h
  push 80000000h	;y = СW_USEDEFAULT = 8000.0000h
  push 80000000h	;x = CW_USEDEFAULT = 8000.0000h
  mov r9d,10CF0000h	;dwStyle = WS_VISIBLE + WS_OVERLAPPEDWINDOW = 10CF.0000h
  lea r8, WindowName
  lea rdx, ClassName
  xor rcx,rcx        	;dwExStyle
  sub rsp, 20h
  call CreateWindowEx
;Цикл обработки сообщений окна
  lea rdi,msgSDI64
@@:
  mov rcx,rdi
  xor rdx,rdx
  xor r8,r8
  xor r9,r9
  call GetMessage
  mov rcx,rdi
  call DispatchMessage
  jmp @b
WinMain endp

WndProc:
  cmp dx, 2
  je destroy
  jmp DefWindowProc
destroy:
  xor rcx,rcx
  call ExitProcess
end