include D:\bin\dev\asm\ml64\include\user32.inc
include D:\bin\dev\asm\ml64\include\kernel32.inc

includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib

include include\Spell_05.inc

.const
szCaption db "To be or not to be",0

.data
szText db "2Bh or (not 2Bh): 0000.0000.0000.0000h",0

.code

WinMain proc
sub rsp,28h

mov rax,2Bh
not rax
or rax,2Bh

Spell64rax 0, szCaption, szText

xor rcx,rcx
call ExitProcess
WinMain endp
end