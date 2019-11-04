@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

set filename=x87_001

if exist %filename%.obj del %filename%.obj
if exist %filename%.exe del %filename%.exe

ml64 /c /Fo%filename%.obj %filename%.asm
link %filename%.obj /ENTRY:main /SUBSYSTEM:WINDOWS

del %filename%.obj

dir %filename%.*

pause
