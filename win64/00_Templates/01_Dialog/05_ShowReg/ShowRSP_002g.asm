option casemap:none
;Standard Includes and Libraries
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
;Custom includes
	include include\Spell_09.inc

.const
	szCaption db "I've got the power!", 0
	szText db "MessageBoxA was called",0

.data
	szTextStack db "Вершина стека: 0000.0000.0000.0000h",0
	szTextCycle db "Cycle #0",0

.code

WinMain proc
	sub rsp, 28h
	
	mov rax, rsp
	Spell64rax 0, szCaption, szTextStack
	
	xor rcx, rcx		;hWnd = HWND_DESKTOP = 0
	lea rdx, szText		;lpText
	lea r8, szCaption	;lpCaption
	xor r9, r9		;uType = MB_OK = 0
	call MessageBoxA
	
	mov rax, rsp
	Spell64rax 0, szCaption, szTextStack
	
	xor rcx, rcx		;hWnd = HWND_DESKTOP = 0
	lea rdx, szText		;lpText
	lea r8, szCaption	;lpCaption
	xor r9, r9		;uType = MB_OK = 0
	call MessageBoxA
	
	mov rcx, 4
	@@:
		lea rax,szTextCycle
		mov byte ptr [rax+7],cl
		add byte ptr [rax+7],30h
		mov rax, rsp
		Spell64rax 0, szTextCycle, szTextStack
	dec cx
	cmp cx, 0
	jg @b
	
	add rsp, 20h
	xor rcx, rcx
	call ExitProcess
WinMain endp
end