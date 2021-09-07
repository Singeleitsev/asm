@echo off
if not exist SmallMDI.asm goto AsmEnd
if not exist SmallMDI.inc goto AsmEnd
if not exist SmallMDI.rc goto AsmEnd
if not exist SmallMDI.xml goto AsmEnd
if not exist SmallMDI.ico goto AsmEnd
if exist SmallMDI.res del SmallMDI.res
\masm32\bin\rc /v SmallMDI.rc
if not exist SmallMDI.res goto AsmEnd
echo.
if exist SmallMDI.obj del SmallMDI.obj
\masm32\bin\ml /c /coff SmallMDI.asm
if errorlevel 1 goto AsmEnd
if not exist SmallMDI.obj goto AsmEnd
echo.
echo PoLink: SmallMDI.asm SmallMDI.res
if exist SmallMDI.exe del SmallMDI.exe
\masm32\bin\polink /SUBSYSTEM:WINDOWS /OPT:NOREF SmallMDI.obj SmallMDI.res

:AsmEnd
if exist SmallMDI.res del SmallMDI.res
if exist SmallMDI.obj del SmallMDI.obj
echo.
dir SmallMDI.* /o-d
pause