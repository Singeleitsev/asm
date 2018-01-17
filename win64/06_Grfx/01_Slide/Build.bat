@echo off

set AppName=Slide_016g
set BinPath=D:\bin\dev\ml64\VS2017\bin

if exist %AppName%.obj del %AppName%.obj
if exist %AppName%.exe del %AppName%.exe

%BinPath%\ml64 /c /Fo %AppName%.obj %AppName%.asm
%BinPath%\link.exe %AppName%.obj /ENTRY:WinMain /SUBSYSTEM:WINDOWS

del %AppName%.obj

dir %AppName%.*

pause