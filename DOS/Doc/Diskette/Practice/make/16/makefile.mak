# файл, с отладочной информацией
# make -DDEBUG > p
NAME = maket
OBJS = $(NAME).obj
!ifdef DEBUG
TASMDEBUG=/zi/m2
LINKDEBUG=/v
!else
TASMDEBUG=
LINKDEBUG=
!endif
$(NAME).EXE: $(OBJS)
	tlink $(LINKDEBUG) $(OBJS)
.asm.obj:
 	del	$(NAME).EXE
 	tasm $(TASMDEBUG) $.,,,


