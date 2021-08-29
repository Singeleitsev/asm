@echo off

set FileName=urov_19_1_MASM64_001
set PathBin=D:\bin\dev\ml64\VS2017\bin

if exist %FileName%.obj del %FileName%.obj
if exist %FileName%.exe del %FileName%.exe

%PathBin%\ml64 /c %FileName%.asm
%PathBin%\link %FileName%.obj /ENTRY:start /SUBSYSTEM:WINDOWS

del %FileName%.obj

dir %FileName%.*

pause