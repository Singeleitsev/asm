@echo off

set AppName=Urov_19_10_Peacock_001g
set MenuName=Prg19_4_03g
set BinPath=D:\bin\dev\ml64\VS2017\bin

if exist %MenuName%.res del %MenuName%.res
if exist %AppName%.obj del %AppName%.obj
if exist %AppName%.exe del %AppName%.exe

%BinPath%\ml64 /c /Fo %AppName%.obj %AppName%.asm
%BinPath%\rc.exe /r /Fo %MenuName%.res %MenuName%.rc
%BinPath%\link.exe %AppName%.obj %MenuName%.res /ENTRY:start /SUBSYSTEM:WINDOWS /LARGEADDRESSAWARE:NO

del %MenuName%.res
del %AppName%.obj

dir %AppName%.*

pause