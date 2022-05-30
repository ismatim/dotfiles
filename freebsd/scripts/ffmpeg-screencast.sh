#!/usr/local/bin/bash

FNAMEBASE=/tmp/out

ffmpeg -video_size 1920x1080 -framerate 18 -f x11grab -i :0.0 -preset ultrafast -qp 0 -y $FNAMEBASE.mp4
