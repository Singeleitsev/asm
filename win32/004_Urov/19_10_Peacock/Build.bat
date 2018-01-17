@echo off

set AppName=urov_19_10_MASM32_001
set MenuName=Prg20_1
set BinPath=D:\masm32\bin

%BinPath%\ml /c /coff /Cp %AppName%.asm
%BinPath%\rc.exe /r /Fo %MenuName%.res %MenuName%.rc
%BinPath%\link %AppName%.obj %MenuName%.res /ENTRY:start /SUBSYSTEM:WINDOWS

del %MenuName%.res
del %AppName%.obj

dir %AppName%.*

pause