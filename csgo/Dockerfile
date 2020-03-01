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

run \
{ \
  echo "@ShutdownOnFailedCommand 1"; \
  echo "@NoPromptForPassword 1"; \
  echo "login anonymous"; \
  echo "force_install_dir ${GAME_PATH}"; \
  echo "app_update 740"; \
  echo "quit"; \
} > ${GAME_PATH}/csgo_update.txt

env SRCDS_FPSMAX=300 \
    SRCDS_TICKRATE=128 \
    SRCDS_PORT=27015 \
    SRCDS_TV_PORT=27020 \
    SRCDS_MAXPLAYERS=14 \
    SRCDS_RCONPW="nobaddies" 

workdir ${GAME_PATH}

expose 27015 27020 27005 51840

cmd ./srcds_run -game csgo -console -autoupdate -steam_dir /home/steam/steamcmd/ -steamcmd_script ${GAME_PATH}/csgo_update.txt -usercon -fps_max $SRCDS_FPSMAX -tickrate $SRCDS_TICKRATE -port $SRCDS_PORT -tv_port $SRCDS_TV_PORT -maxplayers_override $SRCDS_MAXPLAYERS -game_type 0 +game_mode 1 -mp_warmuptime 30 -mapgroup mg_active -map de_dust2 -rcon_password $SRCDS_RCONPW
