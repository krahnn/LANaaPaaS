
build:
	docker build -t krahnn/teeworlds:1.0 .

run:
	docker run -d \
		-v $(PWD)/tdm/:/tee/cfg/ \
		-p 8303:8303/udp \
		--name teeworlds-tdm \
		krahnn/teeworlds:1.0

	docker run -d \
		-v $(PWD)/ctf/:/tee/cfg/ \
		-p 8304:8303/udp \
		--name teeworlds-ctf \
		krahnn/teeworlds:1.0

start: # run?
	docker start teeworlds-tdm teeworlds-ctf


stop:
	docker stop teeworlds-tdm teeworlds-ctf

clean:
	docker rm -f teeworlds-tdm teeworlds-ctf
