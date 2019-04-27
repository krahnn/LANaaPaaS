
SUB_DIRS = \
	chivalry \
	teeworlds \
	trackmania_forever \
	csgo \
	$()



.PHONY: all build run start stop clean restart
all build run start stop clean restart:
	for i in "$(SUB_DIRS)" ; do \
		$(MAKE) -C $$i $(MAKECMDGOALS); \
	done

