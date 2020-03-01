
SUB_DIRS = \
	chivalry \
	teeworlds \
	trackmania_forever \
	csgo \
	$()

GOAL = $(MAKECMDGOALS)

all build run start stop clean restart: $(SUB_DIRS)

$(SUB_DIRS):
	$(MAKE) -C $@ $(GOAL) 

.PHONY: all build run start stop clean restart $(SUB_DIRS)
