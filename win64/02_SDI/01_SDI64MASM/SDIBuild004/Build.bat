@echo off

set AsmName=000_Integrator_004
set AppName=SDI64MASM
set BinPath=D:\bin\dev\ml64\VS2017\bin

if exist %AppName%.obj del %AppName%.obj
if exist %AppName%.exe del %AppName%.exe

%BinPath%\ml64 /c /Fo %AppName%.obj %AsmName%.asm
%BinPath%\link.exe %AppName%.obj /ENTRY:WinMain /SUBSYSTEM:WINDOWS

del %AppName%.obj

dir %AppName%.*

pause