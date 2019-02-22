
.PHONY: all build run start stop clean restart

all: clean build run

restart: stop start

ifdef NAME
start:
	docker start ${NAME}

stop:
	docker stop ${NAME}

clean:
	docker container ps -a | grep ${NAME} && docker container rm -f ${NAME} || true
endif


ifdef NAMES
.PHONY: ${NAMES}

start:
	docker start ${NAMES}

stop:
	docker stop ${NAMES}

clean: ${NAMES}

${NAMES}:
	docker container ps -a | grep $@ && docker container rm -f $@ || true
endif
