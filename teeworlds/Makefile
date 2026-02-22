NAME=teeworlds

include ../common.mk

build:
	docker build -t krahnn/teeworlds:1.0 .

run:
	docker run -d \
		-v $(CURDIR)/config/:/opt/teeworlds/cfg/ \
		-p 8303:8303/udp \
		--name ${NAME} \
		krahnn/teeworlds:1.0
