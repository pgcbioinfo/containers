FROM	ubuntu:18.04

RUN   apt-get update \
&&    apt-get -y install python \
&&    apt-get -y install wget python-pip \
&&    cd /tmp \
&&    wget https://github.com/CSB5/lofreq/archive/v2.1.3.1.tar.gz \
&&    tar xf v2.1.3.1.tar.gz \
&&    cd lofreq-2.1.3.1 \
&&    tar xf dist/lofreq_star-2.1.3.1_linux-x86-64.tgz \
&&    cp lofreq_star-2.1.3.1/bin/* /usr/local/bin/ \
&&    cp src/tools/scripts/* /usr/local/bin/ \
&&    cd / \
&&    pip install PyVCF \
&&    apt-get -y autoremove wget python-pip \
&&    rm -rf /tmp/* \
&&    rm -rf /var/lib/apt/lists/*

RUN   apt-get update \
&&    apt-get -y install python-numpy \
&&    rm -rf /var/lib/apt/lists/*

RUN   apt-get update \
&&    apt-get -y install python-matplotlib \
&&    rm -rf /var/lib/apt/lists/*

RUN   apt-get update \
&&    apt-get -y install python-scipy \
&&    rm -rf /var/lib/apt/lists/*

LABEL	tool=lofreq version=2.1.3.1

WORKDIR	/data
