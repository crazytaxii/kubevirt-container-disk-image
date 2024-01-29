ORG ?= crazytaxii

.PHONY: builder-image

builder-image:
	docker build -t $(ORG)/container-disk-image-builder:latest -f Dockerfile.builder .
