@echo off

set AppName=MDI32MASM_009
set MenuName=MDI32Menu_001
set BinPath=D:\MASM32\bin

%BinPath%\ml /c /coff /Cp %AppName%.asm
%BinPath%\rc.exe /r /Fo %MenuName%.res %MenuName%.rc
%BinPath%\link.exe %AppName%.obj %MenuName%.res /ENTRY:WinMain /SUBSYSTEM:WINDOWS

del %MenuName%.res
del %AppName%.obj

dir %AppName%.*

pause