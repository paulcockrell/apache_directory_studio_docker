#!/bin/bash

IMAGENAME=$1

usage() {
  echo "Usage: $0 [image name]"
  exit 1
}

if [ -z $IMAGENAME ]
then
  echo "Error: missing image name parameter."
  usage
fi

PID=$(docker inspect --format {{.State.Pid}} $IMAGENAME)
sudo nsenter -m -u -n -i -p -t $PID