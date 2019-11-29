FROM    ubuntu:18.04

RUN     cd /tmp \
&&      apt-get update \
&&      apt-get install -y wget g++ make \
&&      apt-get install -y libgomp1 \
&&      wget https://github.com/loneknightpy/idba/releases/download/1.1.3/idba-1.1.3.tar.gz \
&&      tar xf idba-1.1.3.tar.gz \
&&      cd idba-1.1.3 \
&&      ./configure \
&&      make \
&&      cd .. \
&&      mv idba-1.1.3 /opt/idba \
&&      ln -s /opt/idba/bin/idba_ud /usr/local/bin \
&&      cd / \
&&      apt autoremove -y wget g++ make \
&&      rm -rf /tmp/* \
&&      rm -rf /var/lib/apt/list/*

LABEL   tool=idba version=1.1.3

WORKDIR /data
