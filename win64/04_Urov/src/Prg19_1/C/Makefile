#------------------------
#prg19_1.MAK make file
#------------------------

prg19_1.exe : prg19_1.obj
     $(LINKER)  $(GUIFLAGS) -OUT:prg19_1.exe prg19_1.obj $(GUILIBS)

prg19_1.obj : prg19_1.cpp
     $(CC) /FA  /zi $(CFLAGS)  prg19_1.cpp
