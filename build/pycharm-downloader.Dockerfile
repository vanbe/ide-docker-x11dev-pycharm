# Étape 1 : Téléchargement de Pycharm
FROM alpine:latest as pycharm-downloader
RUN apk add --no-cache wget tar bash

ARG Pycharm_VERSION=2024.3.5

WORKDIR ${/root/}

RUN wget -qO- https://download.jetbrains.com/python/pycharm-professional-${Pycharm_VERSION}.tar.gz -O /tmp/Pycharm.tar.gz

RUN mkdir /tmp/Pycharm && \
        tar -xzf /tmp/Pycharm.tar.gz -C /tmp/Pycharm --strip-components=1 && \
        mv /tmp/Pycharm /root/ && \
        rm -rf /tmp/* 
        
