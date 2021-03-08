@echo off

set AsmName=OGLFractal
set AppName=OGLFractal
set BinPath=D:\bin\dev\asm\ml64\VS2019\bin

if exist %AppName%.obj del %AppName%.obj
if exist %AppName%.exe del %AppName%.exe

%BinPath%\ml64 /c /Fo %AppName%.obj %AsmName%.asm
%BinPath%\link.exe %AppName%.obj /ENTRY:WinMain /SUBSYSTEM:WINDOWS

del %AppName%.obj

dir %AppName%.*

pause