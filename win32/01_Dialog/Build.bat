@echo off

set filename=Win32Hello_001

D:\masm32\bin\ml /c /coff /Cp %filename%.asm

D:\masm32\bin\link /SUBSYSTEM:WINDOWS %filename%.obj

del %filename%.obj

dir %filename%.*

pause