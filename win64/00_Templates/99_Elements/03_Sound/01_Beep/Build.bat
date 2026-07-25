@echo off

set AsmName=000_Integrator
set AppName=Beep
set BinPath=F:\bin\dev\ml64\VS2019\bin

if exist %AppName%.obj del %AppName%.obj
if exist %AppName%.exe del %AppName%.exe

%BinPath%\ml64 /c /Fo %AppName%.obj %AsmName%.asm
%BinPath%\link.exe %AppName%.obj /ENTRY:WinMain /SUBSYSTEM:WINDOWS /LARGEADDRESSAWARE:NO
del %AppName%.obj

dir %AppName%.*

pause