#! /bin/sh

docker run -d -P -p 2350:2350/tcp -p 2350:2350/udp -p 3450:3450/tcp krahnn/trackmania_forever:1.0

