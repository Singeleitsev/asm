@echo off

set AsmName=Urov_19_10_MASM32
set MenuName=Prg20_1_03

set AppName=Urov_19_10_MASM32
set BinPath=F:\bin\dev\asm\masm32\masm32v11r\bin

if exist %MenuName%.res del %MenuName%.res
if exist %AsmName%.obj del %AsmName%.obj
if exist %AppName%.exe del %AppName%.exe

%BinPath%\ml /c /coff /Fo %AppName%.obj %AsmName%.asm
::%BinPath%\ml /c /coff /Cp %AsmName%.asm
%BinPath%\rc.exe /r /Fo %MenuName%.res %MenuName%.rc
%BinPath%\link %AppName%.obj %MenuName%.res /ENTRY:start /SUBSYSTEM:WINDOWS

del %MenuName%.res
del %AppName%.obj

dir %AppName%.*

pause