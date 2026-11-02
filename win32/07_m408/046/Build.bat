@echo off

set filename=m408gl32

\masm32\bin\ml /c /coff /Cp %filename%.asm

\masm32\bin\link /SUBSYSTEM:WINDOWS /ENTRY:WinMain %filename%.obj

del %filename%.obj

dir %filename%.*

pause