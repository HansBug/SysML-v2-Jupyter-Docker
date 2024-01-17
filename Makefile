.PHONY: build

DOCKER    ?= $(shell which docker)
IMAGE_TAG ?= hansbug/sysml-v2-jupyter

build:
	$(DOCKER) build -t ${IMAGE_TAG} .
