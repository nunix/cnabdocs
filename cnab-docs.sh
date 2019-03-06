#!/bin/sh

### PORTER VARIABLES ###
export DOCKER_SOURCE=docker
export DOCKER_APP_SOURCE="/usr/bin/docker-app"
export CNAB_DOCS_NAME=wslcnabdocs
export CNAB_DOCS_CONTAINER="$(${DOCKER_SOURCE} ps --format '{{.Names}}' | grep ${CNAB_DOCS_NAME})"
export CNAB_DOCS_VOLUME_NAME="volumes.data.name=${CNAB_DOCS_NAME}vol"
export CNAB_DOCS_PORT="port.server=8001"
export CNAB_DOCS_SOURCE="./index.md"
export CNAB_DOCS_DEST="${CNAB_DOCS_CONTAINER}:/opt"


### CALL PORTER ###
porter run --action $@ --file ./porter.yaml --debug