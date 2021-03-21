@echo off

set AppName=SDI64Dlg
set MenuName=SDI64Dlg
set BinPath=F:\bin\dev\asm\ml64\VS2019\bin

if exist %MenuName%.res del %MenuName%.res
if exist %AppName%.obj del %AppName%.obj
if exist %AppName%.exe del %AppName%.exe

%BinPath%\ml64 /c %AppName%.asm
%BinPath%\rc /r %MenuName%.rc
%BinPath%\link %AppName%.obj %MenuName%.res /ENTRY:WinMain /SUBSYSTEM:WINDOWS

del %MenuName%.res
del %AppName%.obj

dir %AppName%.*

pause