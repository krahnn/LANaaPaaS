
build:
	docker build -t krahnn/chivalry:1.0 .

run:
	docker run -d \
		-v $(PWD)/cfg:/home/steam/LANaaPaaS/ \
		-p 8000:8000/udp \
		-p 27015:27015/udp \
		--name chivalry \
		krahnn/chivalry:1.0

start:
	docker start chivalry

stop:
	docker stop chivalry

clean:
	docker rm -f chivalry

