from cm2network/steamcmd

user root

run apt-get update && \
    apt-get install -y --no-install-recommends \
        libfontconfig1 \
        libpangocairo-1.0-0 \
        libnss3 \
        gconf-gsettings-backend \
        libxi6 \
        libxcursor1 \
        libxss1 \
        libxcomposite1 \
        libasound2 \
        libxdamage1 \
        libxtst6 \
        libatk1.0-0 \
        libxrandr2 \
        libcurl3-gnutls \
        libcurl4

run apt-get clean autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

# Download the server via SteamCMD
user steam

arg GAME_ID=629800
arg GAME_PATH="/home/steam/Steam/steamapps/common/Mordhau Dedicated Server/Mordhau/"
arg GAME_CFG="Saved/Config/LinuxServer/"
run /home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +app_update ${GAME_ID} validate \
    +quit


env SERVER_ADMINPW="replacethisyoumadlad" \
    SERVER_PW="" \
    SERVER_MAXPLAYERS=32 \
    SERVER_TICKRATE=60 \
    SERVER_PORT=7777 \
    SERVER_QUERYPORT=27015 \
    SERVER_BEACONPORT=15000 \
    SERVER_DEFAULTMAP="\/Game\/Mordhau\/Maps\/ThePit\/FFA_ThePit.FFA_ThePit"


entrypoint ${GAME_PATH}/MordhauServer.sh -log \
    -Port=$SERVER_PORT -QueryPort=$SERVER_QUERYPORT -BeaconPort=$SERVER_BEACONPORT \
    -GAMEINI=${STEAMAPPDIR}/Mordhau/Saved/Config/LinuxServer/Game.ini \
    -ENGINEINI=${STEAMAPPDIR}/Mordhau/Saved/Config/LinuxServer/Engine.ini

