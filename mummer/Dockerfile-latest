FROM    ubuntu

RUN     cd /tmp \
&&      apt-get update \
&&      apt-get install -y libgomp1 fig2dev gnuplot xfig \
&&      apt-get install -y wget build-essential \
&&      wget https://github.com/mummer4/mummer/releases/download/v4.0.0beta2/mummer-4.0.0beta2.tar.gz \
&&      tar xf mummer-4.0.0beta2.tar.gz \
&&      cd mummer-4.0.0beta2 \
&&      ./configure \
&&      make \
&&      make install \
&&      cd / \
&&      apt-get autoremove -y wget build-essential \
&&      rm -rf /tmp/* \
&&      rm -rf /var/lib/apt/lists/*

LABEL tool=mummer version=4.0.0beta2

WORKDIR /data
