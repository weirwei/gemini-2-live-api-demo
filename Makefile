VERSION ?= $(shell cat ./VERSION)
docker-image-build:
	docker build -t geminilive:${VERSION} .

docker-run:
	docker run -p 80:80 -d geminilive:${VERSION}
