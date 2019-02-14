
SUB_DIRS = \
	chivalry \
	csgo \
	teeworlds \
	trackmania_forever \
	$()

build run start stop clean:
	$(MAKE) $(MAKECMDGOALS) -C $(SUB_DIRS)

