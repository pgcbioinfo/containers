FROM    ubuntu:18.04

RUN     apt-get update \
&&      apt-get install -y wget build-essential zlib1g-dev libgomp1 \
&&      cd /tmp \
&&      wget http://catchenlab.life.illinois.edu/stacks/source/stacks-1.46.tar.gz \
&&      tar xf stacks-1.46.tar.gz \
&&      cd stacks-1.46 \
&&      ./configure \
&&      make \
&&      make install \
&&      cd / \
&&      apt-get autoremove -y wget build-essential zlib1g-dev\
&&      rm -rf /tmp/* \
&&      rm -rf /var/lib/apt/lists/*

LABEL tool=stacks version=1.46

WORKDIR /data
