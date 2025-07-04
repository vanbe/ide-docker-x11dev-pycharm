#!/bin/bash

docker start ide-pycharm-forem-infos-metiers-scrapper
docker exec -u root ide-pycharm-forem-infos-metiers-scrapper rm -f /home/ubuntu/.config/JetBrains/PyCharm2024.3/.lock