@rem use scan add-in to scan
@rem ..\scan Dialog.asm -m5

@set masm_path=\masm32

%masm_path%\bin\rc /v MDI.rc
%masm_path%\bin\poasm /I c:\masm32\include /AIA32 MDI.asm
%masm_path%\bin\polink /SUBSYSTEM:WINDOWS /OUT:MDI.EXE MDI.obj 
