@echo off

set filename=CryptGenRandom_005

if exist %filename%.obj del %filename%.obj
if exist %filename%.exe del %filename%.exe

D:\bin\dev\ml64\VS2017\bin\ml64 /c /Fo %filename%.obj %filename%.asm
D:\bin\dev\ml64\VS2017\bin\link %filename%.obj /ENTRY:WinMain /SUBSYSTEM:WINDOWS

del %filename%.obj

dir %filename%.*

pause