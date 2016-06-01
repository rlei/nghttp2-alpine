# nghttp2-alpine

Minimal [nghttp2](https://github.com/nghttp2/nghttp2) docker image with ALPN support - only 10MB in size.

Based on the fantastic tiny little [Alpine Linux](https://hub.docker.com/_/alpine/).

## How to run

Just

    $ docker run --rm -t rickl/nghttp2-alpine <nghttp | nghttpd | nghttpx>


## Caveats

To make this image really small, libxml2 and libjansson are not enabled during the building.

This means:

* `nghttp -a` (getting linked assets from the downloaded resource) is not supported
* The `hpack` tool is not built

