NAME	= maket_dll
OBJS	= $(NAME).obj
DEF	= $(NAME).def
RES	= $(NAME).res
TASMOPT=/m3 /mx /z /q /DWINVER=0400 /D_WIN32_WINNT=0400
!if $d(DEBUG)
TASMDEBUG=/zi
LINKDEBUG=/v
!else
TASMDEBUG=/l
LINKDEBUG=
!endif
!if $d(MAKEDIR)
IMPORT=import32
!else
IMPORT=import32
!endif
$(NAME).EXE: $(OBJS) $(DEF)
	tlink32 /Tpd /aa /c $(LINKDEBUG) $(OBJS),$(NAME),, $(IMPORT), $(DEF)
.asm.obj:
	tasm32 $(TASMDEBUG) $(TASMOPT) $&.asm