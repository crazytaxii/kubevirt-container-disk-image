#!/bin/bash

set -e

main() {
    if [ -z $REPOSITORY ]; then
        echo "REPOSITORY is not set"
        exit 1
    elif [ -z $NAME ]; then
        echo "NAME is not set"
        exit 1
    elif [ -z $TAG ]; then
        echo "TAG is not set"
        exit 1
    elif [ -z $IMG_URL ]; then
        echo "IMG_URL is not set"
        exit 1
    fi

    docker build -t ${REPOSITORY}/${NAME}:${TAG} -f Dockerfile --build-arg IMG_URL=${IMG_URL} .
    docker push ${REPOSITORY}/${NAME}:${TAG}
}

main "$@"
