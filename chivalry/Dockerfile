from cm2network/steamcmd

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

run mkdir -p /home/steam/LANaaPaaS
run cd ${GAME_PATH}/UDKGame/Config && ln -fs /home/steam/LANaaPaaS

expose 8000/udp
expose 27015/udp

workdir ${GAME_PATH}/Binaries/Linux


cmd ./UDKGameServer-Linux \
    aocffa-moor_p\?steamsockets\?adminpassword=nobaddies\?port=8000\?queryport=27015 \
    -seekfreeloadingserver -configsubdir=LANaaPaaS
