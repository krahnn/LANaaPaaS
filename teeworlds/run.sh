#! /bin/sh

docker run -v $(pwd)/tdm/:/tee/cfg/ -d -p 8303:8303/udp krahnn/teeworld:1.0
docker run -v $(pwd)/ctf/:/tee/cfg/ -d -p 8304:8303/udp krahnn/teeworld:1.0
