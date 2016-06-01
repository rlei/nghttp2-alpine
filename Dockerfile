FROM alpine:3.3

# libxml2 and libjansson are not enabled as they're not needed for building nghttpd & nghttpx
RUN apk update \
    && apk add --no-cache openssl openssl-dev gcc g++ libgcc libstdc++ git jemalloc jemalloc-dev libev libev-dev autoconf automake make libtool \
    && git clone https://github.com/tatsuhiro-t/nghttp2.git \
    && cd nghttp2/ \
    && autoreconf -i && automake && autoconf && ./configure \
    && make && make install-strip \
    && cd .. && rm -rf nghttp2 \
    && apk del openssl-dev gcc g++ git jemalloc-dev libev-dev autoconf automake make libtool

