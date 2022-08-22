#! /bin/sh

docker run --gpus all -it --shm-size 128G --group-add users --name 'swyoon_docker' \
    -v ~/swyoon:/opt/swyoon \
    -v /raid1:/opt/home3 \
    -p 19999-20009:8888-8898 -p 10000:6006 \
    swyoon/swyoon:v2022

# swyoon/swyoon:cuda101_1003

