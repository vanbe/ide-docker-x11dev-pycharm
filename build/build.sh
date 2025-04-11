#!/bin/bash

docker build -t pycharm-downloader:latest -f pycharm-downloader.Dockerfile .
docker build -t pycharm:latest .
