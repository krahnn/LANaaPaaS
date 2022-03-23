# The Xaseco controller expects PHP5 and MYSQL4/5.
# Best to start with ubuntu 14.04
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
run mkdir -p /opt/tmf/
workdir /opt/tmf/

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
run curl ${XASECO_URL}/${XASECO_ZIP} -k --output ${XASECO_ZIP} && \
    unzip ./${XASECO_ZIP} && \
    rm ${XASECO_ZIP}

# Need to pull files from newinstall to main dir and includes
run mv ./xaseco/newinstall/*\.xml ./xaseco && \
    mv ./xaseco/newinstall/*\.php ./xaseco/includes

# Pull teamrace plugin
# And of course curl didn't work with this one...
arg TEAMRACE_ZIP=teamrace_v056.zip
arg TEAMRACE_URL=http://koti.mbnet.fi/reaby/xaseco/
run wget ${TEAMRACE_URL}/${TEAMRACE_ZIP} && \
    unzip ${TEAMRACE_ZIP} -d ./xaseco ; \
    rm ${TEAMRACE_ZIP}


# Link config files from mounted directory
run ln -fs ../cfg/config.xml ./xaseco/
run ln -fs ../cfg/localdatabase.xml ./xaseco/
run ln -fs ../cfg/plugins.xml ./xaseco/
run ln -fs ../cfg/adminops.xml ./xaseco/
run ln -fs ../cfg/teamrace.xml ./xaseco/

# As far as I can tell, game_settings is hard coded to look at ./GameData/Tracks
run ln -fs ../../cfg/dedicated_cfg.txt ./GameData/Config/dedicated_cfg.txt
run ln -fs ../../cfg/game_settings.txt ./GameData/Tracks/game_settings.txt

expose 2350/tcp
expose 3450/tcp
expose 2350/udp

# Will crash if game_settings.txt and dedicated_cfg.txt aren't mounted
cmd /usr/sbin/mysqld & sleep 3 && \
    mysql -e 'create database aseco;' & \
    ./TrackmaniaServer /game_settings=game_settings.txt \
        /dedicated_cfg=dedicated_cfg.txt /lan & \ 
    cd ./xaseco/ && php aseco.php


