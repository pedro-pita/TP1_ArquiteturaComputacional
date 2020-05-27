ifdef DEBUG
	DEBUGFLAGS = -g
else
	DEBUGFLAGS =
endif


% : %.o
	gcc $< -o $@

%.o : %.asm
	as $(DEBUGFLAGS) $< -o $@

