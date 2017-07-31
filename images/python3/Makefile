PRIVATE_REGISTRY_URL=ro.lan:5000

DOCKER_IMAGE=cuongtransc/python
VERSION=3.5

all: build

build:
	docker build --tag=${DOCKER_IMAGE}:${VERSION} .

build-su:
	docker build --tag=${DOCKER_IMAGE}:${VERSION}-su -f Dockerfile_su .

push:
	docker push ${DOCKER_IMAGE}:${VERSION}

build-for-private-registry:
	docker build --tag=${PRIVATE_REGISTRY_URL}/${DOCKER_IMAGE}:${VERSION} .

push-for-private-registry:
	docker push ${PRIVATE_REGISTRY_URL}/${DOCKER_IMAGE}:${VERSION}

