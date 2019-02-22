from cm2network/steamcmd

# Download the server via SteamCMD
arg GAME_ID=740
arg GAME_PATH=/home/steam/Steam/steamapps/common/csgo_server
run /home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir ${GAME_PATH} \
    +app_update ${GAME_ID} validate \
    +quit

#run cp ${GAME_PATH}/steamclient.so ${GAME_PATH}/Binaries/Linux/lib/
#run echo 219640 > ${GAME_PATH}/Binaries/Linux/steam_appid.txt

#run mkdir -p /home/steam/LANaaPaaS
#run cd ${GAME_PATH}/UDKGame/Config && ln -fs /home/steam/LANaaPaaS

#expose 8000/udp
#expose 27015/udp

#workdir ${GAME_PATH}/Binaries/Linux


workdir /home/steam/Steam/steamapps/csgo-dedicated

#cmd ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace +map ar_shoots

