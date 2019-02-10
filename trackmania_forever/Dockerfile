from ubuntu:18.04

run apt update && apt -y install wget

run apt install unzip
run mkdir tmnf
workdir tmnf

# Get the pre built version of the game
arg TMNF_ZIP=TrackmaniaServer_2011-02-21.zip
arg TMNF_URL=http://files2.trackmaniaforever.com
run wget ${TMNF_URL}/${TMNF_ZIP}
run unzip ./${TMNF_ZIP}

copy dedicated_cfg.txt dedicated_cfg.txt
copy game_settings.txt GameData/Tracks/game_settings.txt

expose 2350/tcp
expose 3450/tcp
expose 2350/udp

cmd ./TrackmaniaServer /game_settings=game_settings.txt /dedicated_cfg=dedicated_cfg.txt /servername=LANaaPaaS /lan /nodaemon 
