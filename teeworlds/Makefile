
build:
	docker build -t krahnn/teeworlds:1.0 .

run:
	docker run -d \
		-v $(PWD)/tdm/:/opt/teeworlds/cfg/ \
		-p 8303:8303/udp \
		--name teeworlds_tdm \
		krahnn/teeworlds:1.0

	docker run -d \
		-v $(PWD)/ctf/:/opt/teeworlds/cfg/ \
		-p 8304:8303/udp \
		--name teeworlds_ctf \
		krahnn/teeworlds:1.0

start:
	docker start teeworlds_tdm teeworlds_ctf


stop:
	docker stop teeworlds_tdm teeworlds_ctf

clean:
	docker rm -f teeworlds_tdm teeworlds_ctf
