#!/bin/sh
docker run -d -P -ti -e \
    DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    ads /home/app/ads/ApacheDirectoryStudio-linux-x86_64-2.0.0.v20130628/ApacheDirectoryStudio

