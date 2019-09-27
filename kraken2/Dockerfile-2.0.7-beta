FROM 	pgcbioinfo/blast

RUN	apk add bash perl libstdc++ rsync libgomp \
&&	apk add build-base \
&&	cd /tmp \
&&	wget https://github.com/DerrickWood/kraken2/archive/v2.0.7-beta.tar.gz \
&&	tar xf v2.0.7-beta.tar.gz \
&&	cd kraken2-2.0.7-beta \
&&	mkdir -p /opt/kraken2 \
&&	./install_kraken2.sh /opt/kraken2 \
&&	ln -s /opt/kraken2/kraken2 /usr/local/bin/kraken2 \
&&	ln -s /opt/kraken2/kraken2-build /usr/local/bin/kraken2-build \
&&	ln -s /opt/kraken2/kraken2-inspect /usr/local/bin/kraken2-inspect \
&&	cd / \
&&	rm -rf /tmp/* \
&&	apk del build-base

LABEL	tool=kraken2 version=2.0.7-beta

WORKDIR	/data
