FROM	ubuntu:18.04

RUN     cd /opt \
&&      apt-get update \
&&      apt-get install -y wget python git \
&&      git clone https://github.com/jhcepas/eggnog-mapper.git \
&&      ln -s /opt/eggnog-mapper/download_eggnog_data.py /usr/local/bin \
&&      ln -s /opt/eggnog-mapper/emapper.py /usr/local/bin \
&&      apt-get autoremove -y git \
&&      rm -rf /tmp/* \
&&      rm -rf /var/lib/apt/lists/*

LABEL tool=eggnog-mapper version=master

WORKDIR /data
