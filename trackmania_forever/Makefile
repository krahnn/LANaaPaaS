
NAME=trackmania_forever

include ../common.mk

build:
	docker build -t krahnn/trackmania_forever:1.0 .

run:
	docker run -d \
		-v $(PWD)/cfg:/opt/tmf/cfg/ \
		-p 2350:2350/tcp \
		-p 2350:2350/udp \
		-p 3450:3450/tcp \
		-p 8002:8002/udp \
		-p 8002:8002/tcp \
		--name ${NAME} \
		krahnn/trackmania_forever:1.0

