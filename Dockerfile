FROM crazytaxii/container-disk-image-builder:latest as builder

ARG IMG_URL

ADD build-container-disk-image.sh .
RUN URL=${IMG_URL} ./build-container-disk-image.sh

FROM scratch
COPY --from=builder /opt/image.raw /disk/
