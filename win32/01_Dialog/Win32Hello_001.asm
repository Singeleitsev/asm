.386
.model flat, stdcall
option casemap:none
include D:\masm32\include\windows.inc
include D:\masm32\include\kernel32.inc
include D:\masm32\include\user32.inc
includelib D:\masm32\lib\kernel32.lib
includelib D:\masm32\lib\user32.lib

.data
Caption db "Win32 Application",0
Text db "Hello World!",0

.code
start:
invoke MessageBox, 0, addr Text, addr Caption, MB_OK
invoke ExitProcess, 0
end start