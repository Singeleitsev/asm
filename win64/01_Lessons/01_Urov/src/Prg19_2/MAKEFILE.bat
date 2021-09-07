NAME = prg19_2
NAMERES=menu
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
IMPORT=$(MAKEDIR)\import32
!else
IMPORT=import32
!endif


$(NAME).EXE: $(OBJS) $(DEF) $(RES)
  tlink32 /Tpe /aa /c  /v $(LINKDEBUG) $(OBJS),$(NAME),, $(IMPORT), $(DEF),$(RES)

.asm.obj:
   tasm32 $(TASMDEBUG)/zi /m2 /ml $&.asm,,,

$(RES) : $(NAMERES).rc $(NAMERES).h
   brc32  $(NAMERES).rc  