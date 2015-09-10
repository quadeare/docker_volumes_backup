#!/bin/bash
# This script allows you to backup all volumes from a container in a tar.gz file

CONTAINER_NAME=$1
VOLUMES=$(docker inspect --format='{{range $vol, $path := .Config.Volumes}}{{$vol}} {{end}}' $CONTAINER_NAME)
DATE=$(date +"%d-%b-%Y_%H-%M-%S")
FILENAME=$CONTAINER_NAME"_"$DATE.tar.gz

echo "Backup docker's volume(s) from : "$CONTAINER_NAME

usage() {
  echo "Usage: $0 [container name]"
  exit 1
}

if [ -z $CONTAINER_NAME ]
then
  echo "Error: missing container name parameter."
  usage
fi

printf "\n"
echo "Pause docker container : "$CONTAINER_NAME
docker pause $CONTAINER_NAME >> /dev/null

echo "Backup datas from "$CONTAINER_NAME" container"
docker run --rm --volumes-from $CONTAINER_NAME -v $(pwd):/backup ubuntu tar -P -czf /backup/$FILENAME $VOLUMES >> /dev/null

echo "Unpause docker container : "$CONTAINER_NAME
docker unpause $CONTAINER_NAME >> /dev/null

echo "Output file name : "$FILENAME

echo "Done."
