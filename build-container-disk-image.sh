#!/bin/bash

set -e

set tmpdir

main() {
    if [ -z $URL ]; then
        echo "URL is not set"
        exit 1
    fi
    tmpdir=$(mktemp -d)
    pushd $tmpdir
    wget -q $URL
    img_file=$(ls)
    # get image information with qemu-img
    info=$(qemu-img info $img_file --output json)
    if [[ "$(jq '.format' <<< $info)" == "\"qcow2\"" ]]; then
        # convert qcow2 image to raw disk format
        qemu-img convert -S 0 -t writeback -p -O raw $img_file /opt/image.raw
    else
        cp $img_file /opt/image.raw
    fi
    chmod 400 /opt/image.raw
}

main "$@"
