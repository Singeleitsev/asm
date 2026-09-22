@echo off

set filename=m408ogl

\masm32\bin\ml /c /coff /Cp %filename%.asm

\masm32\bin\link /SUBSYSTEM:WINDOWS /ENTRY:WinMain %filename%.obj

del %filename%.obj

dir %filename%.*

pause