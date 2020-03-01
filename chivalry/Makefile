
NAME=chivalry

include ../common.mk

build:
	docker build -t krahnn/chivalry:1.0 .

run:
	docker run -d \
		-v $(CURDIR)/cfg/:/home/steam/LANaaPaaS/ \
		-p 8000:8000/udp \
		-p 27015:27015/udp \
		--name ${NAME} \
		krahnn/chivalry:1.0

