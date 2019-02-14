from ubuntu:18.04

# Pull required packages
run apt-get update && apt-get install -y --no-install-recommends \
    wget \
    unzip \
    ca-certificates

# Clean up APT to save image space
run apt-get clean autoclean && \
    apt-get -y autoremove && \
    rm -fr /var/lib/{apt,dpkg,cache,log}

# Get the pre built version of the game
run mkdir -p /opt/tmnf
arg TMNF_ZIP=TrackmaniaServer_2011-02-21.zip
arg TMNF_URL=http://files2.trackmaniaforever.com
run wget ${TMNF_URL}/${TMNF_ZIP} && \
    unzip ./${TMNF_ZIP} -d /opt/tmnf && \
    rm ${TMNF_ZIP}

expose 2350/tcp
expose 3450/tcp
expose 2350/udp

workdir /opt/tmnf

# As far as I can tell, game_settings is hard coded to look at ./GameData/Tracks
run ln -fs ../../cfg/game_settings.txt ./GameData/Tracks/game_settings.txt

# Will crash if game_settings.txt and dedicated_cfg.txt aren't mounted
cmd ./TrackmaniaServer /game_settings=game_settings.txt /dedicated_cfg=./cfg/dedicated_cfg.txt \
    /servername=LANaaPaaS /lan /nodaemon
