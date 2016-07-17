PRIVATE_REGISTRY_URL=ro.lan:5000

DOCKER_IMAGE=test/nginx
VERSION=1.10

all: build

build:
	docker build --tag=${DOCKER_IMAGE}:${VERSION} .

push:
	docker push ${DOCKER_IMAGE}:${VERSION}

build-for-private-registry:
	docker build --tag=${PRIVATE_REGISTRY_URL}/${DOCKER_IMAGE}:${VERSION} .

push-for-private-registry:
	docker push ${PRIVATE_REGISTRY_URL}/${DOCKER_IMAGE}:${VERSION}

