@ECHO OFF
REM Build order: UICC, RC, FASM
SET PATH="C:\Program Files (x86)\Windows Kits\8.0\bin\x86";%PATH%
uicc.exe ribbon.xml ribbon.bml /header:ribbon.h /res:ribbon.rc /name:FASM
ECHO.
rc /r /n main.rc
..\..\FASM\FASM.exe main.fasm
pause