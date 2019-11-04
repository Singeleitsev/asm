NAME = maket
OBJS = $(NAME).obj
DEF  = $(NAME).def
!if $d(DEBUG)
TASMDEBUG=/zi
LINKDEBUG=/v
!else
TASMDEBUG=
LINKDEBUG=
!endif
TASMOPT=/m3  /z   /q # /DWINVER=0400 /D_WIN32_WINNT=0400
# /mx
!if $d(MAKEDIR)
IMPORT=$(MAKEDIR)\import32+maket_dll
!else
IMPORT=import32+maket_dll
!endif
$(NAME).EXE: $(OBJS) $(DEF)
  tlink32 /Tpe /aa /x /c  $(LINKDEBUG) $(OBJS),$(NAME),, $(IMPORT), $(DEF)
.asm.obj:
	del	$(NAME).EXE	
   tasm32 $(TASMDEBUG) /ml $(TASMOPT) $&.asm,,,
