
TDM_NAME=teeworlds_tdm
CTF_NAME=teeworlds_ctf
NAMES= \
	${TDM_NAME} \
	${CTF_NAME} \
	${}

include ../common.mk

build:
	docker build -t krahnn/teeworlds:1.0 .

run:
	docker run -d \
		-v $(CURDIR)/tdm/:/opt/teeworlds/cfg/ \
		-p 8303:8303/udp \
		--name ${TDM_NAME} \
		krahnn/teeworlds:1.0

	docker run -d \
		-v $(CURDIR)/ctf/:/opt/teeworlds/cfg/ \
		-p 8304:8303/udp \
		--name ${CTF_NAME} \
		krahnn/teeworlds:1.0
