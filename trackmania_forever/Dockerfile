from ubuntu:14.04

# Pull required packages
run apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    mysql-server \
    php5 php5-cli

# Clean up APT to save image space
run apt-get clean autoclean && \
    apt-get -y autoremove && \
    rm -fr /var/lib/{apt,dpkg,cache,log}

# xaseco assumes tmf user
run adduser --home /home/tmf --shell /bin/bash --disabled-password tmf

user tmf

# Get the pre built version of the game
run mkdir -p ~/TMF && cd ~/TMF
arg TMNF_ZIP=TrackmaniaServer_2011-02-21.zip
arg TMNF_URL=http://files2.trackmaniaforever.com
run curl ${TMNF_URL}/${TMNF_ZIP} --output ${TMNF_ZIP} && \
    unzip ./${TMNF_ZIP} -d ~/TMF && \
    rm ${TMNF_ZIP}

# Get the Xaseco Server Controller
arg XASECO_ZIP=xaseco_116.zip
arg XASECO_URL=http://www.gamers.org/tmn/
run curl ${XASECO_URL}/${XASECO_ZIP} --output ${XASECO_ZIP} && \
    unzip ./${XASECO_ZIP} -d ~/TMF && \
    rm ${XASECO_ZIP}


expose 2350/tcp
expose 3450/tcp
expose 2350/udp

workdir ~/TMF

# As far as I can tell, game_settings is hard coded to look at ./GameData/Tracks
run ln -fs ../../cfg/game_settings.txt ./GameData/Tracks/game_settings.txt

# Will crash if game_settings.txt and dedicated_cfg.txt aren't mounted
cmd /usr/sbin/mysqld & \
    ./TrackmaniaServer /game_settings=game_settings.txt \
                       /dedicated_cfg=./cfg/dedicated_cfg.txt \
                       /servername=LANaaPaaS /lan /nodaemon
#    cd ./xaseco/ && php aseco.php

