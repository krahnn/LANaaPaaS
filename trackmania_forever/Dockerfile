from ubuntu:14.04

# Pull required packages
run apt-get update && apt-get install -y --no-install-recommends \
    wget curl ca-certificates \
    unzip \
    mysql-server \
    php5 php5-cli php5-mysql

# Clean up APT to save image space
run apt-get clean autoclean && \
    apt-get -y autoremove && \
    rm -fr /var/lib/{apt,dpkg,cache,log}

# xaseco assumes tmf user
run adduser --home /home/tmf --shell /bin/bash --disabled-password tmf
user tmf
run mkdir -p /home/tmf/
workdir /home/tmf/

# Get the pre built version of the game
arg TMNF_ZIP=TrackmaniaServer_2011-02-21.zip
arg TMNF_URL=http://files2.trackmaniaforever.com
run curl ${TMNF_URL}/${TMNF_ZIP} --output ${TMNF_ZIP} && \
    unzip ./${TMNF_ZIP} && \
    rm ${TMNF_ZIP}

# Get the Xaseco Server Controller
# For some reason good old wget didn't seem to work with this link...
arg XASECO_ZIP=xaseco_116.zip
arg XASECO_URL=http://www.gamers.org/tmn/
run curl ${XASECO_URL}/${XASECO_ZIP} --output ${XASECO_ZIP} && \
    unzip ./${XASECO_ZIP} && \
    rm ${XASECO_ZIP}
run mv ./xaseco/newinstall/*\.xml ./xaseco && mv ./xaseco/newinstall/*\.php ./xaseco/includes

run ln -fs /home/tmf/cfg/config.xml /home/tmf/xaseco/
run ln -fs /home/tmf/cfg/localdatabase.xml /home/tmf/xaseco/
run ln -fs /home/tmf/cfg/plugins.xml /home/tmf/xaseco/
run ln -fs /home/tmf/cfg/adminops.xml /home/tmf/xaseco/

expose 2350/tcp
expose 3450/tcp
expose 8002/tcp
expose 2350/udp
expose 8002/udp

# As far as I can tell, game_settings is hard coded to look at ./GameData/Tracks
run ln -fs ../../cfg/dedicated_cfg.txt ./GameData/Config/dedicated_cfg.txt
run ln -fs ../../cfg/game_settings.txt ./GameData/Tracks/game_settings.txt


# And of course curl didn't work with this one...
run wget http://koti.mbnet.fi/reaby/xaseco/teamrace_v056.zip
run unzip teamrace_v056.zip -d ./xaseco || true

user root

# Will crash if game_settings.txt and dedicated_cfg.txt aren't mounted
cmd /usr/sbin/mysqld & sleep 3 && \
    mysql -e 'create database aseco;' & \
    cd ./xaseco/ && sudo -u tmf php aseco.php & \
    sudo -u tmf ./TrackmaniaServer /game_settings=game_settings.txt \
        /dedicated_cfg=dedicated_cfg.txt /lan /nodaemon

