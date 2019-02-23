
NAME=csgo

include ../common.mk

build:
	docker build -t krahnn/csgo:1.0 .

run:
	docker run -d \
		--net=host \
		--name ${NAME} \
		krahnn/csgo:1.0

