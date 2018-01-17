@echo off

set libpath=D:\bin\dev\ml64\VS2017\lib
set filename=Intel_Sample

if exist %filename%.obj del %filename%.obj
if exist %filename%.exe del %filename%.exe

D:\bin\dev\ml64\VS2017\bin\ml64 %filename%.asm /link /subsystem:windows /defaultlib:%libpath%\kernel32.lib /defaultlib:%libpath%\user32.lib /entry:Start

dir %filename%.*

pause