FROM	alpine

RUN	cd /tmp \
&&	wget https://github.com/stamatak/standard-RAxML/archive/v8.2.12.tar.gz \
&&	tar xf v8.2.12.tar.gz \
&&	cd standard-RAxML-8.2.12 \
&&	apk add build-base \
&&	make -f Makefile.SSE3.PTHREADS.gcc \
&&	cp raxmlHPC-PTHREADS-SSE3 /usr/local/bin \
&&	ln -s raxmlHPC-PTHREADS-SSE3 /usr/local/bin/raxmlHPC \
&&	rm -rf /tmp/* \
&&	apk del build-base

WORKDIR	/data
