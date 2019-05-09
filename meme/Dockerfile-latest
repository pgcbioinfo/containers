FROM 	alpine

RUN     apk add zlib perl \ 
&&      apk add build-base zlib-dev \
&&      cd /tmp \
&&      wget http://meme-suite.org/meme-software/5.0.5/meme-5.0.5.tar.gz \
&&      tar xf meme-5.0.5.tar.gz \
&&      cd meme-5.0.5 \
&&      ./configure --prefix=/usr/local \
&&      make \
&&      make install \ 
&&      cd / \
&&      rm -rf /tmp/* \
&&      apk del build-base zlib-dev

RUN     apk add perl-time-hires perl-xml-parser

LABEL	tool=meme version=5.0.5

WORKDIR	/data
