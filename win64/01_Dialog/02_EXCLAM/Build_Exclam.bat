@echo off

set filename=EXCLAM_004

if exist %filename%.obj del %filename%.obj
if exist %filename%.exe del %filename%.exe

D:\bin\dev\ml64\VS2015\bin\ml64 /c /Fo%filename%.obj %filename%.asm
D:\bin\dev\ml64\VS2015\bin\link %filename%.obj /ENTRY:WinMain /SUBSYSTEM:WINDOWS /LARGEADDRESSAWARE:NO

dir %filename%.*

pause