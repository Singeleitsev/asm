@echo off

set FileName=ShowRSP_001g
set PathBin=D:\bin\dev\ml64\VS2017\bin

if exist %FileName%.obj del %FileName%.obj
if exist %FileName%.exe del %FileName%.exe

%PathBin%\ml64 /c /Fo%FileName%.obj %FileName%.asm
%PathBin%\link %FileName%.obj /ENTRY:WinMain /SUBSYSTEM:WINDOWS

del %FileName%.obj

dir %FileName%.*

pause