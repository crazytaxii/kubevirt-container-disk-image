ORG ?= crazytaxii
IMG_TAG ?= x86_64
export REPOSITORY = $(ORG)

.PHONY: builder-image fedora39

builder-image:
	docker build -t $(ORG)/container-disk-image-builder:latest -f Dockerfile.builder .

fedora39:
	IMG_URL=https://download.fedoraproject.org/pub/fedora/linux/releases/39/Cloud/x86_64/images/Fedora-Cloud-Base-39-1.5.x86_64.qcow2 \
	NAME=$@ TAG=$(IMG_TAG) ./build.sh
