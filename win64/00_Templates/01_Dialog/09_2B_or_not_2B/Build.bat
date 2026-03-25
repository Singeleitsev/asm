@echo off

set FileName=2B_or_not_2B
set PathBin=D:\bin\dev\asm\ml64\VS2019\bin

if exist %FileName%.obj del %FileName%.obj
if exist %FileName%.exe del %FileName%.exe

%PathBin%\ml64 /c /Fo%FileName%.obj %FileName%.asm
%PathBin%\link %FileName%.obj /ENTRY:WinMain /SUBSYSTEM:WINDOWS

del %FileName%.obj

dir %FileName%.*

pause