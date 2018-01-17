include D:\bin\dev\ml64\VS2015\include\user32.inc
include D:\bin\dev\ml64\VS2015\include\kernel32.inc

includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib

include D:\hob\dev\asm\x64\include\Spell_05.inc

.const
szCaption db "I've got the power!", 0

.data
szText db "Регистр rax: 0000.0000.0000.0000h",0

.code

WinMain proc
sub rsp, 28h

mov rax, 0123456789ABCDEF0h

Spell64rax 0, szCaption, szText

xor rcx, rcx
call ExitProcess
WinMain endp
end