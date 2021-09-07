@echo off
if not exist SmallMDI.asm goto AsmEnd
if not exist SmallMDI.inc goto AsmEnd
if not exist SmallMDI.rc goto AsmEnd
if not exist SmallMDI.xml goto AsmEnd
if not exist SmallMDI.ico goto AsmEnd
if exist SmallMDI.res del SmallMDI.res
\masm32\bin\rc /v SmallMDI.rc
if not exist SmallMDI.res goto AsmEnd
if exist rsrc.res del rsrc.res
ren SmallMDI.res rsrc.res
if exist rsrc.obj del rsrc.obj
\masm32\bin\cvtres /machine:ix86 rsrc.res
if not exist rsrc.obj goto AsmEnd
echo.
if exist SmallMDI.obj del SmallMDI.obj
\masm32\bin\ml /c /coff SmallMDI.asm
if errorlevel 1 goto AsmEnd
if not exist SmallMDI.obj goto AsmEnd
echo.
if exist SmallMDI.exe del SmallMDI.exe
\masm32\bin\link /SUBSYSTEM:WINDOWS /OPT:NOREF SmallMDI.obj rsrc.obj

:AsmEnd
if exist rsrc.res del rsrc.res
if exist rsrc.obj del rsrc.obj
if exist SmallMDI.obj del SmallMDI.obj
echo.
dir SmallMDI.*  /o-d
pause

