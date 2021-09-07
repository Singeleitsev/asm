@echo off
D:\bin\dev\ml64\VS2015\bin\ML64 /I"D:\bin\dev\mikl__\masm64\Include" /I"D:\bin\dev\mikl__\masm64\Include" /c /Cp "Mikl__02.asm"
D:\bin\dev\ml64\VS2015\bin\LINK /LIBPATH:"D:\bin\dev\mikl__\masm64\Lib" /BASE:0x100400000 /ENTRY:WinMain /SUBSYSTEM:WINDOWS Mikl__02.obj user32.lib kernel32.lib
pause