#!/bin/bash
# Lancer en tant qu'utilisateur normal
exec sudo -E -u ubuntu /home/ubuntu/Pycharm/bin/pycharm "$@"
