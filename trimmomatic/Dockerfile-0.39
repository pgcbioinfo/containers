FROM    ubuntu:18.04

RUN     cd /tmp \
&&      apt-get update \
&&	apt-get install -y openjdk-11-jre-headless \
&&      apt-get install -y wget unzip \
&&	wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip \
&&	unzip Trimmomatic-0.39.zip \
&&	mv Trimmomatic-0.39 /opt/trimmomatic \
&&	ln -s /opt/trimmomatic/trimmomatic-0.39.jar /opt/trimmomatic/trimmomatic.jar \
&&	cd / \
&&	apt autoremove -y wget unzip \
&&	rm -rf /tmp/* \
&&	rm -rf /var/lib/apt/lists/*

LABEL tool=trimmomatic version=0.39

WORKDIR /data
