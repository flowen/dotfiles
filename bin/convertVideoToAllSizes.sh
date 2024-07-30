#!/bin/bash

input="$1"

ffmpeg -i "$input" -vf scale=1920:1080 "${input}_1080.mp4" && \
ffmpeg -i "$input" -vf scale=1280:720 "${input}_720.mp4" && \
ffmpeg -i "$input" -vf scale=854:480 "${input}_480.mp4"
