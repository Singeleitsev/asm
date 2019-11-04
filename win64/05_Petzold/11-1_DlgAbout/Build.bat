@echo off

set AppName=11-1_About_003
set MenuName=About1_001
set BinPath=D:\bin\dev\ml64\VS2017\bin

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