cls
set masm64_path=\masm64\
set filename=%1
if exist %1.rc (
%masm64_path%bin\RC /r  %filename%.rc || exit
%masm64_path%bin\cvtres /machine:X64 %filename%.res || exit
%masm64_path%bin\ml64 /Cp /c /I"%masm64_path%Include" %filename%.asm || exit
%masm64_path%bin\link /SUBSYSTEM:WINDOWS /LIBPATH:"%masm64_path%Lib" ^
/entry:WinMain %filename%.obj %filename%.res /LARGEADDRESSAWARE:NO ^
/ALIGN:16 /SECTION:.text,W ^
/BASE:0x400000 /STUB:%masm64_path%\bin\stubby.exe || exit
del %filename%.obj
del %filename%.res
) else (
%masm64_path%bin\ml64 /Cp /c /I"%masm64_path%Include" %filename%.asm || exit
%masm64_path%bin\link /SUBSYSTEM:WINDOWS /LIBPATH:"%masm64_path%Lib" ^
/entry:WinMain %filename%.obj /LARGEADDRESSAWARE:NO ^
/ALIGN:16 /SECTION:.text,W ^
/BASE:0x400000 /STUB:%masm64_path%\bin\stubby.exe || exit
del %filename%.obj
)