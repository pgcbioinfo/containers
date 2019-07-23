FROM    ubuntu

RUN	cd /tmp \
&&	apt-get update \
&&	apt-get install -y wget \
&&	apt-get install -y bedtools \
&&	apt-get upgrade -y perl \
&&	wget https://github.com/tseemann/barrnap/archive/0.9.tar.gz \
&&	tar xf 0.9.tar.gz \
&&	mv ./barrnap-0.9 /opt/ \
&&	ln -s /opt/barrnap-0.9/bin/* /usr/local/bin \
&&	cd / \
&&	apt autoremove -y wget \
&&	rm -rf /tmp/* \
&&	rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
&&	apt-get update \
&&	apt-get install -y wget \
&&	wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.9.0/ncbi-blast-2.9.0+-x64-linux.tar.gz \
&&	tar xf ncbi-blast-2.9.0+-x64-linux.tar.gz \
&&	cp -r ncbi-blast-2.9.0+/bin/* /usr/local/bin/ \
&&	cd / \
&&	apt-get autoremove -y wget \
&&	rm -rf /tmp/* \
&&	rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
&&	apt-get update \
&&	apt-get install -y wget make gcc \
&&	wget http://eddylab.org/infernal/infernal-1.1.2-linux-intel-gcc.tar.gz \
&&	tar xf infernal-1.1.2-linux-intel-gcc.tar.gz \
&&	cd infernal-1.1.2-linux-intel-gcc \
&&	./configure	\
&&	make \
&&	make install \
&&	cd easel \
&&	make install \
&&	cd / \
&&	apt-get autoremove -y wget make gcc \
&&	rm -rf /tmp/* \
&&	rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
&&	apt-get update \
&&	apt-get install -y wget make gcc \
&&	wget http://eddylab.org/software/hmmer/hmmer.tar.gz \
&&	tar zxf hmmer.tar.gz \
&&	cd hmmer-3.2.1 \
&&	./configure \
&&	make \
&&	make check \
&&	make install \
&&	cd / \
&&	apt-get autoremove -y wget make gcc \
&&	rm -rf /tmp/* \
&&	rm -rf /var/lib/apt/lists/*

RUN	cd /tmp \
&&	apt-get update \
&&	apt-get install -y wget \
&&	apt-get install -y openjdk-11-jre-headless \
&&	apt-get install -y --no-install-recommends less libdatetime-perl libxml-simple-perl libdigest-md5-perl bioperl \
&&	wget http://www.vicbioinformatics.com/prokka-1.12.tar.gz \
&&	tar xf prokka-1.12.tar.gz \
&&	./prokka-1.12/bin/prokka --setupdb \
&&	mv ./prokka-1.12 /opt/ \
&&	ln -s /opt/prokka-1.12/bin/* /usr/local/bin \
&&	cd / \
&&	apt autoremove -y wget \
&&	rm -rf /tmp/* \
&&	rm -rf /var/lib/apt/lists/*

RUN	cd /tmp \
&&	apt-get update \
&&	apt-get install -y wget \
&&	wget ftp://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux.tbl2asn.gz \
&&	gunzip linux.tbl2asn.gz \
&&	mv linux.tbl2asn tbl2asn \
&&	chmod +x tbl2asn \
&&	mv tbl2asn /opt/prokka-1.12/binaries/linux/ \
&&	cd / \
&&	apt autoremove -y wget \
&&	rm -rf /tmp/* \
&&	rm -rf /var/lib/apt/lists/*

LABEL tool=prokka version=1.12.0

WORKDIR /data