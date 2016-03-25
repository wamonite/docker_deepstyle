FROM ubuntu:14.04
MAINTAINER Warren Moore <warren@wamonite.com>

RUN \
    apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    export DEBCONF_NONINTERACTIVE_SEEN=true && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl wget git libprotobuf-dev protobuf-compiler man && \
    rm -rf /var/lib/apt/lists/*

RUN \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.1/dumb-init_1.0.1_amd64 && \
    chmod +x /usr/local/bin/dumb-init

# Uncomment below to enable Intel MKL
#RUN \
#    cd /tmp && \
#    wget http://registrationcenter-download.intel.com/akdlm/irc_nas/8374/l_mkl_11.3.1.150.tgz && \
#    tar -xzf l_mkl_11.3.1.150.tgz && \
#    cd l_mkl_11.3.1.150 && \
#    sed -i 's/ACCEPT_EULA=decline/ACCEPT_EULA=accept/g' silent.cfg && \
#    sed -i 's/ACTIVATION_TYPE=exist_lic/ACTIVATION_TYPE=trial_lic/g' silent.cfg && \
#    ./install.sh -s silent.cfg && \
#    echo "/opt/intel/mkl/lib/intel64" >> /etc/ld.so.conf.d/intel.conf && \
#    ldconfig && \
#    rm -rf /tmp/l_mkl_11.3.1.150*
#
#RUN \
#    export CMAKE_INCLUDE_PATH=/opt/intel/mkl/include && \
#    export CMAKE_LIBRARY_PATH=/opt/intel/mkl/lib/intel64:/opt/intel/mkl/compiler/lib/intel64 && \
#    export LD_LIBRARY_PATH=$CMAKE_LIBRARY_PATH:$LD_LIBRARY_PATH && \
#    git clone https://github.com/torch/distro.git /opt/torch --recursive && \
#    cd /opt/torch && \
#    /bin/bash install-deps && \
#    ./install.sh && \
#    rm -rf /var/lib/apt/lists/*

# Comment this RUN command when enabling Intel MKL
RUN \
    git clone https://github.com/torch/distro.git /opt/torch --recursive && \
    cd /opt/torch && \
    /bin/bash install-deps && \
    ./install.sh && \
    rm -rf /var/lib/apt/lists/*

RUN \
    . /opt/torch/install/bin/torch-activate && \
    luarocks install loadcaffe && \
    luarocks install image && \
    luarocks install nn

RUN \
    mkdir -p /opt/deepstyle/in /opt/deepstyle/out && \
    cd /opt/deepstyle && \
    git clone https://github.com/jcjohnson/neural-style.git && \
    cd /opt/deepstyle/neural-style && \
    sh models/download_models.sh

WORKDIR /opt/deepstyle/neural-style

ENV \
    IMAGE_STYLE="" \
    IMAGE_CONTENT="" \
    NUM_ITERATIONS=1000

COPY run_deepstyle.sh /usr/local/bin

CMD ["run_deepstyle.sh"]
