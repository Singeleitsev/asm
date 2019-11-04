@echo off
cls
set filename=tut32a
if exist %filename%.exe del %filename%.exe
ml /AT /c /Cp /Gz /I\masm32\include %filename%.asm
Link16 /t %filename%.obj ,%filename%.exe;
del %filename%.obj