FROM 	alpine

RUN 	wget https://mafft.cbrc.jp/alignment/software/mafft-7.407-with-extensions-src.tgz \
&& 	gunzip -cd mafft-7.407-with-extensions-src.tgz | tar xfv - \
&& 	cd mafft-7.407-with-extensions/core \
&& 	apk add build-base \
&& 	apk add zlib-dev \
&& 	apk add bash \
&& 	make clean \
&& 	make \
&& 	make install \
&& 	cd / \
&& 	rm -rf /mafft-7.407-with-extensions \
&& 	apk del build-base \
&& 	apk del zlib-dev \
&& 	rm mafft-7.407-with-extensions-src.tgz

LABEL	tool=mafft version=7.407

WORKDIR	/data
