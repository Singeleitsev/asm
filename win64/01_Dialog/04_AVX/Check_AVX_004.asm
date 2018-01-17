include D:\bin\dev\ml64\VS2015\include\user32.inc
include D:\bin\dev\ml64\VS2015\include\kernel32.inc
includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib

.data
;Window Caption
	szCaption db 'Message', 0
;Formatted String
	szFmt db "hInstance = %016Xh",0Ah, "hIcon = %016Xh",0Ah, "hCursor = %016Xh",0
	n = $ - szFmt + 33
	szText db n dup (?)

.data?
;Handles
	hInstance dq ?
	hIcon dq ?
	hCursor dq ?

.code
WinMain proc
;Align the Stack by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Get Application Handle
	xor rcx,rcx ;lpModuleName
	call GetModuleHandle
	mov hInstance,rax
;Load Icon
	xor rcx,rcx
	mov rdx,7F03h ;hIcon = IDI_EXCLAMATION = 32515 = 7F03h
	call LoadIconA
	mov hIcon,rax
;Load Cursor
	xor rcx,rcx
	mov rdx,7F89h ;hCursor = IDC_HAND = 32649 = 7F89h
	call LoadCursorA
	mov hCursor,rax

;Format Data
	lea rcx,szText ;lpOut
	lea rdx,szFmt ;lpFmt
	mov r8, hInstance ;arg_1
	mov r9, hIcon ;arg_2
	mov rax, hCursor
	mov qword ptr [rsp+20h], rax ;arg_n
	call wsprintf
;Show Message
	xor rcx,rcx ;hWnd = HWND_DESKTOP = 0
	lea rdx,szText ;lpText
	lea r8,szCaption ;lpCaption
	mov r9,40h ;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h
	call MessageBoxA

	xor rcx,rcx
	call ExitProcess
WinMain endp
end