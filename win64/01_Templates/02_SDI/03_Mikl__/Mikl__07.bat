set filename=Mikl__07
D:\bin\dev\ml64\VS2015\bin\ML64 /I"D:\bin\dev\mikl__\masm64\Include" /c /Cp %filename%.asm
D:\bin\dev\ml64\VS2015\bin\LINK /LIBPATH:"D:\bin\dev\mikl__\masm64\Lib" /BASE:0x100400000 /ENTRY:WinMain /SUBSYSTEM:WINDOWS %filename%.obj user32.lib kernel32.lib
pause