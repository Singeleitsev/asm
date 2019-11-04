REM BUILD.BAT

@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64\vcvars64.bat"

set filename=MB_OK_001

if exist %filename%.obj del %filename%.obj
if exist %filename%.exe del %filename%.exe

ml64 /c /Fo%filename%.obj %filename%.asm
link %filename%.obj /ENTRY:main /SUBSYSTEM:WINDOWS

dir %filename%.*

pause