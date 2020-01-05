DOCKER_IMAGE=rust_wasm
PROJECT_NAME=wasm-game-of-life

all: docker_build

.PHONY=docker_build
docker_build:
	echo "Build"
	docker build . -t ${DOCKER_IMAGE}
	echo "Run"
	docker run --rm \
	    -v $(shell pwd):/opt/share \
	    -w /opt/share \
	    $(DOCKER_IMAGE) \
	    /bin/bash -c \
           "if [ ! -d ${PROJECT_NAME} ]; then USER=$(shell id -u) cargo generate --force --git https://github.com/rustwasm/wasm-pack-template --name ${PROJECT_NAME}; fi && \
           cd ${PROJECT_NAME} && \
           cp ../src/*.rs src && \
           cp ../Cargo.toml . && \
           USER=$(shell id -u) wasm-pack build && \
           if [ ! -d www ]; then npm init wasm-app www --verbose; fi && \
           cd www && \
           cp ../../www/* . && \
           cp -rf ../pkg . && \
           npm install && \
           ./node_modules/.bin/webpack"

run:
	echo "Run npm server directly"
	cd ${PROJECT_NAME} && \
	cd www && \
	echo Running... && \
	npm run start

docker_run:
	echo "Run npm server with docker"
	docker run --rm -d \
	    -v $(shell pwd)/${PROJECT_NAME}/www:/opt/share \
	    -w /opt/share \
	    -p 8080:8080 \
	    $(DOCKER_IMAGE) \
	    /bin/bash -c \
           "echo Running... && \
           npm run start"

clean:
	rm -rf ${PROJECT_NAME}
