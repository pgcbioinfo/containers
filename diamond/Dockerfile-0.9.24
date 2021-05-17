FROM 	alpine

RUN   cd /tmp \
&&    apk --no-cache --allow-untrusted -X https://apkproxy.herokuapp.com/sgerrand/alpine-pkg-glibc add glibc glibc-bin \
&&    wget https://github.com/bbuchfink/diamond/releases/download/v0.9.24/diamond-linux64.tar.gz \
&&    tar xf diamond-linux64.tar.gz \
&&	  cp diamond /usr/local/bin/diamond \
&&	  cd / \
&&	  rm -rf /tmp/*

LABEL	tool=diamond version=0.9.24

WORKDIR	/data
