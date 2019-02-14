from ubuntu:18.04

# Pull required packages
run apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates

# Clean up APT to save image space
run apt-get clean autoclean && \
    apt-get -y autoremove && \
    rm -fr /var/lib/{apt,dpkg,cache,log}

# Get the pre built version of the game
run mkdir -p /opt/teeworlds
arg TEE_VERSION=0.7.2
arg TEE_DOWNLOAD=https://github.com/teeworlds/teeworlds/releases/download/
arg TEE_TAR=teeworlds-${TEE_VERSION}-linux_x86_64.tar.gz
run wget ${TEE_DOWNLOAD}/${TEE_VERSION}/${TEE_TAR} && \
    tar -zxf ${TEE_TAR} --strip-components 1 -C /opt/teeworlds && \
    rm -f ${TEE_TAR}

expose 8303/udp

workdir /opt/tee

# Will use default server config or one mounted in /tee/cfg/server.cfg
cmd XDG_DATA_HOME=./local_data ./teeworlds_srv -f ./cfg/server.cfg
