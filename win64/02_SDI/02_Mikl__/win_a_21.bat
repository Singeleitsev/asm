@echo off

set filename=win_a_21

if exist %filename%.obj del %filename%.obj
if exist %filename%.exe del %filename%.exe

D:\bin\dev\ml64\VS2015\bin\ML64 /I"D:\bin\dev\ml64\VS2015\Include" /c /Cp %filename%.asm

D:\bin\dev\ml64\VS2015\bin\LINK /LIBPATH:"D:\bin\dev\ml64\VS2015\Lib" /ENTRY:WinMain /SUBSYSTEM:WINDOWS %filename%.obj

dir %filename%.*

pause