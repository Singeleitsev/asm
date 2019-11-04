@echo off

set AsmName=000_Integrator_004h
set MenuName=Win64MDIMenu_005

set AppName=MDI64MASM
set BinPath=D:\bin\dev\ml64\VS2017\bin

if exist %MenuName%.res del %MenuName%.res
if exist %AppName%.obj del %AppName%.obj
if exist %AppName%.exe del %AppName%.exe

%BinPath%\ml64 /c /Fo %AppName%.obj %AsmName%.asm
%BinPath%\rc.exe /r /Fo %MenuName%.res %MenuName%.rc
%BinPath%\link.exe %AppName%.obj %MenuName%.res /ENTRY:WinMain /SUBSYSTEM:WINDOWS

del %MenuName%.res
del %AppName%.obj

dir %AppName%.*

pause