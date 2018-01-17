@echo off

set filename=urov_19_1_MASM32_004

D:\masm32\bin\ml /c /coff /Cp %filename%.asm

D:\masm32\bin\link %filename%.obj /ENTRY:start /SUBSYSTEM:WINDOWS

del %filename%.obj

dir %filename%.*

pause