#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --no-cache --build-arg "NODE_VERSION=${NODE_VERSION}" -t "chitezh/meteord:base-node-${NODE_VERSION}" ../base && \
  docker tag "chitezh/meteord:base-node-${NODE_VERSION}" chitezh/meteord:base
docker build --no-cache --build-arg "NODE_VERSION=${NODE_VERSION}" -t "chitezh/meteord:onbuild-node-${NODE_VERSION}" ../onbuild && \
  docker tag "chitezh/meteord:onbuild-node-${NODE_VERSION}" chitezh/meteord:onbuild
docker build --no-cache --build-arg "NODE_VERSION=${NODE_VERSION}" -t "chitezh/meteord:devbuild-node-${NODE_VERSION}" ../devbuild && \
  docker tag "chitezh/meteord:devbuild-node-${NODE_VERSION}" chitezh/meteord:devbuild
docker build --no-cache --build-arg "NODE_VERSION=${NODE_VERSION}" -t "chitezh/meteord:binbuild-node-${NODE_VERSION}" ../binbuild && \
  docker tag "chitezh/meteord:binbuild-node-${NODE_VERSION}" chitezh/meteord:binbuild

docker login -e ochu.kc@gmail.com -u chitezh -p ochu.kc@gmail.com


docker push chitezh/meteord:base
docker push chitezh/meteord:devbuild
docker push chitezh/meteord:latest