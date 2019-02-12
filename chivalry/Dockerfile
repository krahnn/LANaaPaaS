from cm2network/steamcmd

#run apt-get update && apt-get install -y --no-install-recommends \
#    steamcmd

# Clean up apt to save image space.
#run apt-get clean autoclean && \
#    apt-get -y autoremove && \
#    rm -fr /var/lib/{apt,dpkg,cache,log}

#run useradd -r -m -u 1000 steam

#run apt -y install curl libstdc++6 lib32gcc1

# Download the server via SteamCMD
arg GAME_ID=220070
run /home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +app_update ${GAME_ID} validate \
    +quit

# Following fixes per this post:
# https://forums.tornbanner.com/topic/21416/native-linux-server-available
arg GAME_PATH=/home/steam/Steam/steamapps/common/chivalry_ded_server/
run cp ${GAME_PATH}/steamclient.so ${GAME_PATH}/Binaries/Linux/lib/
run echo 219640 > ${GAME_PATH}/Binaries/Linux/steam_appid.txt

expose 8000/udp
expose 27015/udp

workdir ${GAME_PATH}/Binaries/Linux
cmd ./UDKGameServer-Linux \
    aocffa-moor_p\?steamsockets\?adminpassword=nobaddies\?port=8000\?queryport=27015 \
    -seekfreeloadingserver

