#!/usr/bin/env bash

set -a

: ${POSTGRES_USER:="user"}
: ${POSTGRES_PASSWORD:="password"}
: ${POSTGRES_DB:="mydb"}
: ${POSTGRES_CONTAINER_NAME:="my_little_postgre"}
: ${PGDATA=/var/lib/postgresql/data/pgdata}
: ${POSTGRES_INITDB_ARGS=AZURE_DATA}
: ${HOST_VOLUME:=/custom/mount}
: ${CONTAINER_VOLUME:=/var/lib/postgresql/data}

docker run \
    -it \
    --net=host \
    --name=${POSTGRES_CONTAINER_NAME} \
    --restart=unless-stopped \
    --detached \
    -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -e POSTGRES_DB=${POSTGRES_DB} \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
	-e POSTGRES_INITDB_ARGS=AZURE_DATA \
	-v ${HOST_VOLUME}:${CONTAINER_VOLUME} \
	postgres