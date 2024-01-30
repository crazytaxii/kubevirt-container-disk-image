FROM alpine:3.19

RUN apk update && \
    apk add wget qemu-img jq bash
