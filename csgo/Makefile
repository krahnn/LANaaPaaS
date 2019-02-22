
NAME=csgo

include ../common.mk

build:
	docker build -t krahnn/csgo:1.0 .

run:
	docker run -d \
		--name ${NAME} \
		krahnn/csgo:1.0

