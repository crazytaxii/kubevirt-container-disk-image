ORG ?= crazytaxii
IMG_TAG ?= x86_64
export REPOSITORY = $(ORG)

.PHONY: builder-image fedora39 cirros62

all: fedora39 cirros62 rocky88

builder-image:
	docker build -t $(ORG)/container-disk-image-builder:latest -f Dockerfile.builder .

fedora39:
	IMG_URL=https://download.fedoraproject.org/pub/fedora/linux/releases/39/Cloud/x86_64/images/Fedora-Cloud-Base-39-1.5.x86_64.qcow2 \
	NAME=$@ TAG=$(IMG_TAG) ./build.sh

cirros62:
	IMG_URL=https://download.cirros-cloud.net/0.6.2/cirros-0.6.2-x86_64-disk.img \
	NAME=$@ TAG=$(IMG_TAG) ./build.sh

rocky88:
	IMG_URL=https://dl.rockylinux.org/vault/rocky/8.8/images/x86_64/Rocky-8-GenericCloud-Base-8.8-20230518.0.x86_64.qcow2 \
	NAME=$@ TAG=$(IMG_TAG) ./build.sh
