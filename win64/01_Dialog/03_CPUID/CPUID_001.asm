include D:\hob\dev\asm\x64\include\user32.inc
include D:\hob\dev\asm\x64\include\kernel32.inc
includelib D:\hob\dev\asm\x64\lib\user32.lib
includelib D:\hob\dev\asm\x64\lib\kernel32.lib

.data

Caption db 'Message', 0
Text db 49 dup (0)

.code

WinMain proc
  sub rsp, 28h

  lea r8, Text
  mov eax, 80000002h
  cpuid
  mov [r8], eax
  add r8, 4
  mov [r8], ebx
  add r8, 4
  mov [r8], ecx
  add r8, 4
  mov [r8], edx
  add r8, 4
  mov eax, 80000003h
  cpuid
  mov [r8], eax
  add r8, 4
  mov [r8], ebx
  add r8, 4
  mov [r8], ecx
  add r8, 4
  mov [r8], edx
  add r8, 4
  mov eax, 80000004h
  cpuid
  mov [r8], eax
  add r8, 4
  mov [r8], ebx
  add r8, 4
  mov [r8], ecx
  add r8, 4
  mov [r8], edx

  xor rcx, rcx		;hWnd = HWND_DESKTOP = 0
  lea rdx, Text		;lpText
  lea r8, Caption	;lpCaption
  xor r9, r9		;uType = MB_OK = 0
  call MessageBoxA

  xor rcx, rcx
  call ExitProcess
WinMain endp
end