FROM    ubuntu:18.04

RUN     apt-get update \
&&      apt-get -y install wget unzip \
&&      cd /tmp \
&&      wget http://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20191028.zip \
&&      unzip plink_linux_x86_64_20191028.zip \
&&      cp plink prettify /usr/local/bin/ \
&&      cd / \
&&      apt-get -y autoremove wget unzip \
&&      rm -rf /tmp/* \
&&      rm -rf /var/apt/lists/*

LABEL	  tool=plink version=1.90b

WORKDIR /data
