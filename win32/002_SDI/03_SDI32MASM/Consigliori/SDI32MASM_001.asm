	.386
	.model flat, STDCALL

	option casemap:none

;Standard Includes and Libs
	include D:\masm32\include\windows.inc
	include D:\masm32\include\kernel32.inc
	include D:\masm32\include\user32.inc
	include D:\masm32\include\gdi32.inc
	includelib D:\masm32\lib\kernel32.lib
	includelib D:\masm32\lib\user32.lib
	includelib D:\masm32\lib\gdi32.lib
;Custom Includes
	include include\struct32_01.inc

.data
;Handles
	hWnd dd 0
	hInst dd 0
;Names
	szClassName db 'CWin32SDI',0
	szTitleName db 'Win32 SDI App',0
;Structures
	wcl WNDCLASSEX32 <?>
	message MSG32 <?>
	ps PAINTSTRUCT32 <?>

.code
start proc
	push 0
	call GetModuleHandleA 
	mov hInst,eax

WinMain:

	mov wcl.cbSize,dword ptr sizeof WNDCLASSEX32
	mov wcl.style, 3 ;CS_HREDRAW+CS_VREDRAW
	mov wcl.lpfnWndProc,offset WindowProc
	mov wcl.cbClsExtra,0
	mov wcl.cbWndExtra,0
	mov eax,hInst
	mov wcl.hInstance,eax
	push 7F00h ;IDI_APPLICATION
	push 0
	call LoadIconA
	mov wcl.hIcon,eax
	push 7F00h ;IDC_ARROW
	push 0
	call LoadCursorA
	mov wcl.hCursor,eax
	push 0 ;WHITE_BRUSH
	call GetStockObject
	mov wcl.hbrBackground,eax
	mov wcl.lpszMenuName,0
	mov eax,offset szClassName
	mov wcl.lpszClassName,eax
	mov wcl.hIconSm,0
	push offset wcl
	call RegisterClassExA
test ax,ax
jz end_cycl_msg

	push 0 ;lpParam
	push hInst ;hInstance
	push 0 ;menu
	push 0 ;parent hwnd
	push 80000000h ;CW_USEDEFAULT ;высота окна
 	push 80000000h ;CW_USEDEFAULT ;ширина окна
	push 80000000h ;CW_USEDEFAULT ;координата y левого верхнего угла
	push 80000000h ;CW_USEDEFAULT ;координата x левого верхнего угла
	push 0CF0000h ;WS_OVERLAPPEDWINDOW ;стиль окна
	push offset szTitleName ;Строка заголовка окна
	push offset szClassName ;имя класса окна
	push 0
	call CreateWindowExA
	mov hWnd,eax ;дескриптор окна

	push 1 ;SW_SHOWNORMAL
	push hWnd
	call ShowWindow
	push hWnd
	call UpdateWindow

cycl_msg:
	push 0
	push 0
	push 0
	push offset message
	call GetMessageA
	cmp ax,0
		je end_cycl_msg
	push offset message
	call TranslateMessage
	push offset message
	call DispatchMessageA
	jmp cycl_msg

;выход из приложения
end_cycl_msg:
	push 0
	call ExitProcess
start endp

WindowProc proc uses ebx edi esi, @@hwnd:DWORD, @@mes:DWORD, @@wparam:DWORD, @@lparam:DWORD

	local @@hdc:DWORD

	cmp @@mes,2 ;WM_DESTROY
		je wmdestroy
	cmp @@mes,1 ;WM_CREATE
		je wmcreate
	jmp default

wmcreate:
	jmp exit_wndproc

wmdestroy:
	push 0
	call PostQuitMessage
	mov eax,0 ;возвращаемое значение 0
	jmp exit_wndproc

default:
	push @@lparam
	push @@wparam
	push @@mes
	push @@hwnd
	call DefWindowProcA
	jmp exit_wndproc

exit_wndproc:
	ret
WindowProc endp
end start