@echo off

set filename=PetzoldMDI_002

D:\masm32\bin\ml /c /coff /Cp %filename%.asm

D:\masm32\bin\link %filename%.obj /ENTRY:start /SUBSYSTEM:WINDOWS

del %filename%.obj

dir %filename%.*

pause