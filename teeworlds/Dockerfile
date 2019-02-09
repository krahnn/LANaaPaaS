from ubuntu:18.04

run apt update && apt -y install wget

# Get the pre built version of the game
arg TEE_VERSION=0.7.2
arg TEE_DOWNLOAD=https://github.com/teeworlds/teeworlds/releases/download/
arg TEE_TAR=teeworlds-${TEE_VERSION}-linux_x86_64.tar.gz
run wget ${TEE_DOWNLOAD}/${TEE_VERSION}/${TEE_TAR} && tar -zxf ${TEE_TAR}

# Assume tar has top level directory and link it to a more generic tee directory
run ln -fs $(tar -tf ${TEE_TAR} | head -1) tee
workdir tee
run mkdir tee_time

expose 8303/udp

cmd XDG_DATA_HOME=./tee_time ./teeworlds_srv -f ./cfg/server.cfg
