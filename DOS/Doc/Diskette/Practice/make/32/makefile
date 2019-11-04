NAME = prg_3
NAMERES=prg_3
OBJS = $(NAME).obj
DEF  = $(NAME).def
RES = $(NAMERES).res

!if $d(DEBUG)
TASMDEBUG=/zi
LINKDEBUG=/v
!else
TASMDEBUG=
LINKDEBUG=
!endif

!if $d(MAKEDIR)
IMPORT=$(MAKEDIR)\import32+maket_dll
!else
IMPORT=import32+maket_dll
!endif

$(NAME).EXE: $(OBJS) $(DEF) $(RES)
  tlink32 /Tpe /aa /c  /v $(LINKDEBUG) $(OBJS),$(NAME),, $(IMPORT), $(DEF),prg_3.RES

.asm.obj:
   tasm32 $(TASMDEBUG)/zi /m2 /ml $&.asm,,,

